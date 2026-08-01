#!/usr/bin/env bash
options() {
  echo "\
1 | Shutdown
2 | Reboot
3 | Suspend
"
}

sel=$(options | rofi -dmenu -c $HOME/dotfiles/.config/tofi/center)

if   [[ $sel = "1"* ]]; then shutdown now
elif [[ $sel = "2"* ]]; then systemctl reboot
elif [[ $sel = "3"* ]]; then systemctl suspend
else exit 0
fi
