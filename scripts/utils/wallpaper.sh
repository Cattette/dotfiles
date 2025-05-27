#!bin/bash
# NAME wallpaper
wall=$(ls $HOME/dotfiles/wallpapers | grep ".feh" | rofi -dmenu)

bash $HOME/dotfiles/wallpapers/$wall
