#!/bin/bash
  if [[ -z "$1"]] then
    xclip -selection clipboard -t image/png -o > "$(date +%Y-%m-%d_%T).png"
  else
    xclip -selection clipboard -t image/png -o > "$1.png"
  fi
 
