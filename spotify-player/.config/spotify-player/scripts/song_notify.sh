#!/bin/sh
song=$(playerctl metadata --player=spotify_player --format "Title: {{ xesam:title }}\nArtist: {{ xesam:artist }}\nAlbum: {{ xesam:album }}")
dunstify "Spotify" "$song" --icon=~/.config/spotifyd/spotify.png -r 900
