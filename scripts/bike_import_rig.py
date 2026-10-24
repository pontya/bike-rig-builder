# -*- coding: utf-8 -*-
"""
Bike Import Rig
Bakes joint animation (mocap, another rig, a game export...) back onto the bike rig's controllers.

    import bike_import_rig; bike_import_rig.show()

Source = a skeleton with the same joint names as the model (e.g. imported under the namespace "src").
Result = keys on Drive / COG / Steer / WheelBump / Wheel / part controllers.
Wheelie, Stoppie and Body stay at 0 so the animator can layer on top.
"""
import math
import maya.cmds as cmds
import maya.api.OpenMaya as om

VERSION = '2.0'
WIN = 'bikeImportRigWin'

# controller <- source joint, channels taken from it
TR_MAP = [('Drive_ctrl', 'rootJnt'), ('COG_ctrl', 'bodyJnt')]
ROT1_MAP = [('Steer_ctrl', 'steerJnt'),
            ('L_Lever_ctrl', 'L_BrakeJnt'), ('R_Lever_ctrl', 'R_BrakeJnt'),
            ('L_Mirror_ctrl', 'L_Mirror2Jnt'), ('R_Mirror_ctrl', 'R_Mirror2Jnt'),
            ('L_Pedal_ctrl', 'L_Pedal_1'), ('R_Pedal_ctrl', 'R_Pedal_1'),
            ('Stand_ctrl', 'standJnt')]
ZERO_CTRLS = ['Wheelie_ctrl', 'Stoppie_ctrl', 'Body_ctrl']
# bump controller, moving joint (axle), reference joint (space it slides in)
LIFT_MAP = [('Front_WheelBump_ctrl', 'Front_Piston1Jnt', 'steerJnt'), ('Rear_WheelBump_ctrl', 'Rear_Wheel1Jnt', 'bodyJnt')]
SPIN_MAP = [('Front_Wheel_ctrl', 'Front_wheelJnt'), ('Rear_Wheel_ctrl', 'Rear_WheelJnt')]


def _n(ns, name):
    return (ns.rstrip(':') + ':' + name) if ns else name


def _wm(node, t=None):
    if t is None:
        return om.MMatrix(cmds.getAttr(node + '.worldMatrix[0]'))
    return om.MMatrix(cmds.getAttr(node + '.worldMatrix[0]', time=t))


def _pos(m):
    return om.MVector(m[12], m[13], m[14])


def _rot_channels(ctrl):
    return [a for a in ('rx', 'ry', 'rz') if cmds.getAttr(ctrl + '.' + a, se=True)]


def _keyable(ctrl):
    return [a for a in (cmds.listAttr(ctrl, k=True, u=True) or []) if cmds.getAttr(ctrl + '.' + a, se=True)]


def find_source_namespaces():
    out = []
    for j in cmds.ls('*:bodyJnt', '*:*:bodyJnt', type='joint') or []:
        ns = j.rsplit(':', 1)[0]
        if cmds.objExists(_n(ns, 'rootJnt')) and not cmds.listConnections(j, s=True, d=False, type='constraint'):
            out.append(ns)
    return out


def _reset_ctrls(rig_ns, ctrls):
    for c in ctrls:
        c = _n(rig_ns, c)
        if not cmds.objExists(c):
            continue
        for a in _keyable(c):
            cmds.cutKey(c, at=a, cl=True)
            dv = cmds.attributeQuery(a, n=c, ld=True)
            if dv:
                try:
                    cmds.setAttr(c + '.' + a, dv[0])
                except RuntimeError:
                    pass


def _proxy(ctrl):
    """a transform next to the controller, with the same parent / pivots / rotate order"""
    par = cmds.listRelatives(ctrl, p=True, f=True)[0]
    p = cmds.createNode('transform', n=ctrl.split(':')[-1] + '_importPrx', p=par, ss=True)
    for a in ('rotateOrder', 'rotatePivot', 'rotatePivotTranslate', 'scalePivot', 'scalePivotTranslate', 'rotateAxis'):
        v = cmds.getAttr(ctrl + '.' + a)
        if isinstance(v, list):
            cmds.setAttr(p + '.' + a, *v[0])
        else:
            cmds.setAttr(p + '.' + a, v)
    return p


def _target_loc(src_joint, ctrl, rig_joint):
    """locator under the source joint that sits where the controller is when both skeletons are at rest"""
    loc = cmds.createNode('transform', n=ctrl.split(':')[-1] + '_importTgt', p=src_joint, ss=True)
    # constraints place the rotate pivot, not the origin: aim the locator at the controller's world pivot
    m = om.MMatrix(_wm(ctrl))
    rp = cmds.xform(ctrl, q=True, ws=True, rp=True)
    m.setElement(3, 0, rp[0]); m.setElement(3, 1, rp[1]); m.setElement(3, 2, rp[2])
    local = m * _wm(rig_joint).inverse()
    cmds.xform(loc, os=True, m=list(local))
    return loc


def _measure(mov, ref, t=None):
    return _pos(_wm(mov, t) * _wm(ref, t).inverse())


def import_animation(src_ns, rig_ns='', start=None, end=None, keep_auto_roll=True, log=None):
    log = log if log is not None else []
    if start is None:
        start = cmds.playbackOptions(q=True, min=True)
    if end is None:
        end = cmds.playbackOptions(q=True, max=True)
    start, end = int(math.floor(start)), int(math.ceil(end))
    R = lambda n: _n(rig_ns, n)
    S = lambda n: _n(src_ns, n)
    for c, j in TR_MAP:
        if not cmds.objExists(R(c)) or not cmds.objExists(S(j)):
            raise RuntimeError(u'%s または %s が見つかりません' % (R(c), S(j)))

    all_ctrls = [c for c, _ in TR_MAP + ROT1_MAP + SPIN_MAP] + [c for c, _, _ in LIFT_MAP] + ZERO_CTRLS
    temp = []
    cur = cmds.currentTime(q=True)
    auto = cmds.autoKeyframe(q=True, state=True)
    cmds.autoKeyframe(state=False)
    try:
        # ---------------- rest pose of the rig (all controllers at default)
        _reset_ctrls(rig_ns, all_ctrls)
        cmds.currentTime(start)

        # ---------------- full TRS + single rotation channels: constraint a proxy, connect, bake
        bake = []
        for c, j in TR_MAP + ROT1_MAP:
            c, rj, sj = R(c), R(j), S(j)
            if not (cmds.objExists(c) and cmds.objExists(rj) and cmds.objExists(sj)):
                log.append(u'スキップ: %s' % c.split(':')[-1])
                continue
            prx = _proxy(c); loc = _target_loc(sj, c, rj); temp += [prx, loc]
            if (c.split(':')[-1], j.split(':')[-1]) in [(a, b) for a, b in TR_MAP]:
                temp.append(cmds.parentConstraint(loc, prx)[0])
                chans = [a for a in ('tx', 'ty', 'tz', 'rx', 'ry', 'rz') if cmds.getAttr(c + '.' + a, se=True)]
            else:
                temp.append(cmds.orientConstraint(loc, prx)[0])
                chans = _rot_channels(c)[:1]
            for a in chans:
                cmds.connectAttr(prx + '.' + a, c + '.' + a, f=True)
                bake.append(c + '.' + a)
        cmds.bakeResults(bake, t=(start, end), simulation=True, sampleBy=1, disableImplicitControl=True,
                         preserveOutsideKeys=False, sparseAnimCurveBake=False, minimizeRotation=True)
        cmds.delete([n for n in temp if cmds.objExists(n)]); temp = []
        crv = [x for a in bake if a.split('.')[-1].startswith('r')
               for x in (cmds.listConnections(a, s=True, d=False, type='animCurve') or [])]
        if crv:
            cmds.filterCurve(crv)

        # ---------------- wheel bumps: invert a lookup table (bump ty -> axle position in its slide space)
        for c, mov, ref in LIFT_MAP:
            c = R(c)
            if not (cmds.objExists(c) and cmds.objExists(R(mov)) and cmds.objExists(S(mov))):
                continue
            cmds.currentTime(start)
            p0 = _measure(R(mov), R(ref))
            cmds.setAttr(c + '.ty', 0.1)
            d = _measure(R(mov), R(ref)) - p0
            nrm = d.normal() if d.length() > 1e-9 else om.MVector(0, 1, 0)
            span = 300 * d.length() if d.length() > 1e-9 else 30.0   # 300x the 0.1 probe: generous in any unit
            tys, ms = [], []
            for i in range(401):
                ty = -span + 2 * span * i / 400.0
                cmds.setAttr(c + '.ty', ty)
                tys.append(ty); ms.append((_measure(R(mov), R(ref)) - p0) * nrm)
            cmds.setAttr(c + '.ty', 0)
            if any(ms[i + 1] <= ms[i] for i in range(len(ms) - 1)):
                # keep the monotonic central part only
                k0 = 200
                lo = k0
                while lo > 0 and ms[lo - 1] < ms[lo]:
                    lo -= 1
                hi = k0
                while hi < 400 and ms[hi + 1] > ms[hi]:
                    hi += 1
                tys, ms = tys[lo:hi + 1], ms[lo:hi + 1]
            clamped = 0
            for f in range(start, end + 1):
                m = (_measure(S(mov), S(ref), f) - p0) * nrm
                if m <= ms[0]:
                    ty = tys[0]; clamped += 1
                elif m >= ms[-1]:
                    ty = tys[-1]; clamped += 1
                else:
                    i = max(i for i in range(len(ms) - 1) if ms[i] <= m)
                    w = (m - ms[i]) / (ms[i + 1] - ms[i])
                    ty = tys[i] + (tys[i + 1] - tys[i]) * w
                cmds.setKeyframe(c, at='ty', t=f, v=ty)
            if clamped:
                log.append(u'%s: %d フレームが可動範囲外（端で止めました）' % (c.split(':')[-1], clamped))

        # ---------------- wheels: auto roll stays, the difference goes into the manual rx
        if cmds.pluginInfo('wheelRollNode', q=True, loaded=True):
            try:
                cmds.wheelRollSync()
            except Exception:
                pass
        for c, j in SPIN_MAP:
            c, rj, sj = R(c), R(j), S(j)
            if not (cmds.objExists(c) and cmds.objExists(rj) and cmds.objExists(sj)):
                continue
            if cmds.attributeQuery('autoRoll', n=c, ex=True):
                cmds.setAttr(c + '.autoRoll', 1 if keep_auto_roll else 0)
                if cmds.pluginInfo('wheelRollNode', q=True, loaded=True):
                    try:
                        cmds.wheelRollSync()
                    except Exception:
                        pass
            ch = _rot_channels(c)[0]
            cmds.cutKey(c, at=ch, cl=True); cmds.setAttr(c + '.' + ch, 0)
            # which local axis of the rig joint turns with +manual rotation (and with which sign).
            # src = Y * rig  ->  Y = src * rig^-1 is a rotation in the joint's local frame
            cmds.currentTime(start)
            m0 = _wm(rj)
            cmds.setAttr(c + '.' + ch, 10); m1 = _wm(rj); cmds.setAttr(c + '.' + ch, 0)
            q = om.MTransformationMatrix(m1 * m0.inverse()).rotation(asQuaternion=True)
            v = [q.x, q.y, q.z]
            best = max(range(3), key=lambda k: abs(v[k]))
            sgn = 1 if v[best] > 0 else -1
            angs, prev = [], None
            for f in range(start, end + 1):
                cmds.currentTime(f)
                q = om.MTransformationMatrix(_wm(sj, f) * _wm(rj).inverse()).rotation(asQuaternion=True)
                if q.w < 0:
                    q = om.MQuaternion(-q.x, -q.y, -q.z, -q.w)
                ang = math.degrees(2 * math.atan2([q.x, q.y, q.z][best] * sgn, q.w))
                if prev is not None:
                    ang += 360.0 * round((prev - ang) / 360.0)
                prev = ang
                angs.append(ang)
            for f, ang in zip(range(start, end + 1), angs):
                cmds.setKeyframe(c, at=ch, t=f, v=ang)
    finally:
        if temp:
            cmds.delete([n for n in temp if cmds.objExists(n)])
        cmds.autoKeyframe(state=auto)
        cmds.currentTime(cur)
    return log


def check(src_ns, rig_ns='', start=None, end=None, step=1):
    """max world-space difference between the rig's joints and the source joints"""
    if start is None:
        start = cmds.playbackOptions(q=True, min=True)
    if end is None:
        end = cmds.playbackOptions(q=True, max=True)
    names = sorted(set([j for _, j in TR_MAP + ROT1_MAP + SPIN_MAP] + [m for _, m, _ in LIFT_MAP]))
    worst_t, worst_r = (0.0, ''), (0.0, '')
    for f in range(int(start), int(end) + 1, step):
        cmds.currentTime(f)
        for j in names:
            rj, sj = _n(rig_ns, j), _n(src_ns, j)
            if not (cmds.objExists(rj) and cmds.objExists(sj)):
                continue
            a, b = _wm(rj), _wm(sj)
            dt = (_pos(a) - _pos(b)).length()
            q = om.MTransformationMatrix(a * b.inverse()).rotation(asQuaternion=True)
            dr = math.degrees(2 * math.acos(min(1.0, abs(q.w))))
            if dt > worst_t[0]:
                worst_t = (dt, '%s f%d' % (j, f))
            if dr > worst_r[0]:
                worst_r = (dr, '%s f%d' % (j, f))
    return worst_t, worst_r


# ------------------------------------------------------------------ UI
def _ui_run(*_):
    src = cmds.optionMenu('bir_src', q=True, v=True) if cmds.optionMenu('bir_src', q=True, ni=True) else ''
    if not src:
        cmds.confirmDialog(t='Bike Import Rig', m=u'元の骨格（namespace 付き）が見つかりません', b=['OK']); return
    s = cmds.playbackOptions(q=True, min=True); e = cmds.playbackOptions(q=True, max=True)
    cmds.undoInfo(openChunk=True, chunkName='Bike Import')
    try:
        log = import_animation(src, '', s, e, cmds.checkBox('bir_auto', q=True, v=True))
    finally:
        cmds.undoInfo(closeChunk=True)
    (wt, wr) = check(src, '', s, e, step=max(1, int((e - s) / 50)))
    msg = u'インポート完了\n誤差: 位置 %.4f / 回転 %.3f°' % (wt[0], wr[0])
    if log:
        msg += '\n' + '\n'.join(log)
    cmds.confirmDialog(t='Bike Import Rig', m=msg, b=['OK'])


def _ui_refresh(*_):
    for i in cmds.optionMenu('bir_src', q=True, ill=True) or []:
        cmds.deleteUI(i)
    for ns in find_source_namespaces():
        cmds.menuItem(l=ns, p='bir_src')


def show():
    if cmds.window(WIN, ex=True):
        cmds.deleteUI(WIN)
    cmds.window(WIN, t='Bike Import Rig %s' % VERSION, w=280, s=False)
    cmds.columnLayout(adj=True, rs=6, cat=('both', 8))
    cmds.separator(h=4, st='none')
    cmds.text(l=u'Joint のアニメーションをコントローラーに焼き込みます。\n元の骨格は namespace 付きで読み込んでください。',
              al='left', fn='smallPlainLabelFont')
    cmds.rowLayout(nc=2, adj=1)
    cmds.optionMenu('bir_src', l=u'元の骨格')
    cmds.button(l=u'更新', c=_ui_refresh)
    cmds.setParent('..')
    cmds.checkBox('bir_auto', l=u'タイヤの自動回転を残す（差分だけ手付け）', v=True)
    cmds.button(l=u'インポート（タイムスライダーの範囲）', h=40, bgc=(0.35, 0.5, 0.6), c=_ui_run)
    cmds.separator(h=4, st='none')
    cmds.showWindow(WIN)
    _ui_refresh()
