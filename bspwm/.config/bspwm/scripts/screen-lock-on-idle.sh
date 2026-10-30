#!/bin/bash

# Lock screen on idle timer
locktimer=60
inminuts=$((locktimer / 60))

if ! pgrep -x xidlehook >/dev/null; then
  notify-send "Setting screenlock timer to $inminuts minutes"

  xidlehook --not-when-fullscreen --timer "$locktimer" \
    'setxkbmap -option "" -layout us,il -option grp:alt_shift_toggle -option caps:escape -option terminate:ctrl_alt_bksp && xkb-switch -s us && i3lock -t -i "$HOME/Pictures/wallpapers/lockImage.png"' '' &
fi
