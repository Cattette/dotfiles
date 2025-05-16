#!/bin/bash
# Author: cattette
# short bash script that downloads videos as audio files with the possibility of organizing them into albums. Simply run this script with a url to a playlist as argument 1. See README for dependencies and further info.
URL="$1"
artls="$HOME/dotfiles/scripts/mudow/artist-list"
albumls="$HOME/dotfiles/scripts/mudow/album-list"
albumdir="$HOME/Music"

# Select artist, if artist is new it is added to list, if string empty program exits
# variable art is set to STDOUT of rofi operation
art=$($artls | rofi -dmenu)
# if string art is empty then exit
if  [ "$art" = "" ]; then
    exit 1
fi
# if string is not in list, add it to it
if ! grep -q "$art" $artls; then
    echo "echo \"$art\"" >> $artls
fi

# Select album, if album is new it is added to list, if string empty program exits
album=$($albumls | rofi -dmenu)
if  [ "$album" = "" ]; then
    exit 1
fi
if ! grep -q "$album" $albumls; then
    echo "echo \"$album\"" >> $albumls
fi

# add album directory if necessary
if ! [ -d "$albumdir/$album" ]; then
    mkdir "$albumdir/$album" 
fi

yt-dlp -x -o "%(playlist_index)s-%(title)s" -P "$albumdir/$album/" $URL

notify-send -t 2500 "Music downloaded successfully"

exit 0
