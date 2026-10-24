# wheelRollNode.py -- Maya Python plugin (API 2.0), prototype
# v0.3: no rebuild on open when the stored stamp matches; deferred verify after open/reference;
# v0.5: airInertia removed (hidden no-op attr kept). autoRoll is sampled at segment midpoints: a stepped key
#       switches the wheel exactly on its frame, no half-frame dip.
#       sync_all no longer rebuilds a valid stored table; wheelRollStatus command.
#       Game export: bake the joints with bakeResults as usual; tables are synced before export (kBeforeExport).
# wheelRoll node: integrates the rolling angle of a wheel from the world path of its pivot.
# The integrated table is rebuilt only when something upstream is edited (keys, constraints,
# paths, parents...). Playback only interpolates the stored table.
import math, hashlib
import maya.api.OpenMaya as om
import maya.cmds as cmds
import maya.OpenMaya as om1   # MFileIO only exists in API 1.0

def maya_useNewAPI():
    pass

NODE_NAME = 'wheelRoll'
NODE_ID = om.MTypeId(0x0007F101)   # local/test id range
DEBOUNCE_MS = 120
stats = {'rebuilds': 0, 'last_sec': 0.0, 'last_samples': 0, 'last_from': None, 'skipped': 0}


class WheelRoll(om.MPxNode):
    aMatrix = aTime = aAmount = aRadius = aSub = aOffset = None
    aTable = aStart = aTSub = aVer = aStamp = aOut = None
    aPose = aRest = aTPos = aHead = aUseHead = aStatic = aInertia = None

    def __init__(self):
        om.MPxNode.__init__(self)
        self._ver = -1
        self._tbl = []
        self._pos = []

    @staticmethod
    def creator():
        return WheelRoll()

    @staticmethod
    def initialize():
        n = om.MFnNumericAttribute(); u = om.MFnUnitAttribute(); m = om.MFnMatrixAttribute(); t = om.MFnTypedAttribute()
        C = WheelRoll
        C.aMatrix = m.create('inMatrix', 'im'); m.storable = False
        C.aTime = u.create('inTime', 'it', om.MFnUnitAttribute.kTime, 0.0)
        C.aAmount = n.create('autoRoll', 'ar', om.MFnNumericData.kDouble, 1.0); n.keyable = True
        C.aRadius = n.create('radius', 'rad', om.MFnNumericData.kDouble, 30.0); n.setMin(0.001)
        C.aSub = n.create('substeps', 'sub', om.MFnNumericData.kInt, 2); n.setMin(1)
        C.aOffset = n.create('offset', 'ofs', om.MFnNumericData.kDouble, 0.0); n.keyable = True
        C.aTable = t.create('table', 'tbl', om.MFnData.kDoubleArray); t.hidden = True
        C.aStart = n.create('tableStart', 'tst', om.MFnNumericData.kDouble, 0.0); n.hidden = True
        C.aTSub = n.create('tableSubsteps', 'tsb', om.MFnNumericData.kInt, 1); n.hidden = True
        C.aVer = n.create('tableVersion', 'tvr', om.MFnNumericData.kInt, 0); n.hidden = True
        C.aStamp = t.create('stamp', 'stp', om.MFnData.kString); t.hidden = True
        # poseRoll: start the roll from the distance travelled from restPosition, so the wheel turns
        # when an un-keyed controller is moved (posing before the first key)
        C.aPose = n.create('poseRoll', 'pr', om.MFnNumericData.kBoolean, False); n.channelBox = True
        C.aRest = n.createPoint('restPosition', 'rp')
        C.aTPos = t.create('tablePos', 'tps', om.MFnData.kDoubleArray); t.hidden = True
        # optional heading (e.g. the bike's drive control): pose roll is measured along its Z, so steering
        # the front wheel alone never turns it
        C.aHead = m.create('headingMatrix', 'hm'); m.storable = False
        C.aUseHead = n.create('useHeading', 'uh', om.MFnNumericData.kBoolean, False)
        C.aStatic = n.create('tableStatic', 'tsc', om.MFnNumericData.kBoolean, False); n.hidden = True
        # airInertia: removed in v0.5 (kept as a hidden no-op so older scenes load without errors)
        C.aInertia = n.create('airInertia', 'ai', om.MFnNumericData.kBoolean, False); n.keyable = False; n.hidden = True
        C.aOut = u.create('outAngle', 'oa', om.MFnUnitAttribute.kAngle, 0.0)
        u.writable = False; u.storable = False
        for a in (C.aMatrix, C.aTime, C.aAmount, C.aRadius, C.aSub, C.aOffset, C.aTable, C.aStart, C.aTSub, C.aVer, C.aStamp,
                  C.aPose, C.aRest, C.aTPos, C.aHead, C.aUseHead, C.aStatic, C.aInertia, C.aOut):
            C.addAttribute(a)
        # inMatrix/autoRoll/radius: live correction (where the pivot is now vs. where it was when the table was sampled)
        for a in (C.aTime, C.aOffset, C.aTable, C.aStart, C.aTSub, C.aVer, C.aMatrix, C.aAmount, C.aRadius,
                  C.aPose, C.aRest, C.aTPos, C.aHead, C.aUseHead, C.aStatic):
            C.attributeAffects(a, C.aOut)

    def compute(self, plug, data):
        if plug != WheelRoll.aOut:
            return None
        t = data.inputValue(WheelRoll.aTime).asTime().asUnits(om.MTime.uiUnit())
        off = data.inputValue(WheelRoll.aOffset).asDouble()
        ver = data.inputValue(WheelRoll.aVer).asInt()
        start = data.inputValue(WheelRoll.aStart).asDouble()
        tsub = max(1, data.inputValue(WheelRoll.aTSub).asInt())
        st = _STATES.get(om.MObjectHandle(self.thisMObject()).hashCode())
        tbl = None
        if st is not None and st.mem is not None:      # batch: freshly computed, not yet written
            tbl, pos, start, tsub, static = st.mem
        else:
            if ver != self._ver:
                obj = data.inputValue(WheelRoll.aTable).data()
                self._tbl = list(om.MFnDoubleArrayData(obj).array()) if not obj.isNull() else []
                obj = data.inputValue(WheelRoll.aTPos).data()
                self._pos = list(om.MFnDoubleArrayData(obj).array()) if not obj.isNull() else []
                self._ver = ver
            tbl = self._tbl; pos = self._pos
            static = data.inputValue(WheelRoll.aStatic).asBool()
        n = len(tbl)
        mm = data.inputValue(WheelRoll.aMatrix).asMatrix()
        p = om.MVector(mm[12], mm[13], mm[14]); f = om.MVector(mm[8], mm[9], mm[10])
        if f.length() > 1e-12:
            f.normalize()
        k = data.inputValue(WheelRoll.aAmount).asDouble() * 180.0 / math.pi / max(1e-6, data.inputValue(WheelRoll.aRadius).asDouble())
        if n == 0 or static:
            # no motion in the table (no keys): pure pose roll, the same formula live and after a rebuild
            a = 0.0
            if data.inputValue(WheelRoll.aPose).asBool():
                h = f
                if data.inputValue(WheelRoll.aUseHead).asBool():
                    hm = data.inputValue(WheelRoll.aHead).asMatrix(); h = om.MVector(hm[8], hm[9], hm[10])
                    h = h.normal() if h.length() > 1e-12 else f
                r = data.inputValue(WheelRoll.aRest).asFloat3()
                a = ((p - om.MVector(r[0], r[1], r[2])) * h) * k
        else:
            x = (t - start) * tsub
            if x <= 0:
                i, w = 0, 0.0
            elif x >= n - 1:
                i, w = n - 1, 0.0
            else:
                i = int(x); w = x - i
            j = min(i + 1, n - 1)
            a = tbl[i] + (tbl[j] - tbl[i]) * w
            if len(pos) == 3 * n:      # live correction: un-keyed edits, stale table, beyond the table range
                q = om.MVector(*[pos[3 * i + c] + (pos[3 * j + c] - pos[3 * i + c]) * w for c in range(3)])
                a += ((p - q) * f) * k
        h = data.outputValue(WheelRoll.aOut)
        h.setMAngle(om.MAngle(math.radians(a + off)))
        h.setClean()
        return None


# ------------------------------------------------------------------ per-node state
class _State(object):
    def __init__(self, handle):
        self.h = handle
        self.curves = []        # upstream animCurve names
        self.watch = []         # attributeChanged callback ids
        self.watched = set()
        self.snap = None        # curve signatures at last build
        self.rescan = True
        self.dirty = True
        self.full = True
        self.mem = None         # (table, start, tsub) computed in batch, not yet written


_STATES = {}
_CB = []
_timer = None
_busy = False


def _name(obj):
    return om.MFnDagNode(obj).fullPathName() if obj.hasFn(om.MFn.kDagNode) else om.MFnDependencyNode(obj).name()


def _mobj(name):
    s = om.MSelectionList(); s.add(name); return s.getDependNode(0)


def _all_nodes():
    return cmds.ls(type=NODE_NAME, long=True) or []


def _state(name_or_obj):
    obj = _mobj(name_or_obj) if isinstance(name_or_obj, str) else name_or_obj
    h = om.MObjectHandle(obj)
    st = _STATES.get(h.hashCode())
    if st is None or not st.h.isValid():
        st = _State(h); _STATES[h.hashCode()] = st
    return st


def _interactive():
    return om.MGlobal.mayaState() == om.MGlobal.kInteractive


# ------------------------------------------------------------------ upstream discovery
def _rescan(st):
    node = _name(st.h.object())
    srcs = []
    for a in ('inMatrix', 'autoRoll', 'radius', 'headingMatrix'):
        srcs += cmds.listConnections(node + '.' + a, s=True, d=False) or []
    todo = [(cmds.ls(s, long=True) or [s])[0] for s in srcs]
    seen, curves = set(), set()
    while todo:
        n = todo.pop()
        if n in seen or not cmds.objExists(n):
            continue
        typ = cmds.nodeType(n)
        if typ == 'time' or typ == NODE_NAME:
            continue
        if cmds.objectType(n, isAType='animCurve'):
            curves.add(n)
            # driven keys etc: keep walking from the curve input
        seen.add(n)
        nxt = []
        if cmds.objectType(n, isAType='dagNode'):
            nxt += cmds.listRelatives(n, allParents=True, fullPath=True) or []
        nxt += cmds.listConnections(n, s=True, d=False, scn=True) or []
        for x in nxt:
            x = (cmds.ls(x, long=True) or [x])[0]
            if x not in seen:
                todo.append(x)
    st.curves = sorted(curves)
    if not getattr(st, 'self_cb', None):
        try:
            st.self_cb = om.MNodeMessage.addAttributeChangedCallback(st.h.object(), _on_wheel_attr, st.h.hashCode())
        except Exception:
            st.self_cb = None
    nodes = set(n for n in seen if n not in curves)
    if nodes != st.watched:
        for i in st.watch:
            try: om.MMessage.removeCallback(i)
            except Exception: pass
        st.watch = []
        for n in nodes:
            try:
                st.watch.append(om.MNodeMessage.addAttributeChangedCallback(_mobj(n), _on_attr, st.h.hashCode()))
            except Exception:
                pass
        st.watched = nodes
    st.rescan = False


def _curve_sig(c):
    tc = cmds.keyframe(c, q=True, tc=True) or []
    vc = cmds.keyframe(c, q=True, vc=True) or []
    ia = cmds.keyTangent(c, q=True, ia=True) or []
    oa = cmds.keyTangent(c, q=True, oa=True) or []
    iw = cmds.keyTangent(c, q=True, iw=True) or []
    ow = cmds.keyTangent(c, q=True, ow=True) or []
    # rounded: .ma files store keys with limited precision, so exact floats change on reload
    R = lambda xs: [round(x, 4) for x in xs]
    keys = tuple(zip(R(tc), R(vc), R(ia), R(oa), R(iw), R(ow)))
    inf = (cmds.getAttr(c + '.preInfinity'), cmds.getAttr(c + '.postInfinity'))
    return (inf, keys)


def _earliest_change(old, new):
    # returns None (no change), -inf (full) or the first frame whose value may have changed
    if old is None or set(old) != set(new):
        return float('-inf')
    t0 = None
    for c, (ninf, nk) in new.items():
        oinf, ok = old[c]
        if oinf != ninf:
            return float('-inf')
        if ok == nk:
            continue
        i = 0
        while i < min(len(ok), len(nk)) and ok[i] == nk[i]:
            i += 1
        if i == 0:
            return float('-inf')
        tt = nk[i - 1][0]
        t0 = tt if t0 is None else min(t0, tt)
    return t0


ALGO = 5            # bump when the table math changes: every stored table then rebuilds once


def _params(obj):
    # the node's own unconnected inputs: a change to any of them invalidates the stored table
    fn = om.MFnDependencyNode(obj)
    out = [ALGO]
    for a in ('substeps', 'radius', 'autoRoll', 'poseRoll', 'useHeading', 'restPosition'):
        pl = fn.findPlug(a, False)
        if pl.isDestination:
            out.append((a, 'connected'))
        elif pl.isCompound:
            out.append((a, tuple(round(pl.child(i).asDouble(), 6) for i in range(pl.numChildren()))))
        else:
            out.append((a, round(pl.asDouble(), 6)))
    return tuple(out)


def _stamp(sig, st=None):
    key = (sorted(sig.items()), _params(st.h.object()) if st is not None else None)
    return hashlib.md5(repr(key).encode('utf-8')).hexdigest()


def _range(sig):
    a = cmds.playbackOptions(q=True, animationStartTime=True)
    b = cmds.playbackOptions(q=True, animationEndTime=True)
    for inf, keys in sig.values():
        if keys:
            a = min(a, keys[0][0]); b = max(b, keys[-1][0])
    return float(math.floor(a)), float(math.ceil(b))


# ------------------------------------------------------------------ rebuild
CHUNK = 40          # samples between yields (background job)
BUDGET_S = 0.012    # max time per UI tick spent on background jobs


def _rebuild_gen(st, write=True):
    # Generator: yields every CHUNK samples so the UI never freezes. Returns True if a table was produced.
    import time
    t_0 = time.perf_counter()
    obj = st.h.object()
    fn = om.MFnDependencyNode(obj)
    if st.rescan:
        _rescan(st)
    sig = dict((c, _curve_sig(c)) for c in st.curves)
    start, end = _range(sig)
    if end <= start:
        end = start + 1
    sub = max(1, fn.findPlug('substeps', False).asInt())
    r = fn.findPlug('radius', False).asDouble()
    pose = fn.findPlug('poseRoll', False).asBool()
    rp = fn.findPlug('restPosition', False)
    rest = om.MVector(rp.child(0).asFloat(), rp.child(1).asFloat(), rp.child(2).asFloat())
    use_head = fn.findPlug('useHeading', False).asBool()
    hp = fn.findPlug('headingMatrix', False)
    N = int(round((end - start) * sub)) + 1
    old = _get_table(fn)
    oldp = _get_table(fn, 'tablePos')
    same_layout = (len(old) == N and len(oldp) == 3 * N and fn.findPlug('tableStart', False).asDouble() == start
                   and fn.findPlug('tableSubsteps', False).asInt() == sub)
    full = st.full
    t_from = float('-inf') if (full or not same_layout) else _earliest_change(st.snap, sig)
    if t_from is None:
        st.dirty = False; st.full = False; st.snap = sig
        stats['skipped'] += 1
        return False
    i0 = 0 if t_from == float('-inf') else max(0, int(math.floor((t_from - start) * sub)) - 1)
    mp = fn.findPlug('inMatrix', False)
    ap = fn.findPlug('autoRoll', False)
    unit = om.MTime.uiUnit()
    k = 180.0 / math.pi / r
    tbl = old[:i0 + 1] if i0 > 0 else [0.0]
    posl = oldp[:i0 * 3] if i0 > 0 else []
    ang = tbl[-1]
    prev = None
    MD = om.MFnMatrixData
    for i in range(i0, N):
        ctx = om.MDGContext(om.MTime(start + float(i) / sub, unit))
        pc = ctx.makeCurrent()
        try:
            mm = MD(mp.asMObject()).matrix()
            am = ap.asDouble()
        finally:
            pc.makeCurrent()
        p = om.MVector(mm[12], mm[13], mm[14]); f = om.MVector(mm[8], mm[9], mm[10])
        if f.length() > 1e-12:
            f.normalize()
        posl += [p.x, p.y, p.z]
        if prev is None and i == 0 and pose:
            hf = f
            if use_head:
                pc = ctx.makeCurrent()
                try:
                    hmm = MD(hp.asMObject()).matrix()
                finally:
                    pc.makeCurrent()
                hf = om.MVector(hmm[8], hmm[9], hmm[10])
                hf = hf.normal() if hf.length() > 1e-12 else f
            ang = ((p - rest) * hf) * am * k; tbl[0] = ang
        if prev is not None:
            pp, pf, pa = prev
            mid = pf + f
            mid = f if mid.length() < 1e-9 else mid.normal()
            # autoRoll weight = its value at the middle of the segment, so a stepped key switches exactly on its frame
            ctx_mid = om.MDGContext(om.MTime(start + (float(i) - 0.5) / sub, unit))   # keep alive while current
            pcm = ctx_mid.makeCurrent()
            try:
                w = ap.asDouble()
            finally:
                pcm.makeCurrent()
            del ctx_mid
            ang += ((p - pp) * mid) * k * w
            tbl.append(ang)
        prev = (p, f, am)
        if (i - i0) % CHUNK == CHUNK - 1:
            yield
            if not st.h.isValid():
                return False
    if not st.h.isValid():
        return False
    st.snap = sig
    st.dirty = False
    st.full = False
    stats['rebuilds'] += 1; stats['last_sec'] = time.perf_counter() - t_0
    stats['last_samples'] = N - i0; stats['last_from'] = None if i0 == 0 else start + float(i0) / sub
    static = all(abs(posl[c] - posl[c % 3]) < 1e-6 for c in range(len(posl)))
    if write:
        st.mem = None
        _write(fn, tbl, posl, start, sub, _stamp(sig, st), static)
    else:
        st.mem = (tbl, posl, start, sub, static)
    return True


def rebuild(st, write=True):
    # synchronous (batch, save/export, sync command)
    _JOBS.pop(st.h.hashCode(), None)
    g = _rebuild_gen(st, write)
    try:
        while True:
            next(g)
    except StopIteration as e:
        return bool(e.value)


def _get_table(fn, attr='table'):
    try:
        o = fn.findPlug(attr, False).asMObject()
        return [] if o.isNull() else list(om.MFnDoubleArrayData(o).array())
    except RuntimeError:
        return []


def _write(fn, tbl, pos, start, sub, stamp, static=False):
    global _busy
    was = _busy
    _busy = True
    try:
        fn.findPlug('table', False).setMObject(om.MFnDoubleArrayData().create(om.MDoubleArray(tbl)))
        fn.findPlug('tablePos', False).setMObject(om.MFnDoubleArrayData().create(om.MDoubleArray(pos)))
        fn.findPlug('tableStatic', False).setBool(static)
        fn.findPlug('tableStart', False).setDouble(start)
        fn.findPlug('tableSubsteps', False).setInt(sub)
        fn.findPlug('stamp', False).setString(stamp)
        p = fn.findPlug('tableVersion', False); p.setInt(p.asInt() + 1)
    finally:
        _busy = was


def flush(write=True):
    # synchronous: finish everything now
    global _busy
    if _busy:
        return 0
    _busy = True
    n = 0
    try:
        for name in _all_nodes():
            st = _state(name)
            running = st.h.hashCode() in _JOBS
            if st.rescan:
                # a fresh state is not a reason to rebuild: scan, then compare the stored stamp
                _rescan(st)
                if not st.dirty and not running:
                    sig = dict((c, _curve_sig(c)) for c in st.curves)
                    fn = om.MFnDependencyNode(st.h.object())
                    no_pos = len(_get_table(fn, 'tablePos')) != 3 * len(_get_table(fn))
                    if no_pos or (cmds.getAttr(name + '.stamp') or '') != _stamp(sig, st):
                        st.dirty = True; st.full = True
                    else:
                        st.snap = sig; st.full = False
            if st.dirty or running or (write and st.mem is not None):
                if st.mem is not None and not st.dirty and not running and write:
                    tbl, ps, s0, sb, sc = st.mem; st.mem = None
                    _write(om.MFnDependencyNode(st.h.object()), tbl, ps, s0, sb, _stamp(st.snap, st), sc); n += 1
                elif rebuild(st, write=write):
                    n += 1
    finally:
        _busy = False
    return n


# ------------------------------------------------------------------ background jobs (GUI)
_JOBS = {}
_worker = None
_debounce = None


def _start_jobs():
    # called after the debounce: (re)start a job for every dirty wheel
    for name in _all_nodes():
        st = _state(name)
        if st.dirty or st.rescan:
            _JOBS[st.h.hashCode()] = (st, _rebuild_gen(st, True))   # replaces a running job -> restart
    if _JOBS:
        _worker.start(0)


def _tick():
    import time
    global _busy
    try:
        if cmds.play(q=True, state=True):      # never compete with playback / cache fill
            return
    except Exception:
        pass
    t_end = time.perf_counter() + BUDGET_S
    _busy = True     # our own context evaluation / writes must not re-mark
    try:
        for key in list(_JOBS):
            st, g = _JOBS[key]
            try:
                while time.perf_counter() < t_end:
                    next(g)
            except StopIteration:
                _JOBS.pop(key, None)
            except Exception as e:
                _JOBS.pop(key, None)
                om.MGlobal.displayWarning('wheelRoll rebuild failed: %s' % e)
            if time.perf_counter() >= t_end:
                break
    finally:
        _busy = False
    dt = time.perf_counter() - (t_end - BUDGET_S)
    stats['ticks'] = stats.get('ticks', 0) + 1
    stats['max_tick'] = max(stats.get('max_tick', 0.0), dt)
    if not _JOBS:
        _worker.stop()
        stats['last_done'] = time.time()


def verify_all(force=False):
    # after open/reference: compare stored stamps with current curves
    for name in _all_nodes():
        st = _state(name)
        st.rescan = True
        _rescan(st)
        sig = dict((c, _curve_sig(c)) for c in st.curves)
        stored = cmds.getAttr(name + '.stamp') or ''
        st.snap = sig
        fn = om.MFnDependencyNode(st.h.object())
        no_pos = len(_get_table(fn, 'tablePos')) != 3 * len(_get_table(fn))      # saved by v0.1
        if force or no_pos or stored != _stamp(sig, st):
            st.dirty = True; st.full = True
        else:
            st.dirty = False; st.full = False   # table is valid: later edits may rebuild partially
    _schedule()


# ------------------------------------------------------------------ scheduling / callbacks
def _schedule():
    global _debounce, _worker
    if _busy:
        return
    if not _interactive():
        return          # batch: rebuilt synchronously in _mark / before save & export
    try:
        from PySide6 import QtCore
    except ImportError:
        from PySide2 import QtCore
    if _debounce is None:
        _debounce = QtCore.QTimer(); _debounce.setSingleShot(True); _debounce.timeout.connect(_start_jobs)
        _worker = QtCore.QTimer(); _worker.timeout.connect(_tick)
    # an edit while a job runs: drop the stale job now, restart after the debounce
    for st in list(_STATES.values()):
        if st.dirty:
            _JOBS.pop(st.h.hashCode(), None)
    _debounce.start(DEBOUNCE_MS)


def _mark(st, full=False, rescan=False):
    st.dirty = True
    st.full = st.full or full
    st.rescan = st.rescan or rescan
    # batch (mayapy): nothing is rebuilt here (a script setting many values would rebuild
    # once per call). Tables are brought up to date by wheelRollSync and before save/export.


def _loading():
    return om1.MFileIO.isOpeningFile() or om1.MFileIO.isReadingFile()


def _on_curves(objs, *_):
    if _busy or _loading():
        return
    names = set(om.MFnDependencyNode(objs[i]).name() for i in range(len(objs)))
    hit = False
    for st in list(_STATES.values()):
        if st.h.isValid() and any(c in names or c.split('|')[-1] in names for c in st.curves):
            _mark(st); hit = True
    if hit:
        _schedule()


_WHEEL_INPUTS = ('inMatrix', 'autoRoll', 'radius', 'substeps', 'headingMatrix')


def _relevant_plug(plug, st):
    # dynamic (user) attributes only matter through their connections
    try:
        if not plug.isDynamic:
            return True
        wheel = st.h.object()
        for d in plug.destinations():
            n = d.node()
            if n == wheel:
                if d.partialName(useLongNames=True) in _WHEEL_INPUTS:
                    return True
            elif _name(n) in st.watched:
                return True
        return False
    except Exception:
        return True


def _on_attr(msg, plug, other, key):
    if _busy or _loading():
        return
    st = _STATES.get(key)
    if st is None:
        return
    M = om.MNodeMessage
    if msg & (M.kConnectionMade | M.kConnectionBroken):
        _mark(st, full=True, rescan=True); _schedule()
    elif msg & M.kAttributeSet:
        if plug.isDestination:      # animated/driven: transient value, real change comes as a curve edit
            return
        if not _relevant_plug(plug, st):
            return
        _mark(st, full=True); _schedule()


def _on_wheel_attr(msg, plug, other, key):
    # the wheel node's own static inputs (radius, substeps, autoRoll when not driven)
    if _busy or _loading() or not (msg & om.MNodeMessage.kAttributeSet):
        return
    st = _STATES.get(key)
    if st is None or plug.isDestination:
        return
    nm = plug.partialName(useLongNames=True)
    if nm in ('radius', 'substeps', 'autoRoll', 'poseRoll', 'useHeading') or nm.startswith('restPosition'):
        _mark(st, full=True); _schedule()


def _on_structure(obj, *_):
    if _busy or om1.MFileIO.isOpeningFile() or om1.MFileIO.isReadingFile():
        return
    for st in list(_STATES.values()):
        if st.h.isValid():
            _mark(st, full=True, rescan=True)
    _schedule()


def _on_wheel_added(obj, *_):
    if om1.MFileIO.isOpeningFile() or om1.MFileIO.isReadingFile():
        return
    _mark(_state(obj), full=True, rescan=True)
    _schedule()


def _on_wheel_removed(obj, *_):
    st = _STATES.pop(om.MObjectHandle(obj).hashCode(), None)
    _JOBS.pop(om.MObjectHandle(obj).hashCode(), None)
    if st:
        if getattr(st, 'self_cb', None):
            try: om.MMessage.removeCallback(st.self_cb)
            except Exception: pass
        for i in st.watch:
            try: om.MMessage.removeCallback(i)
            except Exception: pass


def _on_range(*_):
    # not 'full': rebuild() compares the table layout and skips when nothing changed
    if _loading():
        return
    for st in list(_STATES.values()):
        if st.h.isValid():
            _mark(st)
    _schedule()


def sync_all():
    # Safety net used before save/export and by the wheelRollSync command:
    # anim-curve edit callbacks are delivered on idle, which never happens in mayapy.
    for name in _all_nodes():
        st = _state(name)
        _rescan(st)
        sig = dict((c, _curve_sig(c)) for c in st.curves)
        fn = om.MFnDependencyNode(st.h.object())
        no_pos = len(_get_table(fn, 'tablePos')) != 3 * len(_get_table(fn))
        if no_pos or (cmds.getAttr(name + '.stamp') or '') != _stamp(sig, st):
            st.dirty = True; st.full = True
        elif st.h.hashCode() not in _JOBS:
            # stored table matches the current curves: a freshly created state is born dirty, clear it
            st.dirty = False; st.full = False; st.snap = sig
    return flush(write=True)


def _on_before_save(*_):
    sync_all()


def _on_before_scene_change(*_):
    # nodes are about to disappear: never keep evaluating them from a timer
    _JOBS.clear()
    if _worker is not None:
        _worker.stop()
    if _debounce is not None:
        _debounce.stop()


def _on_after_open(*_):
    if _interactive():
        cmds.evalDeferred(verify_all, lowestPriority=True)   # after reference edits are applied
    else:
        verify_all()


def _on_after_ref(*_):
    if _loading():          # reference loaded as part of opening a file: kAfterOpen handles it
        return
    if _interactive():
        cmds.evalDeferred(verify_all, lowestPriority=True)
    else:
        verify_all()


def _install():
    from maya.api import OpenMayaAnim as oma
    S = om.MSceneMessage
    _CB.append(oma.MAnimMessage.addAnimCurveEditedCallback(_on_curves))
    _CB.append(om.MDGMessage.addNodeAddedCallback(_on_wheel_added, NODE_NAME))
    _CB.append(om.MDGMessage.addNodeRemovedCallback(_on_wheel_removed, NODE_NAME))
    _CB.append(om.MEventMessage.addEventCallback('playbackRangeSliderChanged', _on_range))
    for ev in (S.kBeforeSave, S.kBeforeExport):
        _CB.append(S.addCallback(ev, _on_before_save))
    for ev in (S.kBeforeNew, S.kBeforeOpen, S.kBeforeRemoveReference, S.kBeforeUnloadReference, S.kBeforeImport):
        _CB.append(S.addCallback(ev, _on_before_scene_change))
    _CB.append(S.addCallback(S.kAfterOpen, _on_after_open))
    for ev in (S.kAfterImport, S.kAfterCreateReference, S.kAfterLoadReference):
        _CB.append(S.addCallback(ev, _on_after_ref))


def _uninstall():
    for i in _CB:
        try: om.MMessage.removeCallback(i)
        except Exception: pass
    del _CB[:]
    global _worker, _debounce
    for t in (_worker, _debounce):
        if t is not None:
            t.stop()
    _JOBS.clear()
    for st in _STATES.values():
        if getattr(st, 'self_cb', None):
            try: om.MMessage.removeCallback(st.self_cb)
            except Exception: pass
        for i in st.watch:
            try: om.MMessage.removeCallback(i)
            except Exception: pass
    _STATES.clear()



# ------------------------------------------------------------------ status
def status():
    # {node: 'ok' | 'stale' | 'rebuilding' | 'empty'} for shelf buttons / HUD
    out = {}
    for name in _all_nodes():
        st = _state(name)
        if st.h.hashCode() in _JOBS:
            out[name] = 'rebuilding'; continue
        if st.rescan:
            _rescan(st)
        sig = dict((c, _curve_sig(c)) for c in st.curves)
        if not sig:
            out[name] = 'empty'
        elif st.dirty or (cmds.getAttr(name + '.stamp') or '') != _stamp(sig, st):
            out[name] = 'stale'
        else:
            out[name] = 'ok'
    return out


class WheelRollStatus(om.MPxCommand):
    # cmds.wheelRollStatus() -> ['node:ok', 'node:stale', ...]
    def doIt(self, args):
        self.setResult(['%s:%s' % kv for kv in sorted(status().items())])


class WheelRollSync(om.MPxCommand):
    # cmds.wheelRollSync() -> number of wheels rebuilt
    def doIt(self, args):
        self.setResult(sync_all())


def initializePlugin(obj):
    fn = om.MFnPlugin(obj, 'prototype', '0.5', 'Any')
    fn.registerNode(NODE_NAME, NODE_ID, WheelRoll.creator, WheelRoll.initialize)
    fn.registerCommand('wheelRollSync', WheelRollSync)
    fn.registerCommand('wheelRollStatus', WheelRollStatus)
    _install()
    try:
        verify_all()
    except Exception:
        pass


def uninitializePlugin(obj):
    _uninstall()
    fn = om.MFnPlugin(obj)
    fn.deregisterCommand('wheelRollSync')
    fn.deregisterCommand('wheelRollStatus')
    fn.deregisterNode(NODE_ID)
