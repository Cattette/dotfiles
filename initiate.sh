#!/usr/bin/env bash
# script to switch between 1440p and 1080p
switch() {
    file="$1"
    if [ -e "$file.laptop" ];
    then
        mv -v $file $file.pc
        mv -v $file.laptop $file
    else
        mv -v $file $file.laptop
        mv -v $file.pc $file
    fi
}

switch .config/polybar/config.ini
switch .config/kitty/usr-kitty.conf
switch .config/rofi/config.rasi
