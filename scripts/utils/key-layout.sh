#!/bin/bash
# NAME=keyboard-layout

layoutls="\
us
se \
"

choice=$(printf '%s\n' "$layoutls" | awk '{print NR,$0}' | dmenu -c -l 5 -p "layouts" | awk '{print $2}')

setxkbmap -layout $choice && exit 0





