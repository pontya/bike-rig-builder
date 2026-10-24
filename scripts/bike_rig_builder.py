# -*- coding: utf-8 -*-
"""
bike_rig_builder.py -- Bike Rig Builder 2.0 (Maya 2022+, tested on 2027)

Place the guide locators on the bike, press Build, get the motorcycle game rig.

    import bike_rig_builder; bike_rig_builder.show()

What the rig does
  Root / Drive / COG / Wheelie / Stoppie / Body / Steer, front + rear WheelBump and Wheel,
  levers / mirrors / pedals / stand.
  * Body_ctrl ty / rx: the loaded tyre stays on its contact point (dive keeps the front, squat keeps the rear)
  * tyres always stay on the ground (fork slides, swing arm rotates)
  * WheelBump ty: front slides along the fork, rear moves perpendicular to the swing arm
  * automatic wheel roll (wheelRoll plugin node) + no tread slip on wheelie / pitch
  * controllers only use translate / rotate (autoRoll is the only extra attribute)

How it is built
  guides -> a driver skeleton (BikeRig_skel, clean frames) -> controllers drive the driver skeleton
  -> the model's joints follow the driver skeleton (parent constraints, kept in RigSystem|Constraints).
  Wheel joints get their spin connected directly, so baked keys stay continuous (no +-180 flips).

Conventions: centimetres, the bike faces +Z, Y up, the rider's left side is +X.
Naming: Front_ / Rear_ = front / rear of the bike, L_ / R_ = left / right side.
"""
import json
import math
import os
import sys

import maya.cmds as cmds
import maya.api.OpenMaya as om

VERSION = '2.0'
GUIDE_GRP = 'BikeRig_guides'
RIG_GRP = 'BikeRig'
NODESET = 'BikeRig_nodes'
CTRLSET = 'BikeRig_ctrls_SET'
CONSTRAINT_GRP = 'Constraints'
WIN = 'bikeRigBuilderWin'
SHAPES_FILE = 'bike_rig_shapes.json'      # tuned controller shapes, read automatically when next to this script
# optional controller shape kit (cs_shape_tools); set BIKE_RIG_SHAPE_KIT to its folder. Built-in shapes are used otherwise.
PONPOKO_PATH = os.environ.get('BIKE_RIG_SHAPE_KIT', os.path.expanduser('~/maya/scripts/ControllerShapes'))
REF_WHEELBASE = 147.5232                   # wheelbase (cm) of the default guides: controller shape sizes scale from it

YEL = (1.0, 0.82, 0.1); ORG = (1.0, 0.5, 0.1); GRN = (0.35, 0.95, 0.35); PUR = (0.75, 0.45, 1.0)
CYN = (0.2, 0.85, 1.0); BLU = (0.2, 0.45, 1.0); RED = (1.0, 0.2, 0.2); LYEL = (1.0, 1.0, 0.55)

# ------------------------------------------------------------------ guides
# key: (default position cm, colour index, label)
CORE_GUIDES = [
    ('root', (0.0, 0.0, 0.0), 17, 'Root (ground, between the tyres)'),
    ('body', (0.0, 57.15, 17.15), 13, 'Body / COG pivot'),
    ('steerTop', (0.0, 94.11, 51.75), 21, 'Steering axis top'),
    ('steerBottom', (0.0, 66.13, 63.83), 21, 'Steering axis bottom'),
    ('frontAxle', (0.0, 32.47, 81.42), 18, 'Front axle'),
    ('rearAxle', (0.0, 34.50, -66.08), 18, 'Rear axle'),
    ('swingPivot', (0.0, 34.75, -12.48), 14, 'Swing arm pivot'),
    ('shockTop', (0.0, 70.10, -8.18), 9, 'Rear shock top (optional)'),
    ('shockBottom', (0.0, 57.13, -28.75), 9, 'Rear shock bottom (optional)'),
]
REQUIRED = ('root', 'body', 'steerTop', 'steerBottom', 'frontAxle', 'rearAxle', 'swingPivot')

# part: pivot, tip, default hinge ('steer' = steering axis, 'lat' = lateral X), driver parent, sides, controller channel.
# The hinge is the pivot guide's local Z (blue) once the guide is rotated.
# Right side: + on the controller is the mirror image of + on the left side.
PART_GUIDES = [
    ('lever', (16.8, 89.0, 58.8), (30.5, 83.8, 55.5), 'steer', 'steer', ('L', 'R'), 'ry'),
    ('mirror', (32.6, 88.4, 47.2), (39.6, 86.0, 42.7), 'steer', 'steer', ('L', 'R'), 'ry'),
    ('pedal', (15.2, 22.9, 1.5), (15.2, 30.5, -18.3), 'lat', 'body', ('L', 'R'), 'rz'),
    ('stand', (15.2, 23.8, -12.8), (24.4, 23.8, -33.5), 'lat', 'body', ('L',), 'rx'),
]
PART_CTRL = {'lever': ('Lever', BLU, RED), 'mirror': ('Mirror', BLU, RED), 'pedal': ('Pedal', BLU, RED),
             'stand': ('Stand', LYEL, LYEL)}

# roles of the model's joints (the joint map). Only the roles that are filled are driven.
ROLES = ['root', 'body', 'steer', 'forkSlide', 'wheelF', 'swingarm', 'wheelR', 'shockTop', 'shockBottom',
         'L_lever', 'R_lever', 'L_mirror', 'R_mirror', 'L_pedal', 'R_pedal', 'L_stand']
# joint names used when the scene has a skeleton with these names (rig/bike_rig.ma)
DEFAULT_JOINT_MAP = {'root': 'rootJnt', 'body': 'bodyJnt', 'steer': 'steerJnt', 'forkSlide': 'Front_Piston1Jnt',
                     'wheelF': 'Front_wheelJnt', 'swingarm': 'Rear_ForkJnt', 'wheelR': 'Rear_WheelJnt',
                     'shockTop': 'Rear_PistonJnt', 'shockBottom': 'Rear_Piston2Jnt',
                     'L_lever': 'L_BrakeJnt', 'R_lever': 'R_BrakeJnt', 'L_mirror': 'L_Mirror2Jnt', 'R_mirror': 'R_Mirror2Jnt',
                     'L_pedal': 'L_Pedal_1', 'R_pedal': 'R_Pedal_1', 'L_stand': 'standJnt'}


def gname(key):
    return 'guide_' + key


# ------------------------------------------------------------------ small helpers
def V(p):
    return om.MVector(p[0], p[1], p[2])


def wpos(n):
    return cmds.xform(n, q=True, ws=True, t=True)


def wmat(n):
    return om.MMatrix(cmds.xform(n, q=True, ws=True, m=True))


def tmat(p):
    m = om.MMatrix()
    m.setElement(3, 0, p[0]); m.setElement(3, 1, p[1]); m.setElement(3, 2, p[2])
    return m


def axis_of(m, i):
    return om.MVector(m.getElement(i, 0), m.getElement(i, 1), m.getElement(i, 2))


def frame(x, y, z, p):
    return om.MMatrix([x.x, x.y, x.z, 0, y.x, y.y, y.z, 0, z.x, z.y, z.z, 0, p[0], p[1], p[2], 1])


def frame_xz(xdir, zhint, p):
    """right-handed frame: X along xdir, Z as close as possible to zhint"""
    x = om.MVector(xdir).normal()
    y = (om.MVector(zhint) ^ x).normal()
    z = (x ^ y).normal()
    return frame(x, y, z, p)


def rot_only(m):
    m = om.MMatrix(m)
    return om.MMatrix([m[0], m[1], m[2], 0, m[4], m[5], m[6], 0, m[8], m[9], m[10], 0, 0, 0, 0, 1])


def node(typ, name, **attrs):
    n = cmds.createNode(typ, n=name, ss=True)
    for k, v in attrs.items():
        if isinstance(v, (list, tuple)):
            cmds.setAttr(n + '.' + k, *v)
        else:
            cmds.setAttr(n + '.' + k, v)
    return n


def con(a, b):
    cmds.connectAttr(a, b, f=True)


def lock(c, keep):
    for a in ('tx', 'ty', 'tz', 'rx', 'ry', 'rz', 'sx', 'sy', 'sz', 'v'):
        if a not in keep:
            cmds.setAttr(c + '.' + a, lock=True, keyable=False, channelBox=False)


def mirror_x(v):
    return om.MVector(-v.x, v.y, v.z)


def guide_rotated(key):
    n = gname(key)
    return cmds.objExists(n) and any(abs(x) > 1e-6 for x in cmds.getAttr(n + '.r')[0])


def guide_axis_z(key):
    return axis_of(wmat(gname(key)), 2).normal()


def set_guide_axis_z(key, z):
    """orient a guide so its local Z (blue) points along z (keeps its position)"""
    n = gname(key)
    z = om.MVector(z).normal()
    up = om.MVector(0, 1, 0) if abs(z.y) < 0.9 else om.MVector(0, 0, 1)
    x = (up ^ z).normal(); y = (z ^ x).normal()
    p = wpos(n)
    cmds.xform(n, ws=True, m=[x.x, x.y, x.z, 0, y.x, y.y, y.z, 0, z.x, z.y, z.z, 0, p[0], p[1], p[2], 1])


def guide_pos(key):
    n = gname(key)
    return wpos(n) if cmds.objExists(n) else None


# ------------------------------------------------------------------ guide creation
def _make_guide(key, pos, color, label, parent, size):
    n = gname(key)
    if cmds.objExists(n):
        return n
    loc = cmds.spaceLocator(n=n)[0]
    cmds.parent(loc, parent)
    cmds.xform(loc, ws=True, t=pos)
    sh = cmds.listRelatives(loc, s=True)[0]
    for a in ('localScaleX', 'localScaleY', 'localScaleZ'):
        cmds.setAttr(sh + '.' + a, size)
    cmds.setAttr(sh + '.overrideEnabled', 1); cmds.setAttr(sh + '.overrideColor', color)
    cmds.addAttr(loc, ln='guideLabel', dt='string'); cmds.setAttr(loc + '.guideLabel', label, type='string')
    ann = cmds.annotate(loc, tx=key, p=(pos[0], pos[1] + size * 1.4, pos[2]))
    ann = cmds.rename(cmds.listRelatives(ann, p=True)[0], n + '_label')
    cmds.parent(ann, loc); cmds.setAttr(ann + '.t', 0, size * 1.4, 0)
    ash = cmds.listRelatives(ann, s=True)[0]
    cmds.setAttr(ash + '.overrideEnabled', 1); cmds.setAttr(ash + '.overrideDisplayType', 2)
    return loc


def create_guides(*_):
    if not cmds.objExists(GUIDE_GRP):
        cmds.createNode('transform', n=GUIDE_GRP)
    cmds.setAttr(GUIDE_GRP + '.visibility', 1)
    for key, pos, col, label in CORE_GUIDES:
        g = _make_guide(key, pos, col, label, GUIDE_GRP, 7.5)
        if key in ('frontAxle', 'rearAxle') and not cmds.attributeQuery('radius', n=g, ex=True):
            cmds.addAttr(g, ln='radius', at='double', min=0.01, dv=max(1.0, pos[1]), k=True)
        if key == 'root' and not cmds.attributeQuery('tyreProfile', n=g, ex=True):
            # Drive_ctrl leans about the tyre cross-section centre, this high above the ground
            cmds.addAttr(g, ln='tyreProfile', at='double', min=0, dv=8.2296, k=True)
    for part, piv, tip, hinge, parent, sides, chan in PART_GUIDES:
        for s in sides:
            sg = 1 if s == 'L' else -1
            col = 6 if s == 'L' else 13
            pg = _make_guide('%s_%s' % (s, part), (piv[0] * sg, piv[1], piv[2]), col, '%s %s pivot' % (s, part),
                             GUIDE_GRP, 3.6)
            cmds.setAttr(pg + '.displayLocalAxis', 1)
            _make_guide('%s_%s_tip' % (s, part), (tip[0] * sg, tip[1], tip[2]), col, '%s %s tip' % (s, part), GUIDE_GRP, 2.4)
    cmds.select(GUIDE_GRP)
    cmds.inViewMessage(amg=u'ガイドを作成しました。バイクの各部に合わせて配置してください（+Z が前）', pos='topCenter', fade=True)


def mirror_guides_LR(*_):
    """copy every L_ part guide to its R_ twin (mirrored across X=0)"""
    for part, piv, tip, hinge, parent, sides, chan in PART_GUIDES:
        if 'R' not in sides:
            continue
        for suf in ('', '_tip'):
            l, r = gname('L_%s%s' % (part, suf)), gname('R_%s%s' % (part, suf))
            if cmds.objExists(l) and cmds.objExists(r):
                p = wpos(l); cmds.xform(r, ws=True, t=(-p[0], p[1], p[2]))
                if suf == '' and guide_rotated('L_%s' % part):
                    set_guide_axis_z('R_%s' % part, mirror_x(guide_axis_z('L_%s' % part)))
                elif suf == '':
                    cmds.setAttr(r + '.r', 0, 0, 0)


# ------------------------------------------------------------------ controller shapes
def _fallback_points(shape):
    pi = math.pi
    if shape == 'csSquare':
        return [[(-1, 0, -1), (1, 0, -1), (1, 0, 1), (-1, 0, 1), (-1, 0, -1)]]
    if shape == 'csGearEight':
        return [[(math.cos(2 * pi * i / 32) * (1.0 if (i // 2) % 2 == 0 else 0.82), 0,
                  math.sin(2 * pi * i / 32) * (1.0 if (i // 2) % 2 == 0 else 0.82)) for i in range(33)]]
    if shape == 'csDirectionCircle':
        c = [(0.82 * math.cos(2 * pi * i / 24), 0, 0.82 * math.sin(2 * pi * i / 24)) for i in range(25)]
        return [c, [(-0.3, 0, 0.95), (0, 0, 1.26), (0.3, 0, 0.95)]]
    if shape == 'csRot180':
        arc = [(-0.87 * math.cos(t), 0, math.sin(t)) for t in [(-pi / 2) + pi * i / 16 for i in range(17)]]
        return [arc, [(-0.25, 0, 0.8), (0, 0, 1.0), (-0.25, 0, 1.2)], [(-0.25, 0, -0.8), (0, 0, -1.0), (-0.25, 0, -1.2)]]
    if shape == 'csDouble':
        return [[(0, 0, -1), (0, 0, 1)], [(-0.3, 0, 0.7), (0, 0, 1), (0.3, 0, 0.7)], [(-0.3, 0, -0.7), (0, 0, -1), (0.3, 0, -0.7)]]
    return [[(math.cos(2 * pi * i / 24), 0, math.sin(2 * pi * i / 24)) for i in range(25)]]


def _ponpoko():
    if PONPOKO_PATH not in sys.path and os.path.isdir(PONPOKO_PATH):
        sys.path.insert(0, PONPOKO_PATH)
    try:
        import cs_shape_tools
        return cs_shape_tools
    except Exception:
        return None


def _ncv(s):
    n = cmds.getAttr(s + '.spans')
    return n if cmds.getAttr(s + '.form') == 2 else n + cmds.getAttr(s + '.degree')


# ------------------------------------------------------------------ builder
class Builder(object):
    """Build the rig from the guides. mapping = {role: model joint} (see ROLES); empty = driver skeleton only."""

    def __init__(self, mapping=None, proxies=False, shapes_json=None, log=None):
        self.mapping = dict((k, v) for k, v in (mapping or {}).items() if v)
        self.do_proxies = proxies
        self.shapes_json = shapes_json
        self.ctrls = []
        self.log = log if log is not None else []
        self.shape_kit = _ponpoko()

    # -------------------------------------------------------------- pieces
    def ctrl(self, name, parent, matrix, shape, rgb, scale=(1, 1, 1), rot=(0, 0, 0), offset=(0, 0, 0),
             keep=('tx', 'ty', 'tz', 'rx', 'ry', 'rz')):
        """offset group (at matrix) + curve controller. shape is drawn in the XZ plane, then scale -> rot -> offset."""
        off = cmds.createNode('transform', n=name + '_offset', p=parent, ss=True)
        cmds.xform(off, ws=True, m=list(matrix))
        c = None
        if self.shape_kit:
            try:
                c = cmds.curve(n=name, d=1, p=[(0, 0, 0), (0.1, 0, 0)])
                c = cmds.parent(c, off, r=True)[0]
                cmds.select(c, r=True); self.shape_kit.apply(shape, mode='replace')
            except Exception:
                if c and cmds.objExists(c):
                    cmds.delete(c)
                c = None
        if c is None:
            pts = _fallback_points(shape)
            c = cmds.curve(n=name, d=1, p=pts[0])
            for extra in pts[1:]:
                e = cmds.curve(d=1, p=extra)
                cmds.parent(cmds.listRelatives(e, s=True)[0], c, r=True, s=True); cmds.delete(e)
            c = cmds.parent(c, off, r=True)[0]
        r = om.MEulerRotation([v * math.pi / 180.0 for v in rot]).asMatrix()
        for s in cmds.listRelatives(c, s=True, f=True) or []:
            for i in range(_ncv(s)):
                p = cmds.xform(s + '.cv[%d]' % i, q=True, os=True, t=True)
                v = om.MPoint(p[0] * scale[0], p[1] * scale[1], p[2] * scale[2]) * r
                cmds.xform(s + '.cv[%d]' % i, os=True, t=(v.x + offset[0], v.y + offset[1], v.z + offset[2]))
        for i, s in enumerate(cmds.listRelatives(c, s=True, f=True) or []):
            s = cmds.rename(s, name + 'Shape' + ('' if i == 0 else str(i)))
            cmds.setAttr(s + '.overrideEnabled', 1); cmds.setAttr(s + '.overrideRGBColors', 1)
            cmds.setAttr(s + '.overrideColorRGB', *rgb)
        cmds.select(cl=True)
        lock(c, keep)
        self.ctrls.append(c)
        return c

    def joint(self, name, parent, matrix):
        cmds.select(cl=True)
        j = cmds.joint(n=name)
        if parent:
            j = cmds.parent(j, parent)[0]
        cmds.xform(j, ws=True, m=list(matrix))
        cmds.makeIdentity(j, apply=True, r=True, s=True)
        cmds.setAttr(j + '.radius', self.S * 0.12)
        return j

    def to_ground(self, src, name):
        """matrix of src in the Stoppie_ctrl frame (= ground frame of the suspension, origin at the front axle)"""
        mm = node('multMatrix', name)
        con(src + '.worldMatrix[0]', mm + '.matrixIn[0]'); con(self.stoppie + '.worldInverseMatrix[0]', mm + '.matrixIn[1]')
        return mm

    # -------------------------------------------------------------- main
    def build(self):
        self._check()
        before = set(cmds.ls(long=True) or [])
        # rest values of the joints the rig will drive: restored by delete_rig (a disconnected plug keeps a stale value)
        self.rest = dict((j, [cmds.getAttr(j + '.' + a) for a in ('tx', 'ty', 'tz', 'rx', 'ry', 'rz')])
                         for j in self.mapping.values())
        self._read_guides()
        self._groups()
        self._driver_skeleton()
        self._main_stack()
        self._parts()
        self._rear_wheel()
        self._front_wheel()
        self._body_shift()
        self._wheels()
        self._drive_model()
        self._finish(before)
        return self.top

    def _check(self):
        miss = [k for k in REQUIRED if not cmds.objExists(gname(k))]
        if miss:
            raise RuntimeError(u'ガイドが足りません: ' + ', '.join(miss))
        if cmds.objExists(RIG_GRP):
            raise RuntimeError(u'リグがすでにあります。先に「リグを削除」してください')
        for r, j in self.mapping.items():
            if not cmds.objExists(j):
                raise RuntimeError(u'割り当てた Joint が見つかりません: %s -> %s' % (r, j))

    def _read_guides(self):
        G = self.G = dict((k, guide_pos(k)) for k, _, _, _ in CORE_GUIDES)
        root = G['root']
        # the ground-frame points of the axles sit on the rig's centre line (x = root x)
        self.fc = (root[0], G['frontAxle'][1], G['frontAxle'][2])
        self.rc = (root[0], G['rearAxle'][1], G['rearAxle'][2])
        if self.fc[2] <= self.rc[2]:
            raise RuntimeError(u'前輪軸が後輪軸より後ろにあります。バイクは +Z 向きに置いてください')
        self.fr = cmds.getAttr(gname('frontAxle') + '.radius')
        self.rr = cmds.getAttr(gname('rearAxle') + '.radius')
        self.profile = cmds.getAttr(gname('root') + '.tyreProfile')
        self.S = (self.fc[2] - self.rc[2]) / REF_WHEELBASE                     # size of the default shapes
        self.sax = (V(G['steerBottom']) - V(G['steerTop'])).normal()             # steering axis, pointing down
        self.steer_m = frame_xz(self.sax, om.MVector(-1, 0, 0), G['steerTop'])
        self.L = (V(G['rearAxle']) - V(G['swingPivot'])).length()               # swing arm length
        self.has_shock = bool(G['shockTop'] and G['shockBottom'])

    def _groups(self):
        self.top = cmds.createNode('transform', n=RIG_GRP)
        self.cgrp = cmds.createNode('transform', n='Controls', p=self.top)
        self.sgrp = cmds.createNode('transform', n='BikeRig_skel', p=self.top)
        self.rig = cmds.createNode('transform', n='RigSystem', p=self.top)
        self.cons = cmds.createNode('transform', n=CONSTRAINT_GRP, p=self.rig)
        cmds.setAttr(self.rig + '.v', 0)

    # -------------------------------------------------------------- driver skeleton
    def _driver_skeleton(self):
        """Clean frames: steer / fork slide along the steering axis, wheels and swing arm world aligned (+rx rolls forward)."""
        G, fc, rc = self.G, self.fc, self.rc
        self.j_root = self.joint('bike_root_jnt', self.sgrp, tmat(G['root']))
        self.j_body = self.joint('bike_body_jnt', self.j_root, tmat(G['body']))
        self.j_steer = self.joint('bike_steer_jnt', self.j_body, self.steer_m)
        slide = om.MMatrix(self.steer_m)
        fa = G['frontAxle']
        slide.setElement(3, 0, fa[0]); slide.setElement(3, 1, fa[1]); slide.setElement(3, 2, fa[2])
        self.j_slide = self.joint('bike_forkSlide_jnt', self.j_steer, slide)
        self.j_wheelF = self.joint('bike_wheelF_jnt', self.j_slide, tmat(fc))
        self.j_swing = self.joint('bike_swingarm_jnt', self.j_body, tmat(G['swingPivot']))
        self.j_wheelR = self.joint('bike_wheelR_jnt', self.j_swing, tmat(rc))
        if self.has_shock:
            d = (V(G['shockBottom']) - V(G['shockTop'])).normal()
            self.j_shockTop = self.joint('bike_shockTop_jnt', self.j_body, frame_xz(d, om.MVector(1, 0, 0), G['shockTop']))
            self.j_shockBottom = self.joint('bike_shockBottom_jnt', self.j_swing, frame_xz(-d, om.MVector(1, 0, 0), G['shockBottom']))
        # rest position of the axle across the fork (the slide only moves along the fork = local X)
        self.y0 = cmds.getAttr(self.j_slide + '.ty')
        self.z0 = cmds.getAttr(self.j_slide + '.tz')

    # -------------------------------------------------------------- Root / Drive / COG / Wheelie / Stoppie / Body / Steer
    def _main_stack(self):
        S, G, fc, rc = self.S, self.G, self.fc, self.rc
        body = G['body']
        root = self.root = self.ctrl('Root_ctrl', self.cgrp, tmat(G['root']), 'csSquare', YEL, scale=(190 * S, 1, 190 * S),
                                     keep=('tx', 'ty', 'tz', 'rx', 'ry', 'rz', 'sy'))
        for a in ('sx', 'sz'):          # uniform scale from sy
            cmds.setAttr(root + '.' + a, lock=False); con(root + '.sy', root + '.' + a); cmds.setAttr(root + '.' + a, lock=True)
        drive = self.drive = self.ctrl('Drive_ctrl', root, tmat(G['root']), 'csDirectionCircle', GRN, scale=(140 * S, 1, 140 * S))
        cmds.xform(drive, os=True, piv=(0, self.profile, 0))      # lean about the tyre cross-section centre
        cog = self.cog = self.ctrl('COG_ctrl', drive, tmat(body), 'csGearEight', ORG, scale=(30.5 * S, 1, 30.5 * S))
        wheelie = self.wheelie = self.ctrl('Wheelie_ctrl', cog, tmat(rc), 'csRot180', PUR, scale=(62.5 * S, 1, 62.5 * S),
                                           rot=(0, -90, 90), keep=('rx',))
        stoppie = self.stoppie = self.ctrl('Stoppie_ctrl', wheelie, tmat(fc), 'csRot180', PUR, scale=(59.4 * S, 1, 59.4 * S),
                                           rot=(0, 90, 90), keep=('rx',))
        # Body_auto receives the automatic fore-aft shift (see _body_shift); Body_ctrl stays glued to the chassis
        self.body_auto = cmds.createNode('transform', n='Body_auto', p=stoppie, ss=True)
        bodyc = self.bodyc = self.ctrl('Body_ctrl', self.body_auto, tmat(body), 'csDouble', YEL, scale=(9 * S, 1, 9 * S),
                                       rot=(90, 0, 0), keep=('ty', 'rx'))
        steer = self.steer = self.ctrl('Steer_ctrl', bodyc, self.steer_m, 'csDirectionCircle', ORG, scale=(15 * S, 1, 15 * S),
                                       rot=(0, 0, 90), offset=(-12.8 * S, 0, 0), keep=('rx',))
        for a in ('sx', 'sy', 'sz'):
            con(root + '.sy', self.sgrp + '.' + a)
        self.constrain(cmds.parentConstraint(drive, self.j_root, mo=True, n='bike_root_pc'))
        self.constrain(cmds.parentConstraint(bodyc, self.j_body, mo=True, n='bike_body_pc'))
        con(steer + '.rx', self.j_steer + '.rx')
        for c in (root, drive, cog):
            cmds.setAttr(c + '.rotateOrder', channelBox=True)

    # -------------------------------------------------------------- levers / mirrors / pedals / stand
    def _parts(self):
        for part, piv, tip, hinge, parent, sides, chan in PART_GUIDES:
            for s in sides:
                key = '%s_%s' % (s, part)
                if not (cmds.objExists(gname(key)) and cmds.objExists(gname(key + '_tip'))):
                    continue
                p0, p1 = V(guide_pos(key)), V(guide_pos(key + '_tip'))
                h = self._hinge(part, s, hinge)
                m = self._part_frame(p0, p1, h, chan)
                pj = self.j_steer if parent == 'steer' else self.j_body
                pc = self.steer if parent == 'steer' else self.bodyc
                j = self.joint('bike_%s_jnt' % key, pj, m)
                label, lcol, rcol = PART_CTRL[part]
                name = 'Stand_ctrl' if part == 'stand' else '%s_%s_ctrl' % (s, label)
                size = max(4.6 * self.S, (p1 - p0).length() * 0.6)
                c = self.ctrl(name, pc, m, 'csRot180', lcol if s == 'L' else rcol, scale=(size, 1, size),
                              rot={'rx': (0, 0, 90), 'ry': (0, 90, 0), 'rz': (90, 0, 0)}[chan], keep=(chan,))
                con(c + '.' + chan, j + '.' + chan)

    def _hinge(self, part, side, default):
        """hinge axis: the pivot guide's local Z when it was rotated, else the default; R = mirror image of L"""
        key = '%s_%s' % (side, part)
        if guide_rotated(key):
            z = guide_axis_z(key)
            return z if side == 'L' else -z
        if guide_rotated('L_%s' % part):
            hl = guide_axis_z('L_%s' % part)
        else:
            hl = -self.sax if default == 'steer' else om.MVector(1, 0, 0)
        return hl if side == 'L' else -mirror_x(hl)

    @staticmethod
    def _part_frame(p0, p1, h, chan):
        """controller / driver frame: the hinge on the channel's axis, the next axis towards the tip"""
        aim = p1 - p0
        aim = aim - h * (aim * h)
        aim = aim.normal() if aim.length() > 1e-6 else (om.MVector(0, 0, 1) - h * h.z).normal()
        h = h.normal()
        p = (p0.x, p0.y, p0.z)
        if chan == 'rx':                      # X = hinge, Y = aim
            return frame(h, aim, (h ^ aim).normal(), p)
        if chan == 'ry':                      # Y = hinge, X = aim
            return frame(aim, h, (aim ^ h).normal(), p)
        return frame(aim, (h ^ aim).normal(), h, p)     # rz: Z = hinge, X = aim

    # -------------------------------------------------------------- rear wheel
    def _rear_wheel(self):
        """Rear_WheelBump_ctrl rides on the axle; ty moves the axle perpendicular to the swing arm.
        The swing arm aims at the wheel; the follow solves where the axle can be (circle around the pivot)."""
        S, fc, rc, L = self.S, self.fc, self.rc, self.L
        follow = cmds.createNode('transform', n='Rear_Wheel_follow', p=self.stoppie, ss=True)
        cmds.setAttr(follow + '.ty', rc[1] - fc[1])
        bump = self.rbump = self.ctrl('Rear_WheelBump_ctrl', follow, tmat(rc), 'csDouble', CYN, scale=(7.6 * S, 1, 7.6 * S),
                                      rot=(90, 0, 0), offset=(29 * S, 0, 0), keep=('ty',))
        cmds.xform(bump + '_offset', os=True, t=(0, 0, 0))
        self.rwheel = self.ctrl('Rear_Wheel_ctrl', bump, tmat(rc), 'csGearEight', CYN, scale=(self.rr * 1.38, 1, self.rr * 1.38),
                                rot=(0, 0, 90), offset=(18.9 * S, 0, 0), keep=('rx',))
        cmds.xform(self.rwheel + '_offset', os=True, t=(0, 0, 0))

        # bump direction: perpendicular to the swing arm (in its plane), pointing up, in the follow's frame
        arm = V(self.G['rearAxle']) - V(self.G['swingPivot'])
        d = (arm ^ om.MVector(1, 0, 0)).normal()
        d = d if d.y > 0 else -d
        dl = d * wmat(follow).inverse()
        dl = om.MVector(dl.x, dl.y, dl.z).normal()
        cmds.setAttr(bump + '_offset.rx', math.degrees(math.atan2(-dl.z, dl.y)))

        # axle height in the ground frame = rest + vertical part of the bump
        along_y = node('multDoubleLinear', 'Rear_bump_alongY', input2=dl.y); con(bump + '.ty', along_y + '.input1')
        h = node('addDoubleLinear', 'Rear_susp_h', input2=rc[1] - fc[1]); con(along_y + '.output', h + '.input1')
        # swing arm pivot in the ground frame (from parentMatrix + translate: no cycle)
        pw = node('pointMatrixMult', 'Rear_susp_pivot_w')
        con(self.j_swing + '.translate', pw + '.inPoint'); con(self.j_swing + '.parentMatrix[0]', pw + '.inMatrix')
        P = node('pointMatrixMult', 'Rear_susp_pivot')
        con(pw + '.output', P + '.inPoint'); con(self.stoppie + '.worldInverseMatrix[0]', P + '.inMatrix')
        # z = pivot.z - sqrt(L^2 - (h - pivot.y)^2)
        dy = node('plusMinusAverage', 'Rear_susp_dy', operation=2)
        con(h + '.output', dy + '.input1D[0]'); con(P + '.outputY', dy + '.input1D[1]')
        sq = node('multDoubleLinear', 'Rear_susp_dy2'); con(dy + '.output1D', sq + '.input1'); con(dy + '.output1D', sq + '.input2')
        rem = node('plusMinusAverage', 'Rear_susp_rem', operation=2); cmds.setAttr(rem + '.input1D[0]', L * L)
        con(sq + '.output', rem + '.input1D[1]')
        cl = node('clamp', 'Rear_susp_rem_clamp', maxR=L * L); con(rem + '.output1D', cl + '.inputR')
        rt = node('multiplyDivide', 'Rear_susp_sqrt', operation=3, input2X=0.5); con(cl + '.outputR', rt + '.input1X')
        z = node('plusMinusAverage', 'Rear_susp_z', operation=2)
        con(P + '.outputZ', z + '.input1D[0]'); con(rt + '.outputX', z + '.input1D[1]')
        # the follow takes the solved axle minus the horizontal part of the bump (the controller adds it back)
        xz = node('multiplyDivide', 'Rear_bump_xz')
        for a in 'XYZ':
            con(bump + '.ty', xz + '.input1' + a)
        cmds.setAttr(xz + '.input2', dl.x, 0, dl.z, type='double3')
        corr = node('plusMinusAverage', 'Rear_follow_corr', operation=2)
        con(P + '.outputX', corr + '.input3D[0].input3Dx'); con(z + '.output1D', corr + '.input3D[0].input3Dz')
        con(xz + '.output', corr + '.input3D[1]')
        con(corr + '.output3Dx', follow + '.tx'); con(corr + '.output3Dz', follow + '.tz')

        self.constrain(cmds.aimConstraint(self.rwheel, self.j_swing, mo=True, aim=(0, 0, -1), u=(0, 1, 0),
                                          wut='objectrotation', wuo=self.bodyc, wu=(0, 1, 0), skip=('y', 'z'),
                                          n='bike_swingarm_aim'))
        if self.has_shock:
            self.constrain(cmds.aimConstraint(self.j_shockBottom, self.j_shockTop, mo=True, aim=(1, 0, 0), u=(0, 0, 1),
                                              wut='objectrotation', wuo=self.bodyc, wu=(1, 0, 0), n='bike_shockTop_aim'))
            self.constrain(cmds.aimConstraint(self.j_shockTop, self.j_shockBottom, mo=True, aim=(1, 0, 0), u=(0, 0, 1),
                                              wut='objectrotation', wuo=self.bodyc, wu=(1, 0, 0), n='bike_shockBottom_aim'))

    # -------------------------------------------------------------- front wheel
    def _front_wheel(self):
        """Front_WheelBump_ctrl turns with the steering and rides on the axle; ty slides the axle along the fork."""
        S, fc = self.S, self.fc
        soff = cmds.createNode('transform', n='Front_Wheel_steer_offset', p=self.stoppie, ss=True)
        cmds.xform(soff, ws=True, m=list(self.steer_m))
        fsteer = cmds.createNode('transform', n='Front_Wheel_steer', p=soff, ss=True)
        con(self.steer + '.rx', fsteer + '.rx')
        follow = cmds.createNode('transform', n='Front_Wheel_follow', p=fsteer, ss=True)
        # the bump controller's frame: Y up along the fork, turning with the steering (body pitch, then steer)
        pos = cmds.createNode('transform', n='Front_WheelBump_pos', p=follow, ss=True)    # at the axle (follow origin)
        orient = cmds.createNode('transform', n='Front_WheelBump_orient', p=pos, ss=True)
        omm = node('multMatrix', 'Front_WheelBump_orient_mm')
        con(self.j_steer + '.worldMatrix[0]', omm + '.matrixIn[0]'); con(pos + '.worldInverseMatrix[0]', omm + '.matrixIn[1]')
        pick = node('pickMatrix', 'Front_WheelBump_orient_pick', useTranslate=0, useScale=0, useShear=0)
        con(omm + '.matrixSum', pick + '.inputMatrix'); con(pick + '.outputMatrix', orient + '.offsetParentMatrix')
        bump = self.fbump = self.ctrl('Front_WheelBump_ctrl', orient, tmat(fc), 'csDouble', CYN, scale=(7.6 * S, 1, 7.6 * S),
                                      rot=(90, 0, 0), offset=(27.4 * S, 0, 0), keep=('ty',))
        cmds.xform(bump + '_offset', os=True, t=(0, 0, 0))
        self.fwheel = self.ctrl('Front_Wheel_ctrl', bump, tmat(fc), 'csGearEight', CYN, scale=(self.fr * 1.38, 1, self.fr * 1.38),
                                rot=(0, 0, 90), offset=(16.8 * S, 0, 0), keep=('rx',))
        cmds.xform(self.fwheel + '_offset', os=True, t=(0, 0, 0))

        # fork slide s: the axle height (ground frame) = rest height + bump * (vertical part of the fork axis)
        M = self.to_ground(self.j_steer, 'Front_susp_M')
        base = node('pointMatrixMult', 'Front_susp_base', inPoint=(0, self.y0, self.z0)); con(M + '.matrixSum', base + '.inMatrix')
        ax = node('vectorProduct', 'Front_susp_axis', operation=3, input1=(1, 0, 0)); con(M + '.matrixSum', ax + '.matrix')
        sign = node('multDoubleLinear', 'Front_bump_sign', input2=-1.0); con(bump + '.ty', sign + '.input1')   # +ty = up = -axis
        along_y = node('multDoubleLinear', 'Front_bump_alongY'); con(sign + '.output', along_y + '.input1')
        con(ax + '.outputY', along_y + '.input2')
        hf = node('plusMinusAverage', 'Front_susp_h', operation=2)
        con(along_y + '.output', hf + '.input1D[0]'); con(base + '.outputY', hf + '.input1D[1]')
        s_ = node('multiplyDivide', 'Front_susp_s', operation=2)
        con(hf + '.output1D', s_ + '.input1X'); con(ax + '.outputY', s_ + '.input2X')
        con(s_ + '.outputX', self.j_slide + '.tx')
        # axle (ground frame) -> follow, without the bump part (the controller adds it back along its own Y)
        sxz = node('multiplyDivide', 'Front_susp_sxz')
        con(s_ + '.outputX', sxz + '.input1X'); con(s_ + '.outputX', sxz + '.input1Z')
        con(ax + '.outputX', sxz + '.input2X'); con(ax + '.outputZ', sxz + '.input2Z')
        axl = node('plusMinusAverage', 'Front_susp_axle')
        con(base + '.output', axl + '.input3D[0]'); con(sxz + '.output', axl + '.input3D[1]')
        neg = node('multDoubleLinear', 'Front_bump_neg', input2=-1); con(sign + '.output', neg + '.input1')
        off = node('multiplyDivide', 'Front_bump_axle_off')
        con(ax + '.outputX', off + '.input1X'); con(ax + '.outputZ', off + '.input1Z')
        con(neg + '.output', off + '.input2X'); con(neg + '.output', off + '.input2Z')
        rest = node('plusMinusAverage', 'Front_susp_axle_rest')
        con(axl + '.output3Dx', rest + '.input3D[0].input3Dx'); con(axl + '.output3Dz', rest + '.input3D[0].input3Dz')
        con(off + '.outputX', rest + '.input3D[1].input3Dx'); con(off + '.outputZ', rest + '.input3D[1].input3Dz')
        gm = node('multMatrix', 'Front_follow_M')
        con(self.stoppie + '.worldMatrix[0]', gm + '.matrixIn[0]'); con(fsteer + '.worldInverseMatrix[0]', gm + '.matrixIn[1]')
        fp = node('pointMatrixMult', 'Front_follow_p'); con(rest + '.output3D', fp + '.inPoint'); con(gm + '.matrixSum', fp + '.inMatrix')
        con(fp + '.output', follow + '.translate')

        # orient the bump offset: X lateral, Y up along the fork
        a = om.MVector(*cmds.getAttr(ax + '.output')[0]) * rot_only(wmat(self.stoppie))
        Y = -om.MVector(a.x, a.y, a.z).normal()
        X = om.MVector(1, 0, 0); Z = (X ^ Y).normal(); Y = (Z ^ X).normal()
        p = wpos(bump + '_offset')
        cmds.xform(bump + '_offset', ws=True, m=list(frame(X, Y, Z, p)))

    # -------------------------------------------------------------- body fore-aft shift
    def _body_shift(self):
        """Dive / sag keeps the FRONT contact, squat (nose up) keeps the REAR contact.
        A shadow of the chassis (same ty / rx, no shift, no steering) gives the fork line and pivot -> no DG cycle."""
        G, fc, rc, L = self.G, self.fc, self.rc, self.L
        nzo = cmds.createNode('transform', n='BodyNZ_offset', p=self.stoppie, ss=True); cmds.xform(nzo, ws=True, t=G['body'])
        nzb = cmds.createNode('transform', n='BodyNZ', p=nzo, ss=True)
        con(self.bodyc + '.ty', nzb + '.ty'); con(self.bodyc + '.rx', nzb + '.rx')
        nzf = cmds.createNode('transform', n='BodyNZ_fork', p=nzb, ss=True); cmds.xform(nzf, ws=True, m=list(self.steer_m))
        nzp = cmds.createNode('transform', n='BodyNZ_pivot', p=nzb, ss=True); cmds.xform(nzp, ws=True, t=G['swingPivot'])
        R0y, R0z = rc[1] - fc[1], rc[2] - fc[2]
        # front: where the fork line crosses the ground-frame axle height
        Mf = self.to_ground(nzf, 'BodyZ_fork_M')
        fb = node('pointMatrixMult', 'BodyZ_fork_base', inPoint=(0, self.y0, self.z0)); con(Mf + '.matrixSum', fb + '.inMatrix')
        fa = node('vectorProduct', 'BodyZ_fork_axis', operation=3, input1=(1, 0, 0)); con(Mf + '.matrixSum', fa + '.matrix')
        fneg = node('multDoubleLinear', 'BodyZ_fork_negy', input2=-1); con(fb + '.outputY', fneg + '.input1')
        fs = node('multiplyDivide', 'BodyZ_fork_s', operation=2); con(fneg + '.output', fs + '.input1X'); con(fa + '.outputY', fs + '.input2X')
        fsz = node('multDoubleLinear', 'BodyZ_fork_sz'); con(fs + '.outputX', fsz + '.input1'); con(fa + '.outputZ', fsz + '.input2')
        zff = node('plusMinusAverage', 'BodyZ_front_fixed', operation=2); cmds.setAttr(zff + '.input1D[0]', 0.0)
        con(fb + '.outputZ', zff + '.input1D[1]'); con(fsz + '.output', zff + '.input1D[2]')
        # rear: where the swing arm circle crosses the rear axle height
        Mp = self.to_ground(nzp, 'BodyZ_piv_M')
        pp = node('pointMatrixMult', 'BodyZ_piv_p'); con(Mp + '.matrixSum', pp + '.inMatrix')
        rdy = node('plusMinusAverage', 'BodyZ_rear_dy', operation=2); cmds.setAttr(rdy + '.input1D[0]', R0y); con(pp + '.outputY', rdy + '.input1D[1]')
        rsq = node('multDoubleLinear', 'BodyZ_rear_dy2'); con(rdy + '.output1D', rsq + '.input1'); con(rdy + '.output1D', rsq + '.input2')
        rrem = node('plusMinusAverage', 'BodyZ_rear_rem', operation=2); cmds.setAttr(rrem + '.input1D[0]', L * L); con(rsq + '.output', rrem + '.input1D[1]')
        rcl = node('clamp', 'BodyZ_rear_clamp', maxR=L * L); con(rrem + '.output1D', rcl + '.inputR')
        rrt = node('multiplyDivide', 'BodyZ_rear_sqrt', operation=3, input2X=0.5); con(rcl + '.outputR', rrt + '.input1X')
        zrf = node('plusMinusAverage', 'BodyZ_rear_fixed'); cmds.setAttr(zrf + '.input1D[0]', R0z); con(rrt + '.outputX', zrf + '.input1D[1]')
        pzn = node('multDoubleLinear', 'BodyZ_piv_negz', input2=-1); con(pp + '.outputZ', pzn + '.input1'); con(pzn + '.output', zrf + '.input1D[2]')
        # which tyre is loaded: front = sag (-ty) + nose down (+rx), rear = nose up (-rx); rx (deg) -> length at the axle
        k = abs(R0z) * math.pi / 180.0
        rxl = node('multDoubleLinear', 'BodyZ_rx_len', input2=k); con(self.bodyc + '.rx', rxl + '.input1')
        tyn = node('multDoubleLinear', 'BodyZ_ty_neg', input2=-1); con(self.bodyc + '.ty', tyn + '.input1')
        cl2 = node('clamp', 'BodyZ_load_clamp', minR=0, minG=0, minB=0, maxR=1e4, maxG=1e4, maxB=1e4)
        con(tyn + '.output', cl2 + '.inputR'); con(rxl + '.output', cl2 + '.inputG')
        rxn = node('multDoubleLinear', 'BodyZ_rx_neg', input2=-1); con(rxl + '.output', rxn + '.input1'); con(rxn + '.output', cl2 + '.inputB')
        cf = node('plusMinusAverage', 'BodyZ_load_front'); con(cl2 + '.outputR', cf + '.input1D[0]'); con(cl2 + '.outputG', cf + '.input1D[1]')
        sqv = node('multiplyDivide', 'BodyZ_load_sq')
        con(cf + '.output1D', sqv + '.input1X'); con(cf + '.output1D', sqv + '.input2X')
        con(cl2 + '.outputB', sqv + '.input1Y'); con(cl2 + '.outputB', sqv + '.input2Y')
        sm = node('plusMinusAverage', 'BodyZ_load_sum'); con(sqv + '.outputX', sm + '.input1D[0]'); con(sqv + '.outputY', sm + '.input1D[1]')
        eps = 0.09290304                    # (cm^2) below this the load is treated as zero (= 0.0001 ft^2 of the original rig)
        den = node('condition', 'BodyZ_w_den', operation=2, secondTerm=eps, colorIfFalseR=1.0)
        con(sm + '.output1D', den + '.firstTerm'); con(sm + '.output1D', den + '.colorIfTrueR')
        wdiv = node('multiplyDivide', 'BodyZ_w_div', operation=2); con(sqv + '.outputY', wdiv + '.input1X'); con(den + '.outColorR', wdiv + '.input2X')
        wc = node('condition', 'BodyZ_w', operation=2, secondTerm=eps, colorIfFalseR=0.0)
        con(sm + '.output1D', wc + '.firstTerm'); con(wdiv + '.outputX', wc + '.colorIfTrueR')
        zd = node('plusMinusAverage', 'BodyZ_diff', operation=2); con(zrf + '.output1D', zd + '.input1D[0]'); con(zff + '.output1D', zd + '.input1D[1]')
        zw = node('multDoubleLinear', 'BodyZ_wdiff'); con(zd + '.output1D', zw + '.input1'); con(wc + '.outColorR', zw + '.input2')
        zt = node('addDoubleLinear', 'BodyZ'); con(zff + '.output1D', zt + '.input1'); con(zw + '.output', zt + '.input2')
        con(zt + '.output', self.body_auto + '.tz')
        cmds.setAttr(nzo + '.v', 0)

    # -------------------------------------------------------------- wheels: auto roll + manual rx + tread compensation
    def _wheels(self):
        plug_ok = self._load_plugin()
        for w in (self.fwheel, self.rwheel):
            cmds.addAttr(w, ln='autoRoll', at='double', min=0, max=1, dv=1, k=True)
        self.spin = {}
        for side, center, pj, ctl, rad in (('Front', self.fc, self.j_slide, self.fwheel, self.fr),
                                           ('Rear', self.rc, self.j_swing, self.rwheel, self.rr)):
            self.spin[side] = self._wheel(side, center, pj, ctl, rad, plug_ok)
        con(self.spin['Front'], self.j_wheelF + '.rx')
        con(self.spin['Rear'], self.j_wheelR + '.rx')

    def _load_plugin(self):
        if cmds.pluginInfo('wheelRollNode', q=True, loaded=True):
            return True
        try:
            cmds.loadPlugin('wheelRollNode', qt=True)
            return True
        except Exception:
            self.log.append(u'wheelRollNode プラグインが見つからないため、自動回転なしで作りました（rX の手付けは使えます）')
            return False

    def _wheel(self, side, center, parent_jnt, ctl, radius, plug_ok):
        """returns the plug with the wheel's total spin (deg, + rolls forward)"""
        piv = cmds.createNode('transform', n=side + '_wheelRoll_piv', p=self.rig, ss=True)
        cmds.setAttr(piv + '.inheritsTransform', 0)
        mm = node('multMatrix', side + '_wheelRoll_mm')
        cmds.setAttr(mm + '.matrixIn[0]', list(tmat(center) * wmat(parent_jnt).inverse()), type='matrix')
        con(parent_jnt + '.worldMatrix[0]', mm + '.matrixIn[1]')
        con(mm + '.matrixSum', piv + '.offsetParentMatrix')
        add = node('addDoubleLinear', side + '_spin_add')
        con(ctl + '.rx', add + '.input2')
        if plug_ok:
            wr = cmds.createNode('wheelRoll', n=side + '_wheelRoll')
            rad = node('multDoubleLinear', side + '_radius_scale', input1=radius)
            con(self.root + '.sy', rad + '.input2'); con(rad + '.output', wr + '.radius')
            con(piv + '.worldMatrix[0]', wr + '.inMatrix')
            con('time1.outTime', wr + '.inTime')
            con(ctl + '.autoRoll', wr + '.autoRoll')
            con(wr + '.outAngle', add + '.input1')
            con(wr + '.outAngle', ctl + '.rotateAxisX')            # the gear on the controller turns with the tyre
            if cmds.attributeQuery('poseRoll', n=wr, ex=True):    # wheelRollNode 0.2+: rolls before the first key too
                cmds.setAttr(wr + '.restPosition', *wpos(piv))
                cmds.setAttr(wr + '.poseRoll', 1)
                con(self.drive + '.worldMatrix[0]', wr + '.headingMatrix')
                cmds.setAttr(wr + '.useHeading', 1)
        # a gripping tyre does not turn with the chassis: remove the wheel frame's pitch relative to COG
        mmc = node('multMatrix', side + '_pitch_M')
        con(piv + '.worldMatrix[0]', mmc + '.matrixIn[0]'); con(self.cog + '.worldInverseMatrix[0]', mmc + '.matrixIn[1]')
        fwd = node('vectorProduct', side + '_pitch_fwd', operation=3, input1=(0, 0, 1), normalizeOutput=1)
        con(mmc + '.matrixSum', fwd + '.matrix')
        ab = node('angleBetween', side + '_pitch_ab', vector1=(0, 0, 1)); con(fwd + '.output', ab + '.vector2')
        sub = node('plusMinusAverage', side + '_spin_comp', operation=2)
        con(add + '.output', sub + '.input1D[0]'); con(ab + '.eulerX', sub + '.input1D[1]')
        return sub + '.output1D'

    # -------------------------------------------------------------- model joints follow the driver skeleton
    def constrain(self, result):
        c = result[0] if isinstance(result, (list, tuple)) else result
        cmds.parent(c, self.cons)
        return c

    def _drive_model(self):
        src = {'root': self.j_root, 'body': self.j_body, 'steer': self.j_steer, 'forkSlide': self.j_slide,
               'swingarm': self.j_swing}
        if self.has_shock:
            src.update(shockTop=self.j_shockTop, shockBottom=self.j_shockBottom)
        for role, j in self.mapping.items():
            if role in ('wheelF', 'wheelR'):
                self._drive_wheel(role, j)
                continue
            s = src.get(role, 'bike_%s_jnt' % role)
            if not cmds.objExists(s):
                self.log.append(u'スキップ: %s（ガイドがないため駆動元がありません）' % role)
                continue
            self.constrain(cmds.parentConstraint(s, j, mo=True, n=j + '_pc'))
        if self.mapping.get('root'):
            par = cmds.listRelatives(self.mapping['root'], p=True, f=True)
            if par and cmds.nodeType(par[0]) == 'transform':
                for a in ('sx', 'sy', 'sz'):
                    if not cmds.listConnections(par[0] + '.' + a, s=True, d=False):
                        con(self.root + '.sy', par[0] + '.' + a)

    def _drive_wheel(self, role, j):
        """spin straight into the model's wheel joint (continuous values for baking) when its local X is the axle"""
        side = 'Front' if role == 'wheelF' else 'Rear'
        drv = self.j_wheelF if side == 'Front' else self.j_wheelR
        parent = cmds.listRelatives(j, p=True)
        follows = parent and parent[0] in (self.mapping.get('forkSlide' if side == 'Front' else 'swingarm'),)
        dot = axis_of(wmat(j), 0).normal() * axis_of(wmat(drv), 0).normal()
        if follows and abs(abs(dot) - 1.0) < 1e-4:
            if abs(dot + 1.0) < 1e-4:
                neg = node('multDoubleLinear', side + '_spin_neg', input2=-1)
                con(self.spin[side], neg + '.input1'); con(neg + '.output', j + '.rx')
            else:
                con(self.spin[side], j + '.rx')
        else:
            self.log.append(u'%s: 回転軸がローカル X ではないため、コンストレイントで駆動します' % j)
            self.constrain(cmds.parentConstraint(drv, j, mo=True, n=j + '_pc'))

    # -------------------------------------------------------------- shapes, sets, proxies
    def _finish(self, before):
        if self.shapes_json and os.path.exists(self.shapes_json):
            n = apply_shapes(self.shapes_json, self.ctrls)
            self.log.append(u'シェイプを読み込み: %d 個' % n)
        cmds.sets(self.ctrls, n=CTRLSET)
        if self.do_proxies:
            n = build_proxies(self.top)
            self.log.append(u'軽量表示メッシュ: %d 個' % n)
        cmds.addAttr(self.top, ln='builderVersion', dt='string'); cmds.setAttr(self.top + '.builderVersion', VERSION, type='string')
        cmds.addAttr(self.top, ln='jointMap', dt='string'); cmds.setAttr(self.top + '.jointMap', json.dumps(self.mapping), type='string')
        cmds.addAttr(self.top, ln='restPose', dt='string'); cmds.setAttr(self.top + '.restPose', json.dumps(self.rest), type='string')
        new = [n for n in (cmds.ls(long=True) or []) if n not in before]
        if new:
            cmds.sets(new, n=NODESET)
        cmds.select(cl=True)


# ------------------------------------------------------------------ display proxies (optional)
def build_proxies(top):
    """Light display: rigid parts follow their joint matrix directly, meshes blended over several joints
    are combined into one mesh with one skinCluster (same weights / bind pose = identical result)."""
    import maya.api.OpenMayaAnim as oma
    grp = cmds.createNode('transform', n='MeshProxy', p=top, ss=True)
    rigid, proxies = [], []
    for sc in cmds.ls(type='skinCluster'):
        sel = om.MSelectionList(); sel.add(sc); fn = oma.MFnSkinCluster(sel.getDependNode(0))
        path = fn.getPathAtIndex(0); comp = om.MFnSingleIndexedComponent().create(om.MFn.kMeshVertComponent)
        w, n = fn.getWeights(path, comp)
        used = set(i % n for i, x in enumerate(w) if x > 1e-4)
        if len(used) != 1:
            continue
        jnt = fn.influenceObjects()[used.pop()].partialPathName()
        idx = [k for k in cmds.getAttr(sc + '.matrix', mi=True) if (cmds.listConnections('%s.matrix[%d]' % (sc, k)) or [None])[0] == jnt][0]
        local = om.MMatrix(cmds.getAttr(sc + '.geomMatrix')) * om.MMatrix(cmds.getAttr('%s.bindPreMatrix[%d]' % (sc, idx)))
        src = cmds.listRelatives(path.fullPathName(), p=True)[0]
        dup = cmds.duplicate(src, n=src + '_proxy', rr=True)[0]
        for sh in cmds.listRelatives(dup, s=True, f=True) or []:
            if cmds.getAttr(sh + '.intermediateObject'):
                cmds.delete(sh)
        for ch in cmds.listRelatives(dup, c=True, type='transform', f=True) or []:
            cmds.delete(ch)
        for a in ('t', 'r', 's', 'tx', 'ty', 'tz', 'rx', 'ry', 'rz', 'sx', 'sy', 'sz'):
            cmds.setAttr(dup + '.' + a, lock=False)
        dup = cmds.parent(dup, grp)[0]
        cmds.setAttr(dup + '.inheritsTransform', 0)
        cmds.xform(dup, os=True, t=(0, 0, 0), ro=(0, 0, 0), s=(1, 1, 1), piv=(0, 0, 0))
        mm = node('multMatrix', src + '_proxy_mm')
        cmds.setAttr(mm + '.matrixIn[0]', list(local), type='matrix')
        con(jnt + '.worldMatrix[0]', mm + '.matrixIn[1]'); con(mm + '.matrixSum', dup + '.offsetParentMatrix')
        rigid.append(src); proxies.append(dup)
    blended = [(cmds.listRelatives(cmds.skinCluster(sc, q=True, g=True)[0], p=True)[0], sc) for sc in cmds.ls(type='skinCluster')]
    blended = [(t, sc) for t, sc in blended if t not in rigid and not t.startswith('MeshAnim')]
    if blended:
        rows, infl, dups = [], [], []
        for t, sc in blended:
            sel = om.MSelectionList(); sel.add(sc); fn = oma.MFnSkinCluster(sel.getDependNode(0))
            w, n = fn.getWeights(fn.getPathAtIndex(0), om.MFnSingleIndexedComponent().create(om.MFn.kMeshVertComponent))
            names = [x.partialPathName() for x in fn.influenceObjects()]
            for v in range(len(w) // n):
                row = dict((names[i], w[v * n + i]) for i in range(n) if w[v * n + i] > 1e-6)
                rows.append(row)
                for k in row:
                    if k not in infl:
                        infl.append(k)
            dp = cmds.duplicate(t, n=t + '_cmbsrc', rr=True)[0]
            for sh in cmds.listRelatives(dp, s=True, f=True) or []:
                if cmds.getAttr(sh + '.intermediateObject'):
                    cmds.delete(sh)
            for a in ('t', 'r', 's', 'tx', 'ty', 'tz', 'rx', 'ry', 'rz', 'sx', 'sy', 'sz'):
                cmds.setAttr(dp + '.' + a, lock=False)
            dups.append(dp)
        cmb = cmds.polyUnite(dups, n='MeshAnim_blended', ch=False, mergeUVSets=1)[0] if len(dups) > 1 else dups[0]
        cmds.delete([x for x in dups if cmds.objExists(x) and x != cmb])
        cmb = cmds.parent(cmb, grp)[0]
        skn = cmds.skinCluster(infl, cmb, tsb=True, n='MeshAnim_blended_skin', mi=4, nw=1)[0]
        sel = om.MSelectionList(); sel.add(skn); fn = oma.MFnSkinCluster(sel.getDependNode(0))
        names = [x.partialPathName() for x in fn.influenceObjects()]
        arr = om.MDoubleArray(len(rows) * len(names), 0.0)
        for v, row in enumerate(rows):
            for k, x in row.items():
                arr[v * len(names) + names.index(k)] = x
        comp = om.MFnSingleIndexedComponent(); co = comp.create(om.MFn.kMeshVertComponent); comp.setCompleteData(len(rows))
        fn.setWeights(fn.getPathAtIndex(0), co, om.MIntArray(range(len(names))), arr, False)
        rigid += [t for t, _ in blended]; proxies.append(cmb)
    if not proxies:
        return 0
    cmds.select(rigid, r=True); lay = cmds.createDisplayLayer(n='MeshRender_layer', nr=True)
    cmds.setAttr(lay + '.displayType', 2); cmds.setAttr(lay + '.visibility', 0)
    cmds.select(proxies, r=True); lay = cmds.createDisplayLayer(n='MeshAnim_layer', nr=True)
    cmds.setAttr(lay + '.displayType', 2)
    cmds.select(cl=True)
    return len(proxies)


# ------------------------------------------------------------------ shapes save / load
def save_shapes(path, ctrls=None):
    """save controller curves + colours (object space) and each offset's world matrix"""
    ctrls = ctrls or (cmds.sets(CTRLSET, q=True) if cmds.objExists(CTRLSET) else cmds.ls('*_ctrl', type='transform')) or []
    data = {}
    for c in ctrls:
        shp = []
        for s in cmds.listRelatives(c, s=True, f=True, type='nurbsCurve') or []:
            fn = om.MFnNurbsCurve(om.MSelectionList().add(s).getDagPath(0))
            shp.append({'degree': cmds.getAttr(s + '.degree'), 'form': cmds.getAttr(s + '.form'),
                        'cvs': [[q.x, q.y, q.z] for q in fn.cvPositions(om.MSpace.kObject)], 'knots': list(fn.knots()),
                        'ov': [cmds.getAttr(s + '.overrideEnabled'), cmds.getAttr(s + '.overrideRGBColors'),
                               list(cmds.getAttr(s + '.overrideColorRGB')[0]), cmds.getAttr(s + '.overrideColor')],
                        'lw': cmds.getAttr(s + '.lineWidth')})
        par = cmds.listRelatives(c, p=True)
        rest = list(cmds.xform(par[0], q=True, ws=True, m=True)) if par else None
        data[c.split('|')[-1]] = {'shapes': shp, 'rest': rest,
                                  'tov': [cmds.getAttr(c + '.overrideEnabled'), cmds.getAttr(c + '.overrideRGBColors'),
                                          list(cmds.getAttr(c + '.overrideColorRGB')[0]), cmds.getAttr(c + '.overrideColor')]}
    with open(path, 'w') as f:
        json.dump(data, f, indent=0)
    return len(data)


def apply_shapes(path, ctrls):
    """replace the curves of the given controllers, keeping the saved shapes' world orientation"""
    data = json.load(open(path))
    n = 0
    for c in ctrls:
        d = data.get(c)
        if not d:
            continue
        delta = om.MMatrix()
        par = cmds.listRelatives(c, p=True)
        if d.get('rest') and par:
            delta = rot_only(d['rest']) * rot_only(cmds.xform(par[0], q=True, ws=True, m=True)).inverse()
        old = cmds.listRelatives(c, s=True, f=True, type='nurbsCurve') or []
        if old:
            cmds.delete(old)
        parent = om.MSelectionList().add(c).getDependNode(0)
        for k, sh in enumerate(d['shapes']):
            pts = om.MPointArray([om.MPoint(p[0], p[1], p[2]) * delta for p in sh['cvs']])
            obj = om.MFnNurbsCurve().create(pts, sh['knots'], sh['degree'], sh['form'] + 1, False, True, parent)
            sn = cmds.rename(om.MFnDagNode(obj).fullPathName(), c + 'Shape' + ('' if k == 0 else str(k)))
            en, rgb, col, idx = sh['ov']
            cmds.setAttr(sn + '.overrideEnabled', en); cmds.setAttr(sn + '.overrideRGBColors', rgb)
            cmds.setAttr(sn + '.overrideColorRGB', *col); cmds.setAttr(sn + '.overrideColor', idx)
            cmds.setAttr(sn + '.lineWidth', sh['lw'])
        if d.get('tov'):
            en, rgb, col, idx = d['tov']
            cmds.setAttr(c + '.overrideEnabled', en); cmds.setAttr(c + '.overrideRGBColors', rgb)
            cmds.setAttr(c + '.overrideColorRGB', *col); cmds.setAttr(c + '.overrideColor', idx)
        n += 1
    return n


# ------------------------------------------------------------------ delete
def delete_rig(*_):
    if not cmds.objExists(RIG_GRP):
        cmds.warning(u'リグがありません'); return
    rest = {}
    if cmds.attributeQuery('restPose', n=RIG_GRP, ex=True):
        rest = json.loads(cmds.getAttr(RIG_GRP + '.restPose') or '{}')
    nodes = cmds.sets(NODESET, q=True) if cmds.objExists(NODESET) else []
    for lay in ('MeshRender_layer', 'MeshAnim_layer'):
        if cmds.objExists(lay):
            cmds.delete(lay)
    for extra in (RIG_GRP, CTRLSET):
        if cmds.objExists(extra):
            cmds.delete(extra)
    for n in nodes or []:
        if cmds.objExists(n):
            try:
                cmds.delete(n)
            except Exception:
                pass
    if cmds.objExists(NODESET):
        cmds.delete(NODESET)
    for j, vals in rest.items():          # the driven joints back to their rest values
        if cmds.objExists(j):
            for a, v in zip(('tx', 'ty', 'tz', 'rx', 'ry', 'rz'), vals):
                if not cmds.listConnections(j + '.' + a, s=True, d=False):
                    cmds.setAttr(j + '.' + a, v)
    cmds.inViewMessage(amg=u'リグを削除しました（ガイドは残っています）', pos='topCenter', fade=True)


# ------------------------------------------------------------------ UI
def _default_shapes():
    f = os.path.join(os.path.dirname(os.path.abspath(__file__)), SHAPES_FILE)
    return f if os.path.exists(f) else None


def _auto_mapping():
    """DEFAULT_JOINT_MAP when the scene has those joints; otherwise build the driver skeleton only"""
    m = DEFAULT_JOINT_MAP
    return dict(m) if all(cmds.objExists(j) for j in m.values()) else {}


def _ui_build(*_):
    if not cmds.objExists(GUIDE_GRP):
        cmds.confirmDialog(t='Bike Rig Builder', m=u'先に「1. ガイドを作成」してください', b=['OK'])
        return
    if cmds.objExists(RIG_GRP):
        if cmds.confirmDialog(t='Bike Rig Builder', m=u'リグが既にあります。作り直しますか？',
                              b=[u'作り直す', u'キャンセル'], db=u'作り直す', cb=u'キャンセル') != u'作り直す':
            return
        delete_rig()
    mapping = _auto_mapping()
    log = []
    cmds.undoInfo(openChunk=True, chunkName='Bike Rig Build')
    try:
        Builder(mapping, bool(mapping), _default_shapes(), log).build()
    except Exception as e:
        cmds.confirmDialog(t='Bike Rig Builder', m=u'ビルドできませんでした:\n%s' % e, b=['OK'])
        raise
    finally:
        cmds.undoInfo(closeChunk=True)
    cmds.setAttr(GUIDE_GRP + '.visibility', 0)
    msg = u'<hl>ビルド完了</hl>' + ((u'<br>' + u'<br>'.join(log)) if log else '')
    cmds.inViewMessage(amg=msg, pos='topCenter', fade=True)


def show():
    if cmds.window(WIN, ex=True):
        cmds.deleteUI(WIN)
    cmds.window(WIN, t='Bike Rig Builder %s' % VERSION, w=260, s=False)
    cmds.columnLayout(adj=True, rs=6, cat=('both', 8))
    cmds.separator(h=4, st='none')
    cmds.button(l=u'1. ガイドを作成', h=36, c=create_guides)
    cmds.text(l=u'+Z が前、Y が上、左側が +X（cm）。\nパーツの pivot を回すと青い軸がヒンジになる', al='left', fn='smallPlainLabelFont')
    cmds.button(l=u'2. 左 → 右にミラー', h=30, c=mirror_guides_LR)
    cmds.button(l=u'3. ビルド', h=44, bgc=(0.35, 0.55, 0.35), c=_ui_build)
    cmds.button(l=u'リグを削除', h=26, c=delete_rig)
    cmds.separator(h=4, st='none')
    cmds.showWindow(WIN)
