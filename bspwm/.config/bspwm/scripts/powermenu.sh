#! /bin/sh

chosen=$(printf "  Power Off\n  Restart\n  Lock\n  Logout" | rofi -dmenu -i -theme-str '@import "power.rasi"')

case "$chosen" in
	"  Power Off") poweroff ;;
	"  Restart") reboot ;;
	"  Lock") i3lock -t -i $HOME/Pictures/wallpapers/lockImage.png  ;;
	"  Logout") kill -9 -1  ;;
	*) exit 1 ;;
esac
