#!/bin/bash

# Set up commands
command1="xset s 0 0 && xset -dpms && pkill xidlehook"
command2="xset s 600 600 && xset dpms"

# Set up the state variable
STATE=$(xset q | grep "DPMS is" | awk '{print $3}')

# Run commands based on the value of STATE variable
if [ "$STATE" = "Enabled" ]; then
    dunstify "Disable auto display off on idle"
    eval $command1
elif [ "$STATE" = "Disabled" ]; then
    dunstify "Enable auto display off on idle"
    eval $command2
    #lock screen on idle timer
    #options: --not-when-audio, --not-when-fullscreen
    locktimer=900
    inminuts=$((locktimer/60))
    if [ ! $(pgrep "xidlehook") ]; then
      notify-send "setting screenlock timer to $inminuts minuts"
      xidlehook --not-when-fullscreen --timer $locktimer 'i3lock -t -i $HOME/Pictures/wallpapers/lockImage.png' '' &
    fi

fi
