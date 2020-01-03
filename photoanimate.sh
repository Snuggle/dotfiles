#!/usr/bin/env bash
ffmpeg -f image2 -r 1/0.3 -pattern_type glob -i '*.jpg' -c:v libx265 -vf scale="(iw*sar)*min(2560/(iw*sar)\,1440/ih):ih*min(2560/(iw*sar)\,1440/ih), pad=2560:1440:(2560-iw*min(2560/iw\,1440/ih))/2:(1440-ih*min(2560/iw\,1440/ih))/2" out.mp4 # https://superuser.com/questions/249101/how-can-i-combine-30-000-images-into-a-timelapse-movie
