#! /bin/sh

lines=4
last_month_start=$(date --date="$(date +'%Y-%m-01') - 1 month" +%Y-%m-%d)
last_month_end=$(date --date="$(date +'%Y-%m-01') - 1 second" +%Y-%m-%d)
chosen=$(echo "this month|last month|today|set manually" | rofi -sep '|' -dmenu -p "TrackingTime total >" -i -l $lines )
case "$chosen" in
	"today") $HOME/.config/bspwm/polybar/scripts/trackingtime-today/main.py ;;
	"this month") $HOME/.config/bspwm/polybar/scripts/trackingtime-today/main.py -tf month ;;
    "last month") $HOME/.config/bspwm/polybar/scripts/trackingtime-today/main.py \
        -tf set \
        -sd $last_month_start \
        -ed $last_month_end   ;;
	"set manually") $HOME/.config/bspwm/polybar/scripts/trackingtime-today/main.py \
        -tf set \
        -sd $(echo $last_month_start | rofi -sep '|' -dmenu -p "start date > " -mesg "format: YYYY-M-D" -l $lines) \
        -ed $(echo $last_month_end | rofi -sep '|' -dmenu -p "end date > " -mesg "format: YYYY-M-D" -l $lines)   ;;
	*) exit 1 ;;
esac
