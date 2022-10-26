#! /bin/sh

chosen=$(printf "  Power Off\n  Restart\n  Lock\n  Logout\n直 Networks" | rofi -dmenu -i -theme-str '@import "power.rasi"')

case "$chosen" in
	"  Power Off") poweroff ;;
	"  Restart") reboot ;;
	"  Lock") i3lock -t -i $HOME/Pictures/wallpapers/lockImage.png  ;;
	"  Logout") kill -9 -1  ;;
	"直 Networks") alacritty --class scratchTerm,scratchTerm -e "nmtui" ;;
	*) exit 1 ;;
esac
