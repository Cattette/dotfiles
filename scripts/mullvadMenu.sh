#!/usr/bin/env bash
export XDG_RUNTIME_DIR=/run/user/$(id -u)
set -x

options() {
  echo "\
1 | Connect
2 | Disconnect
3 | Status
4 | Sw. Relay
"
}

sel=$(options | rofi -dmenu --prompt="mullvad" --width=12% -c $HOME/dotfiles/.config/tofi/center)

if   [[ $sel = "1"* ]]; then mullvad connect && sleep 1 && notify-send "$(mullvad status)"
elif [[ $sel = "2"* ]]; then mullvad disconnect
elif [[ $sel = "3"* ]]; then notify-send "$(mullvad status)"
elif [[ $sel = "4"* ]]; then
  loc=$(printf "$(mullvad relay list | sed '/^[[:space:]]\|^$/d')" |
  tofi -c $HOME/dotfiles/.config/tofi/center | awk -F'[()]' '{print $2}') 
  mullvad relay set location $loc 
  notify-send "$(mullvad relay get)"
  
else exit 0
fi
