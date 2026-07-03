#!/usr/bin/env bash

img="$1" 
viewer="swayimg"

magick "$img" "$img".png && $viewer "$img".png && rm "$img".png
