#!/bin/sh
song=$(playerctl metadata --player=spotifyd --format "Title: {{ xesam:title }}\nArtist: {{ xesam:artist }}\nAlbum: {{ xesam:album }}")
dunstify "Music Player" "$song" --icon=~/.config/spotifyd/spotify.png -r 900 -u urgent

