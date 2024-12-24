#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

# make external monitor as primary
HDMI_monitor=$(xrandr | grep " connected " | grep -e "HDMI" | awk '{ print$1 }')
connected_monitor=$(xrandr | grep " connected " | awk '{ print$1 }')
if [ $HDMI_monitor ]; then
    xrandr --output $HDMI_monitor --primary
    notify-send "autostart.sh:" "set monitor $HDMI_monitor as primary"
    # /home/eyal/.screenlayout/laptop-right.sh
    # notify-send "autostart.sh:" "set laptop position to right"
else
    xrandr --output $connected_monitor --primary
    notify-send "autostart.sh:" "set monitor $connected_monitor as primary"
fi

$HOME/.config/bspwm/polybar/launch.sh &

#change your keyboard if you need it
setxkbmap -option grp:alt_shift_toggle -layout us,il

keybLayout=$(setxkbmap -v | awk -F "+" '/symbols/ {print $2}')

#disable caps lock
setxkbmap -option caps:escape

run sxhkd -c ~/.config/bspwm/sxhkd/sxhkdrc &
greenclip daemon &

nitrogen --restore &
xsetroot -cursor_name left_ptr &

picom --config $HOME/.config/bspwm/picom.conf --vsync &

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

#hide mouse when not moving - 'pacman -S unclutter'
unclutter -grab &

xfce4-power-manager &
optimus-manager-qt &

python3 $HOME/DevLab/Scripts/ron_bot/main.py &
