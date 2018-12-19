#!/bin/bash
echo "Pausing variety."
variety --pause
echo "Changing to set wallpaper."
variety ~/Temporary/.Wallpapers_Scaled/wallhaven-628751.jpg
#sleep 1
variety --next
variety --pause

echo "Sending notification."
notify-send -i $(variety --get | sed -n 2p) "Wallpaper Script" "Wallpaper switching has been paused."
