#!/bin/bash

if [ ! -f /usr/bin/wallhaven ]; then
  echo "Wallhaven-Downloader is not installed! Installing now..."
  cd /tmp
  git clone https://github.com/macearl/Wallhaven-Downloader.git
  echo "Sudo permissions are required for installing software."
  sudo mv Wallhaven-Downloader/wallhaven.sh /usr/bin/wallhaven
  # Move to /usr/bin
fi

mkdir -p ~/Temporary/Wallpapers

echo "Downloading NSFW Wallpapers..."
wallhaven -l /mnt/Homesweet/Photos/Wallpapers/NSFW -c 111 -f 001 -g 3840x3072 -m toplist -p 1 -n 72
echo "Downloading Sketchy Wallpapers..."
wallhaven -l /mnt/Homesweet/Photos/Wallpapers/Sketchy -c 111 -f 010 -g 3840x3072 -m toplist -p 1 -n 72
echo "Downloading SFW Wallpapers..."
wallhaven -l /mnt/Homesweet/Photos/Wallpapers/SFW -c 110 -f 100 -g 3840x3072 -m toplist -p 1 -n 72
# Download 72 >3840x3072 top wallpapers for the month.
# -c 111 = Any category (General, People, Anime)
# -f 110 = Filter for SFW, Semi-NSFW, NFSW.


rsync -Pau /mnt/Homesweet/Photos/Wallpapers/SFW/ ~/Temporary/Wallpapers

# Pre-downscaling images so that they don't look heavily aliased.
echo "Scaling images and copying to .Wallpapers_Scaled."
mkdir -p ~/Temporary/.Wallpapers_Scaled
cd ~/Temporary/Wallpapers
printf "["
for wallpaper in *.jpg; do
  if [ ! -f "../.Wallpapers_Scaled/$wallpaper" ]; then # If havent already been scaled; scale.
    printf "-"
    ffmpeg -i "$wallpaper" -vf scale=2800:-1 -sws_flags lanczos -q:v 1 "../.Wallpapers_Scaled/$wallpaper" -y -v quiet
    # Always scale to a higher resolution than native. Preserves sharpness.
    # Having this too high can cause severe aliasing. Especially with text/line-art.
    # 2800:-1 scale looks best for 1920x1080 displays.
  else
    printf "_"
  fi
done

# Ensure that all wallpapers are backed up and archived correctly.
printf "]\n\nAll wallpapers scaled & downloaded. Updating rolling archive at /mnt/Storage/Archive/Wallpapers...\n"
#mkdir -p /mnt/Storage/Archive/Wallpapers
#rsync -Pau ~/Temporary/Wallpapers /mnt/Storage/Archive/

printf "\n\nFinished!\n"
# Enjoy a sweet-looking desktop!
