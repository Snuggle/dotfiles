#!/bin/bash

while :
do
    if [ $(ps -ef | grep -o obs | wc -l) -gt 1 ]; then             # If OBS is open; (>1 process b'cuz grep is a process)
        if [ $(nvidia-settings -t -q 0/AllowFlipping) == 1 ]; then
            nvidia-settings -a 0/AllowFlipping=0                   # Disable flipping so the recording bug doesn't happen
        fi
    else
        if [ $(nvidia-settings -t -q 0/AllowFlipping) == 0 ]; then
            nvidia-settings -a 0/AllowFlipping=1                   # Otherwise, enable flipping to stop vsync tearing issues.
        fi
    fi
    sleep 10
done
