#!/bin/bash

awk '/^[a-z]/ && last {print "<small>",$0,"\t",last,"</small>"} {last=""} /^#/{last=$0}' ~/.config/bspwm/sxhkd/sxhkdrc{,.common} |
    column -t -s $'\t' |
    rofi -dmenu -p "sxhkd keybindings:" -i -markup-rows -no-show-icons -theme-str 'window { fullscreen: true; } listview{ columns: 4;}'
