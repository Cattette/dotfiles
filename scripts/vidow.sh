#!/bin/bash
yt-dlp --force-overwrites -P /tmp -o video.mp4 $1

notify-send "Download Complete" -t 1500

echo "file://tmp/video.mp4" | wl-copy -t text/uri-list && rm -f /tmp/recuri
