# mayapy_run.py -- run a script in mayapy, then end the process without the DLL teardown.
# mayaUsd crashes in its exit handlers, which writes a crash report on every mayapy exit.
#     mayapy tools/mayapy_run.py some_script.py [args...]
# Tip: set MAYA_SKIP_USERSETUP_PY=1 so userSetup tools (servers, UI hooks) do not start in the batch process.
import sys, os, ctypes, traceback, runpy
job = sys.argv[1]
sys.argv = sys.argv[1:]          # the script sees its own arguments
try:
    runpy.run_path(job, run_name="__main__")
except SystemExit:
    pass
except BaseException:
    traceback.print_exc()
sys.stdout.flush(); sys.stderr.flush()
k = ctypes.windll.kernel32
k.GetCurrentProcess.restype = ctypes.c_void_p                  # 64-bit handle (the default int would truncate it)
k.TerminateProcess.argtypes = [ctypes.c_void_p, ctypes.c_uint]
k.TerminateProcess(k.GetCurrentProcess(), 0)
