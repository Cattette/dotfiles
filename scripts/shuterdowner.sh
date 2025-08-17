#!/bin/sh
options() {
  echo "\
1 | Shutdown
2 | Reboot
3 | Suspend
"
}

sel=$(options | dmenu)

if   [[ $sel = "1"* ]]; then shutdown now
elif [[ $sel = "2"* ]]; then systemctl reboot
elif [[ $sel = "3"* ]]; then systemctl suspend
else exit 0
fi


