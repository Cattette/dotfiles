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
if ! [ -d "$albumdir/$art - $album" ]; then
    mkdir "$albumdir/$art - $album" 
fi
# download the vieos from the URL, i.e the first arg
yt-dlp -x -o "%(playlist_index)s-%(title)s" -P "$albumdir/$art - $album/" $URL 
f
# this section handles metadata, we cd into the directory in case the album name has spaces in it. This is the only way i managed to get the 'for' command to work.
cd "$albumdir/$art - $album"
for file in ./*.opus; do
    # make copy of file with metadata
    tempfile="${file}_temp"
    ffmpeg -i "$file" -c copy \
    -metadata artist="$art" \
    -metadata album="$album" \
    "$tempfile.opus"
    
    # replace the original
    mv "$tempfile.opus" "$file"
done
notify-send -t 2500 "mudow" "Music downloaded successfully"

exit 0
