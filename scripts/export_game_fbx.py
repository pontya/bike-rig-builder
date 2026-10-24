# export_game_fbx.py -- bike rig: bake joints + export FBX in centimetres.
# Rig v19+ is authored in centimetres (wheelbase 147.5 cm), so the scale factor is 1.
import maya.cmds as cmds, maya.mel as mel

def export(path, root="rootJnt", start=None, end=None, meshes=("MeshAnim_blended",), scale=1.0, ns=""):
    """Sync wheelRoll tables, bake the skeleton, export root+mesh to FBX with scale factor (1 unit -> scale cm)."""
    rootj = ns + root
    if start is None: start = cmds.playbackOptions(q=True, min=True)
    if end is None: end = cmds.playbackOptions(q=True, max=True)
    if cmds.pluginInfo("wheelRollNode.py", q=True, l=True):
        cmds.wheelRollSync()
    joints = [rootj] + (cmds.listRelatives(rootj, ad=True, type="joint") or [])
    cmds.bakeResults(joints, t=(start, end), simulation=True, sampleBy=1, preserveOutsideKeys=True,
                     sparseAnimCurveBake=False, minimizeRotation=False)
    sel = [rootj] + [ns + m for m in meshes if cmds.objExists(ns + m)]
    cmds.select(sel, r=True)
    if not cmds.pluginInfo("fbxmaya", q=True, l=True): cmds.loadPlugin("fbxmaya")
    mel.eval("FBXResetExport")
    mel.eval("FBXExportBakeComplexAnimation -v true")
    mel.eval("FBXExportBakeComplexStart -v %d" % start)
    mel.eval("FBXExportBakeComplexEnd -v %d" % end)
    mel.eval("FBXExportScaleFactor %g" % scale)
    mel.eval("FBXExportSkins -v true")
    mel.eval("FBXExportShapes -v true")
    mel.eval("FBXExportConstraints -v false")
    mel.eval("FBXExportInputConnections -v false")
    mel.eval("FBXExportUpAxis y")
    mel.eval('FBXExport -f "%s" -s' % path.replace("\\", "/"))
    return path
