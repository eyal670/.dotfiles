#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

$HOME/.config/bspwm/polybar/launch.sh &

#change your keyboard if you need it
setxkbmap -option grp:alt_shift_toggle -layout us,il

keybLayout=$(setxkbmap -v | awk -F "+" '/symbols/ {print $2}')

run sxhkd -c ~/.config/bspwm/sxhkd/sxhkdrc &
greenclip daemon &

nitrogen --restore &
xsetroot -cursor_name left_ptr &

picom --config $HOME/.config/bspwm/picom.conf --vsync --experimental-backends &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

#hide mouse when not moving - 'pacman -S unclutter'
unclutter -grab &

#lock screen on idle timer
#options: --not-when-audio, --not-when-fullscreen
if [ ! $(pgrep "xidlehook") ]; then
  notify-send "setting lock time"
  xidlehook --not-when-fullscreen --timer 900 'i3lock -t -i $HOME/Pictures/wallpapers/lockImage.png' '' &
fi
