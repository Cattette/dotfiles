#!/bin/bash
# NAME=killer
item=$(ps -e | dmenu -c -l 18 -p "kill:" | awk '{print $4}')

if [[ !  -z $item ]]; then
  killall $item
else
  exit 0
fi
