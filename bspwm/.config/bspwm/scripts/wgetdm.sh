#! /bin/sh

chosen=$(printf "Download\nAdd to list from cilpboard or selection\nEdit list\nClear list" | rofi -dmenu -i -theme-str '@import "power.rasi"')

case "$chosen" in
	"Download") alacritty --hold --class scratchTerm,scratchTerm -e wget -c -i ~/Downloads/.list -P ~/Downloads ;;
	"Add to list from cilpboard or selection") xclip -o >> ~/Downloads/.list && dunstify "added to download list from xclip" ;;
	"Clear list") echo > ~/Downloads/.list && dunstify "clear download list complete" ;;
	"Edit list") alacritty --hold --class scratchTerm,scratchTerm -e nvim ~/Downloads/.list ;;
	*) exit 1 ;;
esac
