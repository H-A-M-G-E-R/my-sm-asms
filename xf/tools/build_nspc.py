import glob, os.path, subprocess, sys

asm_paths = glob.glob('xf/music/*.asm') + glob.glob('xf/swappable_samples/*.asm')

for asm_path in asm_paths:
    nspc_path = os.path.splitext(asm_path)[0] + '.nspc'
    try:
        os.remove(nspc_path)
    except:
        pass
    subprocess.run(sys.argv[1:] + ['--fix-checksum=off', asm_path, nspc_path])
