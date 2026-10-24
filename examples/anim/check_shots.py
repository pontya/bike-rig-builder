# check_shots.py -- automatic review of a shot made with make_shots + follow-cam playblast.
import maya.cmds as cmds
import maya.api.OpenMaya as om
import math

NS = "bike:"
WHEELS = {"Front": ("Front_wheelJnt", "Front_radius_scale"), "Rear": ("Rear_WheelJnt", "Rear_radius_scale")}
CAMS = {"t03_wallride": (650, 180, -420), "t06_donut": (450, 380, -520), "t08_barrel_roll": (-650, 120, -150),
        "t07_stoppie_180": (-500, 180, 300)}


def _m(node, f):
    return om.MMatrix(cmds.getAttr(NS + node + ".worldMatrix[0]", time=f))


def contact_height(side, f):
    """Height of the lowest point of the tyre above the ground frame (= Drive_ctrl), cm."""
    j, rnode = WHEELS[side]
    r = cmds.getAttr(NS + rnode + ".output", time=f)
    m = _m(j, f); d = _m("Drive_ctrl", f)
    c = om.MVector(m[12], m[13], m[14]); a = om.MVector(m[0], m[1], m[2]).normal()
    o = om.MVector(d[12], d[13], d[14]); n = om.MVector(d[4], d[5], d[6]).normal()
    v = -n + a * (a * n)
    v = v.normal() if v.length() > 1e-9 else -n
    return ((c + v * r) - o) * n


def check(jerk_limit=25.0, pop_limit=45.0, ground_tol=2.0):
    s = int(cmds.playbackOptions(q=True, min=True)); e = int(cmds.playbackOptions(q=True, max=True))
    rep = {"status": cmds.wheelRollStatus()}
    for side, (j, _) in WHEELS.items():
        rx = [cmds.getAttr(NS + j + ".rotateX", time=f) for f in range(s, e + 1)]
        d = [rx[i] - rx[i - 1] for i in range(1, len(rx))]
        jerks = [(s + i + 1, round(d[i - 1], 1), round(d[i], 1)) for i in range(1, len(d)) if abs(d[i] - d[i - 1]) > jerk_limit]
        ar = [cmds.getAttr(NS + side + "_Wheel_ctrl.autoRoll", time=f) for f in range(s, e + 1)]
        hs = [(f, contact_height(side, f)) for f in range(s, e + 1) if ar[f - s] >= 0.999]
        bad = [(f, round(h, 1)) for f, h in hs if abs(h) > ground_tol]
        rep[side] = {"max deg/f": round(max(abs(x) for x in d), 1), "spin jerks": jerks[:6],
                     "contact min/max": (round(min(h for _, h in hs), 2), round(max(h for _, h in hs), 2)) if hs else None,
                     "off-ground frames (>%gcm)" % ground_tol: (len(bad), bad[:6])}
    pops = []
    for jn in cmds.ls(NS + "*", type="joint"):
        if jn.endswith(("Front_wheelJnt", "Rear_WheelJnt", "Front_wheel1Jnt", "Rear_Wheel1Jnt")):
            continue
        prev = None
        for f in range(s, e + 1):
            r = cmds.getAttr(jn + ".r", time=f)[0]
            if prev and max(abs(((a - b) + 180) % 360 - 180) for a, b in zip(r, prev)) > pop_limit:
                pops.append((jn.split(":")[1], f))
            prev = r
    rep["joint pops"] = pops[:8]
    return rep


def playblast(path, name, w=960, h=540):
    s = int(cmds.playbackOptions(q=True, min=True)); e = int(cmds.playbackOptions(q=True, max=True))
    for n in ("followCam_loc", "followCam"):
        if cmds.objExists(n):
            cmds.delete(n)
    loc = cmds.spaceLocator(n="followCam_loc")[0]
    cmds.pointConstraint(NS + "bodyJnt", loc)
    cam = cmds.camera(n="followCam")[0]
    cmds.parent(cam, loc)
    cmds.setAttr(cam + ".t", *CAMS.get(name, (-430, 210, -490)))
    cmds.setAttr(cmds.listRelatives(cam, s=True)[0] + ".focalLength", 32)
    cmds.setAttr(cmds.listRelatives(cam, s=True)[0] + ".farClipPlane", 100000)
    cmds.aimConstraint(NS + "bodyJnt", cam, aim=(0, 0, -1), u=(0, 1, 0), wut="scene")
    cmds.setAttr(NS + "Controls.v", 0)
    panel = "modelPanel4"
    cmds.modelPanel(panel, e=True, cam=cam)
    cmds.modelEditor(panel, e=True, grid=False, nurbsCurves=False, locators=False, joints=False,
                     displayAppearance="smoothShaded", allObjects=True)
    cmds.modelEditor(panel, e=True, nurbsCurves=False, locators=False, joints=False)
    out = cmds.playblast(st=s, et=e, format="webm", compression="vp8", filename=path, forceOverwrite=True, viewer=False,
                         showOrnaments=True, percent=100, w=w, h=h, offScreen=True)
    cmds.setAttr(NS + "Controls.v", 1)
    return out
