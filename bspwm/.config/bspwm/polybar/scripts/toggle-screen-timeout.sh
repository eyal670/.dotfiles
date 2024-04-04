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
    $HOME/.config/bspwm/scripts/screen-lock-on-idle.sh
fi
