# Requires superfamiconv (https://github.com/Optiroc/SuperFamiconv)
import glob, os, sys, subprocess

png_paths = glob.glob('xf/**/*.png', recursive=True)

for png_path in png_paths:
    gfx_path = os.path.splitext(png_path)[0] + '.gfx'

    if os.access(gfx_path, os.F_OK):
        continue

    subprocess.run(sys.argv[1:] + ['-R', '-D', '-F', '-i', png_path, '-t', gfx_path])
