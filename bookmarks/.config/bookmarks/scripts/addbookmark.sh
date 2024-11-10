#!/bin/sh

bookmark="$(xclip -o)"
file="$HOME/.config/bookmarks/bookmarks"

if grep -q "^$bookmark$" "$file"; then
    notify-send "Oops" "bookmark already exists"
else
    echo "$bookmark" >> "$file"
    notify-send "bookmark added" "$bookmark"
fi
