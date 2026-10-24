# -*- coding: utf-8 -*-
"""
compare_rigs.py -- check that two builds of the bike rig move the same (mayapy, no UI).

    mayapy tools/mayapy_run.py tools/compare_rigs.py A.ma B.ma [--shots DIR] [--poses 30] [--out result.json]

1. random poses on the controllers: joint world matrices, joint local rotate values and mesh points of A vs B
2. --shots: every shot (*.ma referencing the rig as namespace "bike", reference node "bikeRN") is played
   with A, then the reference is switched to B and played again; all frames are compared.
Prints the largest differences (cm / matrix element / degrees). Needs the wheelRoll plug-in on MAYA_PLUG_IN_PATH.
"""
import argparse
import glob
import json
import os
import random

import maya.standalone
maya.standalone.initialize()
import maya.cmds as cmds
import maya.api.OpenMaya as om

RANGES = {"Root_ctrl": {"tx": 90, "tz": 90, "ry": 90},
          "Drive_ctrl": {"tx": 150, "ty": 45, "tz": 150, "rx": 15, "ry": 90, "rz": 15},
          "COG_ctrl": {"tx": 15, "ty": 30, "tz": 15, "rx": 25, "ry": 25, "rz": 35},
          "Wheelie_ctrl": {"rx": 30}, "Stoppie_ctrl": {"rx": 30}, "Body_ctrl": {"ty": 8, "rx": 8}, "Steer_ctrl": {"rx": 35},
          "Front_WheelBump_ctrl": {"ty": 10}, "Rear_WheelBump_ctrl": {"ty": 10},
          "Front_Wheel_ctrl": {"rx": 180}, "Rear_Wheel_ctrl": {"rx": 180},
          "L_Lever_ctrl": {"ry": 20}, "R_Lever_ctrl": {"ry": 20}, "L_Mirror_ctrl": {"ry": 30}, "R_Mirror_ctrl": {"ry": 30},
          "L_Pedal_ctrl": {"rz": 30}, "R_Pedal_ctrl": {"rz": 30}, "Stand_ctrl": {"rx": 60}}


def open_file(path):
    try:
        cmds.file(path, open=True, force=True)
    except RuntimeError:            # missing optional plug-ins only warn
        pass
    sync()


def sync():
    try:
        cmds.wheelRollSync()
    except Exception:
        pass


def model_joints(ns=""):
    return sorted(j for j in cmds.ls(ns + "*", type="joint") if not j.split(":")[-1].startswith("bike_"))


def state(js, with_points=False):
    s = {"m": dict((j.split(":")[-1], cmds.xform(j, q=True, ws=True, m=True)) for j in js),
         "r": dict((j.split(":")[-1], cmds.getAttr(j + ".r")[0]) for j in js)}
    if with_points:
        s["p"] = {}
        for m in cmds.ls(type="mesh", ni=True):
            t = cmds.listRelatives(m, p=True)[0]
            if t.endswith("_proxy") or t.startswith("MeshAnim"):
                continue
            pts = om.MFnMesh(om.MSelectionList().add(m).getDagPath(0)).getPoints(om.MSpace.kWorld)
            step = max(1, len(pts) // 40)
            s["p"][t] = [(pts[i].x, pts[i].y, pts[i].z) for i in range(0, len(pts), step)]
    return s


class Worst(object):
    def __init__(self):
        self.v = {}

    def add(self, key, value, where):
        if value > self.v.get(key, (0.0, None))[0]:
            self.v[key] = (value, where)


def compare(a, b, worst, where):
    for j, m in a["m"].items():
        n = b["m"].get(j)
        if n is None:
            worst.add("missing joint", 1, j); continue
        worst.add("joint pos (cm)", max(abs(x - y) for x, y in zip(m[12:15], n[12:15])), (j, where))
        worst.add("joint rot (matrix)", max(abs(x - y) for x, y in zip(m[:12], n[:12])), (j, where))
        worst.add("local rotate (deg)", max(abs(x - y) for x, y in zip(a["r"][j], b["r"][j])), (j, where))
    for t, p in a.get("p", {}).items():
        q = b.get("p", {}).get(t)
        if q is None or len(p) != len(q):
            worst.add("missing mesh", 1, t); continue
        worst.add("mesh points (cm)", max(max(abs(x - y) for x, y in zip(u, v)) for u, v in zip(p, q)), (t, where))


def random_poses(n, seed=5):
    rnd = random.Random(seed)
    poses = [{}]
    for _ in range(n - 1):
        poses.append(dict(("%s.%s" % (c, a), rnd.uniform(-v, v)) for c, d in RANGES.items() for a, v in d.items()
                          if rnd.random() < 0.6))
    return poses


def pose_states(path, poses):
    open_file(path)
    js = model_joints()
    out = []
    for p in poses:
        for c in RANGES:
            for a in ("tx", "ty", "tz", "rx", "ry", "rz"):
                pl = c + "." + a
                if cmds.objExists(pl) and cmds.getAttr(pl, settable=True):
                    cmds.setAttr(pl, 0)
        for k, v in p.items():
            if cmds.objExists(k) and cmds.getAttr(k, settable=True):
                cmds.setAttr(k, v)
        out.append(state(js, True))
    return out


def shot_check(shot, rig_b, worst):
    open_file(shot)
    s = int(cmds.playbackOptions(q=True, min=True)); e = int(cmds.playbackOptions(q=True, max=True))
    js = model_joints("bike:")
    first = []
    for t in range(s, e + 1):
        cmds.currentTime(t); first.append(state(js))
    try:
        cmds.file(rig_b, loadReference="bikeRN")
    except RuntimeError:
        pass
    sync()
    js = model_joints("bike:")
    for i, t in enumerate(range(s, e + 1)):
        cmds.currentTime(t)
        compare(first[i], state(js), worst, "%s f%d" % (os.path.basename(shot), t))


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("a"); ap.add_argument("b")
    ap.add_argument("--shots", default=""); ap.add_argument("--poses", type=int, default=30)
    ap.add_argument("--out", default="")
    args = ap.parse_args()
    if not cmds.pluginInfo("wheelRollNode", q=True, loaded=True):
        cmds.loadPlugin("wheelRollNode")
    result = {}
    if args.poses:
        poses = random_poses(args.poses)
        A, B = pose_states(args.a, poses), pose_states(args.b, poses)
        w = Worst()
        for i, (x, y) in enumerate(zip(A, B)):
            compare(x, y, w, "pose %d" % i)
        result["poses"] = w.v
    if args.shots:
        w = Worst()
        for shot in sorted(glob.glob(os.path.join(args.shots, "*.ma"))):
            shot_check(shot, args.b, w)
        result["shots"] = w.v
    for part, v in result.items():
        print("== " + part)
        for k, (val, where) in sorted(v.items()):
            print("  %-20s %.3g  %s" % (k, val, where))
    if args.out:
        json.dump(result, open(args.out, "w"), indent=1, default=str)


main()
