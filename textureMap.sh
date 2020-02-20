#!/usr/bin/env fish

# Works for scaling images and speed. Won't work with mixed filetypes.
ffmpeg -pattern_type glob -i "*.png" -filter_complex scale=2048:-1,tile=2x1 output(basename "$PWD").png

# Works with mixed filetypes, slow/CPU-bound and only works on MacOS for me?
convert *.* +append output(basename "$PWD").jpg
