# make_shots.py -- intense-action test shots for the bike rig (cm, 24 fps). Each shot references the rig as "bike".
# Bank (ground lean): a scene locator "lean_pivot" sits on the tyre contact line, follows Drive_ctrl, and
#       COG_ctrl is parent-constrained to it (maintain offset). Keying lean_pivot.rz leans the bike on its tyres.
# Air: autoRoll is stepped to 0 at take-off and back to 1 on landing; the free spin in the air is keyed on
#      Wheel_ctrl.rotateX at the speed the wheel had just before take-off.
import maya.cmds as cmds
import math, os

# set these before running (or the env vars): the rig file to reference and the output folder
RIG = os.environ.get("BIKE_RIG_FILE", "")
OUT = os.environ.get("BIKE_SHOTS_DIR", os.path.join(os.path.expanduser("~"), "bike_shots")).replace("\\", "/").rstrip("/") + "/"
NS = "bike:"
LEAN_PIVOT = (6.3, 0.0, 7.65)          # Drive_ctrl local: on the contact line, between the wheels
F_CONTACT = (6.1, 0.0, 81.4)           # front contact in Drive space at rest


# ------------------------------------------------------------------ keys
def key(node, attr, keys, tangent="auto"):
    for t, v in keys:
        cmds.setKeyframe(NS + node, at=attr, t=t, v=v)
    if tangent != "auto":
        cmds.keyTangent(NS + node, at=attr, itt=tangent, ott=tangent)


def step(node, attr, keys):
    for t, v in keys:
        cmds.setKeyframe(NS + node, at=attr, t=t, v=v)
    cmds.keyTangent(NS + node, at=attr, ott="step")


def path(pts, tangent="auto"):
    # pts: [(t, x, z, heading_deg)]
    key("Drive_ctrl", "tx", [(t, x) for t, x, z, h in pts], tangent)
    key("Drive_ctrl", "tz", [(t, z) for t, x, z, h in pts], tangent)
    key("Drive_ctrl", "ry", [(t, h) for t, x, z, h in pts], tangent)


def arc(t0, t1, cx, cz, r, a0, a1, n=10):
    pts = []
    s = 1.0 if a1 > a0 else -1.0
    for i in range(n + 1):
        u = float(i) / n
        t = t0 + (t1 - t0) * u
        a = math.radians(a0 + (a1 - a0) * u)
        x = cx + r * math.cos(a)
        z = cz + r * math.sin(a)
        dx, dz = -s * math.sin(a), s * math.cos(a)
        pts.append((t, x, z, math.degrees(math.atan2(dx, dz))))
    return pts


def pivot_turn(frames, ry_of_t, fixed_world, local=F_CONTACT):
    # yaw the bike around a point that stays fixed in the world (e.g. the front contact)
    pts = []
    for t in frames:
        h = ry_of_t(t)
        a = math.radians(h)
        lx, lz = local[0], local[2]
        wx = lx * math.cos(a) + lz * math.sin(a)
        wz = -lx * math.sin(a) + lz * math.cos(a)
        pts.append((t, fixed_world[0] - wx, fixed_world[2] - wz, h))
    path(pts)


def lean_rig():
    """Animator-side bank setup: locator on the contact line, COG_ctrl constrained to it. Key lean_pivot.rz."""
    sp = cmds.spaceLocator(n="lean_space")[0]
    cmds.parentConstraint(NS + "Drive_ctrl", sp)
    lp = cmds.spaceLocator(n="lean_pivot")[0]
    cmds.parent(lp, sp)
    cmds.setAttr(lp + ".t", *LEAN_PIVOT)
    cmds.setAttr(lp + ".r", 0, 0, 0)
    cmds.parentConstraint(lp, NS + "COG_ctrl", mo=True)
    return lp


def lean(keys):
    for t, v in keys:
        cmds.setKeyframe("lean_pivot", at="rz", t=t, v=v)


# ------------------------------------------------------------------ wheels
_SPIN = {}


def air(side, t_off, t_on, spin=True, scale=1.0):
    """Lift the wheel off the ground between t_off and t_on (autoRoll stepped).
    spin: keep turning at the take-off speed (x scale); False: wheel stops (brake locked)."""
    w = "Front" if side == "F" else "Rear"
    step(w + "_Wheel_ctrl", "autoRoll", [(1, 1), (t_off, 0), (t_on, 1)])
    if spin:
        _SPIN.setdefault(w, []).append(("air", t_off, t_on, scale))


def manual(side, t0, t1, degrees):
    """Extra spin on top of autoRoll (burnout, wheelspin)."""
    w = "Front" if side == "F" else "Rear"
    _SPIN.setdefault(w, []).append(("deg", t0, t1, degrees))


def _bake_spins():
    """Key Wheel_ctrl.rotateX once per frame inside each segment (linear tangents, holds in between):
    air: speed blends from the take-off speed to the landing speed, so neither end pops;
    deg: smoothstep ease in/out of the extra spin."""
    cmds.wheelRollSync()
    for w, segs in _SPIN.items():
        node = NS + w + "_wheelRoll"
        ctrl = w + "_Wheel_ctrl"
        oa = lambda t: cmds.getAttr(node + ".outAngle", time=t)
        segs = sorted(segs, key=lambda s: s[1])
        acc = 0.0
        keys = [(1, 0.0)]
        for kind, t0, t1, v in segs:
            n = int(t1 - t0)
            if kind == "air":
                w0 = (oa(t0 - 1) - oa(t0 - 2)) * v
                w1 = (oa(t1 + 1) - oa(t1)) * v
                for i in range(n + 1):
                    # integral of a linear speed ramp w0 -> w1
                    keys.append((t0 + i, acc + w0 * i + (w1 - w0) * i * i / (2.0 * n)))
                acc += (w0 + w1) * 0.5 * n
            else:
                for i in range(n + 1):
                    u = float(i) / n
                    keys.append((t0 + i, acc + v * u * u * (3 - 2 * u)))
                acc += v
        for t, val in keys:
            cmds.setKeyframe(NS + ctrl, at="rotateX", t=t, v=val)
        cmds.keyTangent(NS + ctrl, at="rotateX", itt="linear", ott="linear")
    _SPIN.clear()


# ------------------------------------------------------------------ scene
def new_shot(start, end):
    if not RIG:
        raise RuntimeError("set make_shots.RIG (or BIKE_RIG_FILE) to the rig .ma first")
    cmds.file(new=True, f=True)
    cmds.currentUnit(l="cm", t="film")
    cmds.file(RIG, r=True, ns="bike")
    cmds.playbackOptions(min=start, max=end, ast=start, aet=end)
    _SPIN.clear()


def ground(cx=0.0, cz=0.0, w=12000.0):
    g = cmds.polyPlane(n="ground", w=w, h=w, sx=24, sy=24)[0]
    cmds.setAttr(g + ".t", cx, 0, cz)
    return g


def quarter_pipe(radius, z0, z1, side=-1):
    # curved wall on the -X side: circle centre (0, radius); keep the lower-right quarter
    length = z1 - z0
    c = cmds.polyCylinder(n="wall", r=radius, h=length, sx=72, sy=1, sc=0, ax=(0, 0, 1))[0]
    cmds.setAttr(c + ".t", 0, radius, (z0 + z1) * 0.5)
    cmds.delete(c, ch=True)
    drop = []
    n = cmds.polyEvaluate(c, f=True)
    for i in range(n):
        f = "%s.f[%d]" % (c, i)
        bb = cmds.exactWorldBoundingBox(f)
        x = (bb[0] + bb[3]) * 0.5
        y = (bb[1] + bb[4]) * 0.5
        if x * side < 0 or y > radius or abs(bb[2] - bb[5]) < 1:
            drop.append(f)
    if drop:
        cmds.delete(drop)
    cmds.polyNormal(c, nm=0)
    return c


def finish(name):
    _bake_spins()
    if not os.path.isdir(OUT):
        os.makedirs(OUT)
    cmds.wheelRollSync()
    cmds.currentTime(cmds.playbackOptions(q=True, min=True))
    p = OUT + name + ".ma"
    cmds.file(rename=p)
    cmds.file(save=True, type="mayaAscii")
    return p


# ------------------------------------------------------------------ shots
def drift():
    new_shot(1, 180)
    ground()
    lean_rig()
    pts = [(1, 0, -1830, 0), (50, 0, 0, 0)] + arc(50, 130, -549, 0, 549, 0, 90)[1:] + [(180, -2380, 549, -90)]
    for i, (t, x, z, h) in enumerate(pts):
        if 60 <= t <= 125:
            h -= 28 * math.sin(math.pi * (t - 60) / 65.0)      # yaw into the corner: the rear steps out
        pts[i] = (t, x, z, h)
    path(pts)
    lean([(45, 0), (65, 40), (115, 38), (140, 0)])
    key("Steer_ctrl", "rx", [(50, 0), (62, 8), (70, -18), (120, -15), (140, 0)])   # counter-steer
    key("Body_ctrl", "ty", [(50, 0), (65, -1.8), (130, -1.5), (150, 0)])
    key("Front_WheelBump_ctrl", "ty", [(50, 0), (56, -1.0), (62, -2.3), (66, -1.0), (70, 1.0), (74, 1.3), (100, 1.2),
                                       (120, 0.95), (132, 0.26), (140, 0)])   # counter-steer lifts / lean+steer sinks the front: keep it on the ground
    manual("R", 55, 130, 900)                                                      # rear spins up in the slide
    return finish("t01_drift")


def air_spin():
    new_shot(1, 150)
    ground()
    path([(1, 0, -1524, 0), (40, 0, 0, 0), (110, 0, 2134, 0), (150, 0, 3048, 0)], "linear")
    key("COG_ctrl", "ty", [(40, 0), (75, 274), (110, 0)])
    key("COG_ctrl", "ry", [(42, 0), (108, 360)], "linear")
    key("COG_ctrl", "rx", [(40, 0), (44, -12), (100, 6), (110, 0)])
    air("F", 40, 110)
    air("R", 40, 110)
    key("Body_ctrl", "ty", [(36, 0), (41, -3.7), (46, 1.5), (108, 0), (112, -5.5), (122, 0)])
    return finish("t02_air_spin")


def wall_ride():
    new_shot(1, 170)
    ground(cx=3000, w=6000)
    quarter_pipe(400, -2000, 7000)
    R = 400.0
    thetas = [(40, 0), (55, 25), (70, 55), (85, 70), (100, 70), (115, 55), (130, 25), (145, 0)]
    key("Drive_ctrl", "tz", [(1, -1250), (170, 4400)], "linear")
    for t, th in thetas:
        a = math.radians(th)
        cmds.setKeyframe(NS + "Drive_ctrl", at="tx", t=t, v=-R * math.sin(a))
        cmds.setKeyframe(NS + "Drive_ctrl", at="ty", t=t, v=R * (1 - math.cos(a)))
        cmds.setKeyframe(NS + "Drive_ctrl", at="rz", t=t, v=-th)
    key("Drive_ctrl", "ry", [(40, 0), (65, -8), (110, 8), (145, 0)])
    key("Steer_ctrl", "rx", [(40, 0), (65, -5), (115, 5), (145, 0)])
    key("Body_ctrl", "ty", [(45, 0), (70, -2.5), (110, -2.5), (140, 0)])
    return finish("t03_wallride")


def burnout_stoppie():
    new_shot(1, 200)
    ground()
    lean_rig()
    key("Drive_ctrl", "tz", [(1, 0), (60, 24), (70, 61), (120, 1524), (150, 1890), (175, 2012), (200, 2012)])
    manual("R", 5, 60, 2400)                                      # standing burnout
    key("Steer_ctrl", "rx", [(5, 0), (30, 12), (55, -10), (70, 0)])
    lean([(5, 0), (30, 6), (55, -5), (70, 0)])
    key("Wheelie_ctrl", "rx", [(68, 0), (80, -18), (100, -6), (115, 0)])   # power wheelie on launch
    air("F", 69, 115)
    key("Stoppie_ctrl", "rx", [(145, 0), (158, 32), (180, 28), (195, 0)])
    air("R", 146, 195, spin=False)                                # rear brake locked in the air
    key("Body_ctrl", "ty", [(140, 0), (152, -3), (195, 0)])
    return finish("t04_burnout_stoppie")


def jump_wheelie_land():
    new_shot(1, 170)
    ground()
    path([(1, 0, -1220, 0), (30, 0, 0, 0), (170, 0, 5486, 0)], "linear")
    key("COG_ctrl", "ty", [(30, 0), (58, 213), (86, 0)])
    key("Wheelie_ctrl", "rx", [(28, 0), (36, -14), (80, -24), (90, -30), (110, -32), (135, -8), (150, 0)])
    air("F", 29, 150)
    air("R", 30, 86)
    key("Body_ctrl", "ty", [(82, 0), (88, -4.5), (105, 0), (135, -3), (150, 0)])
    return finish("t05_jump_wheelie_land")


def donut():
    new_shot(1, 200)
    ground()
    lean_rig()

    def ry(t):
        # ease in 20-50, 2 turns, ease out 170-195
        if t <= 20:
            return 0.0
        if t >= 195:
            return 720.0
        u = (t - 20) / 175.0
        return 720.0 * (u * u * (3 - 2 * u))
    pivot_turn(list(range(1, 201, 2)) + [200], ry, fixed_world=F_CONTACT)
    key("Steer_ctrl", "rx", [(10, 0), (25, 30), (185, 30), (198, 0)])
    lean([(15, 0), (40, -12), (180, -12), (198, 0)])      # lean into the circle
    manual("R", 8, 195, 3600)
    key("Body_ctrl", "ty", [(15, 0), (35, -2), (185, -2), (198, 0)])
    return finish("t06_donut")


def stoppie_180():
    new_shot(1, 170)
    ground()
    path([(1, 0, -1830, 0), (60, 0, 0, 0), (78, 0, 250, 0), (86, 0, 290, 0)])
    stop = (F_CONTACT[0], 0.0, 290 + F_CONTACT[2])

    def ry(t):
        u = min(1.0, max(0.0, (t - 86) / 34.0))
        return 180.0 * (u * u * (3 - 2 * u))
    pivot_turn(list(range(88, 171, 2)), ry, fixed_world=stop)
    key("Stoppie_ctrl", "rx", [(70, 0), (84, 34), (118, 38), (132, 0)])
    air("R", 71, 132, spin=False)
    key("Body_ctrl", "ty", [(68, 0), (80, -2.5), (128, -2), (140, 0)])
    key("Steer_ctrl", "rx", [(84, 0), (100, -10), (125, 0)])
    return finish("t07_stoppie_180")


def barrel_roll():
    new_shot(1, 170)
    ground()
    path([(1, 0, -1520, 0), (40, 0, 0, 0), (116, 0, 2900, 0), (170, 0, 4900, 0)], "linear")
    key("COG_ctrl", "ty", [(40, 0), (78, 300), (116, 0)])
    key("COG_ctrl", "rz", [(46, 0), (108, 360)])
    key("COG_ctrl", "rx", [(40, 0), (46, -10), (106, 6), (116, 0)])
    air("F", 40, 116)
    air("R", 40, 116)
    key("Body_ctrl", "ty", [(36, 0), (41, -3.5), (46, 1.5), (115, 0), (119, -5.5), (130, 0)])
    return finish("t08_barrel_roll")


ALL = [drift, air_spin, wall_ride, burnout_stoppie, jump_wheelie_land, donut, stoppie_180, barrel_roll]
