#!/usr/bin/fish
echo "Starting \"monitors.sh\" script."
set desiredRefreshRate "119.98" # Change this if anything goes wrong. Default is "119.98". (120hz)
while true
	set actualRefreshRate (xrandr | grep -q -o "$desiredRefreshRate\*")

    if eval $actualRefreshRate
        echo "Everything is fine."
    else
        echo "Monitor isn't running at $desiredRefreshRate hz; changing."
        nvidia-settings --assign CurrentMetaMode="DP-5: nvidia-auto-select +0+0 {ForceFullCompositionPipeline=On}, DVI-I-1: 1920x1080_120 +1920+0 {ForceFullCompositionPipeline=On}, HDMI-0: nvidia-auto-select +3840+0 {ForceFullCompositionPipeline=On}" # Does the same as the xrandr method, but fixes screen tearing.
    end
    sleep 10
end
