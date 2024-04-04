#!/bin/bash

#lock screen on idle timer
#options: --not-when-audio, --not-when-fullscreen
locktimer=900
inminuts=$((locktimer/60))
if [ ! $(pgrep "xidlehook") ]; then
  notify-send "setting screenlock timer to $inminuts minuts"
  xidlehook --not-when-fullscreen --timer $locktimer 'i3lock -t -i $HOME/Pictures/wallpapers/lockImage.png' '' &
fi
