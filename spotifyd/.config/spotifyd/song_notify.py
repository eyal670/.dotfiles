import spotipy
import subprocess as subp
import os
from spotipy.oauth2 import SpotifyOAuth
from dotenv import load_dotenv

# loading .env variables
load_dotenv()

sp = spotipy.Spotify(auth_manager=SpotifyOAuth(
    client_id=os.getenv('CLIENT_ID'),  # set in .env file
    client_secret=os.getenv('CLIENT_SECRET'),  # set in .env file
    redirect_uri="http://localhost:3090",
    scope="user-read-currently-playing",
    cache_path='./.spotipy_tokens.txt')
)

results = sp.current_user_playing_track()
# print(json.dumps(results))

playing = results["is_playing"]
title = results["item"]['name']
album = results['item']['album']['name']
duration_ms = results['item']['duration_ms']
duration_min = int(duration_ms / 60000)
duration_sec = str(int((duration_ms / 1000) - (duration_min * 60)))
if len(duration_sec) == 1:
    duration_sec = "0" + duration_sec
duration = str(duration_min) + ":" + duration_sec
artists_data = results['item']['artists']
artists_list = []
for artist in artists_data:
    artists_list.append(artist["name"])

artists = ", ".join(artists_list)
data = "Title: " + title + "\nArtist: " + artists + \
    "\nAlbum: " + album + "\nDuration: " + duration
subp.run(["dunstify", "Spotifyd", data, '-r', '900'])
