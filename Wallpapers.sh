#!/bin/bash

if [ ! -f /usr/bin/wallhaven ]; then
  echo "Wallhaven-Downloader is not installed! Installing now..."
  cd /tmp
  git clone https://github.com/macearl/Wallhaven-Downloader.git
  echo "Sudo permissions are required for installing software."
  sudo mv Wallhaven-Downloader/wallhaven.sh /usr/bin/wallhaven
  # Move to /usr/bin
fi

mkdir -p ~/Temporary

echo "Downloading Wallpapers..."
wallhaven -l ~/Temporary/Wallpapers -c 111 -f 110 -g 3840x3072 -m toplist -p 1 -n 72
# Download 72 >3840x3072 top wallpapers for the month.
# -c 111 = Any category (General, People, Anime)
# -f 110 = Filter for SFW, Semi-NSFW, NFSW.

# Pre-downscaling images so that they don't look heavily aliased.
echo "Scaling images and copying to .Wallpapers_Scaled."
mkdir -p ~/Temporary/.Wallpapers_Scaled
cd ~/Temporary/Wallpapers
printf "["
for wallpaper in *.jpg; do
  if [ ! -f "../.Wallpapers_Scaled/$wallpaper" ]; then # If haven't already been scaled; scale.
    printf "-"
    ffmpeg -i "$wallpaper" -vf scale=2800:-1 -q:v 1 "../.Wallpapers_Scaled/$wallpaper" -y -v quiet
    # Always scale to a higher resolution than native. Preserves sharpness.
    # Having this too high can cause severe aliasing. Especially with text/line-art.
  else
    printf "_"
  fi
done

printf "]\n\nFinished!\n"
# Enjoy a sweet-looking desktop!
