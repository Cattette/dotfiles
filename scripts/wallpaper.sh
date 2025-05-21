#!bin/bash
wall=$(ls $HOME/dotfiles/wallpapers | grep ".feh" | rofi -dmenu)

bash $HOME/dotfiles/wallpapers/$wall
