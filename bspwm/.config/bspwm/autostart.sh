#!/bin/bash

function run {
  if ! pgrep $1; then
    $@ &
  fi
}

#config multi-monitors
$HOME/.config/bspwm/scripts/multi-display.sh

$HOME/.config/bspwm/polybar/launch.sh &

#change your keyboard if you need it
setxkbmap -option grp:alt_shift_toggle -layout us,il

keybLayout=$(setxkbmap -v | awk -F "+" '/symbols/ {print $2}')

#disable caps lock
setxkbmap -option caps:escape

#make sure num lock is on
xset q | grep -q "Num Lock:\s*on" || xdotool key Num_Lock

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

uv run $HOME/DevLab/Scripts/ron_bot/ron_bot.py &

python3 -m http.server 8338 --directory "$HOME/DevLab/local-http/" >/dev/null 2>&1 &

/home/eyal/.dotfiles/bspwm/.config/bspwm/scripts/screen-lock-on-idle.sh &
