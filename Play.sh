#!/bin/bash
echo "Resuming variety."
variety --resume
echo "Changing to next wallpaper."
variety --next


echo "Sending notification."
notify-send -i $(variety --get | sed -n 2p) "Wallpaper Script" "Wallpaper has been switched to the next image in the queue."
