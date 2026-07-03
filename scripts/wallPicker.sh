#!/usr/bin/env bash

WALL=$(nsxiv -otb -N wallPicker ~/Pictures/wallpapers/)

cp $WALL ~/Pictures/wallpapers/wall

swaymsg reload
