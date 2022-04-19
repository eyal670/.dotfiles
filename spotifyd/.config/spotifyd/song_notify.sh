#!/bin/sh
song=$(playerctl metadata --player=spotifyd --format "Title: {{ xesam:title }}\nArtist: {{ xesam:artist }}\nAlbum: {{ xesam:album }}")
notify-send "Music Player" "$song" --icon=~/.config/spotifyd/spotify.png

