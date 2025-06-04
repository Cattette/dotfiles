#!/bin/sh
options() {
  echo "\
1 | Shutdown
2 | Reboot
"
}

sel=$(options | dmenu)

if   [[ $sel = "1"* ]]; then shutdown now
elif [[ $sel = "2"* ]]; then systemctl reboot
else exit 0
fi


