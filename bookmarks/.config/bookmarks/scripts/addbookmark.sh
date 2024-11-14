#!/bin/sh

bookmark="$(xclip -o)"
file="$HOME/.local/share/bookmarks/bookmarks"

if grep "$bookmark$" "$file"; then
    notify-send "Oops" "bookmark already exists"
else
    echo " # $bookmark" >> "$file"
    notify-send "bookmark added" "$bookmark"
fi
