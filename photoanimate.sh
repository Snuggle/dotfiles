#!/usr/bin/env bash
for f in *.heic;do heif-convert "$f" "${f%heic}jpg";done
echo "Removing all HEIC images..."
read -p "Press ENTER to continue."
rm *.heic
ffmpeg -f image2 -r 1/0.3 -pattern_type glob -i '*.jpg' -c:v libx264 -metadata creation_time="2019-08-06 12:00:00" -vf scale="(iw*sar)*min(3840/(iw*sar)\,2160/ih):ih*min(3840/(iw*sar)\,2160/ih), pad=3840:2160:(3840-iw*min(3840/iw\,2160/ih))/2:(1440-ih*min(3840/iw\,2160/ih))/2" out.mp4 # https://superuser.com/questions/249101/how-can-i-combine-30-000-images-into-a-timelapse-movie
