#!/usr/bin/env fish
ffmpeg -pattern_type glob -i "*.png" -filter_complex scale=2048:-1,tile=2x1 output(basename "$PWD").png
