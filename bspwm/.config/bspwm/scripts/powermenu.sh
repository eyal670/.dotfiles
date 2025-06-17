#! /bin/sh

chosen=$(printf "  Power Off\n  Restart\n  Lock\n󰍃  Logout\n󰖩  Networks\n  Fix keyboard layout\n  Charge full battery" | rofi -dmenu -i -theme-str '@import "power.rasi"')

case "$chosen" in
	"  Power Off") poweroff ;;
	"  Restart") reboot ;;
	"  Lock") i3lock -t -i $HOME/Pictures/wallpapers/lockImage.png  ;;
	"󰍃  Logout") kill -9 -1  ;;
	"󰖩  Networks") alacritty --class scratchTerm,scratchTerm -e "nmtui" ;;
	"  Fix keyboard layout") setxkbmap -option grp:alt_shift_toggle -layout us,il; setxkbmap -option caps:escape; notify-send "keyboard layout fixed" ;;
	"  Charge full battery") alacritty --class scratchTerm,scratchTerm -e sh -c 'echo "approve chanrging battery to 100%" && sudo tlp fullcharge && notify-send "charge battery to 100%"' ;;
	*) exit 1 ;;
esac
