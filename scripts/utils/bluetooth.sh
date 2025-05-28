#!/bin/bash
# NAME=Bluetooth
devtoggle() {
  device="$1"
  if bluetoothctl info "$device" | grep 'Connected: yes' -q; then
    bluetoothctl disconnect "$device"
  else
    bluetoothctl connect "$device"
  fi
}

devls="\
NAME        MAC ADDRESS
Fii0,       40:ED:98:1A:3E:E2
CX Plus,    80:C3:BA:37:DC:1F \
"

MAC=$(printf '%s\n' "$devls" | awk -F ',' '{print NR,$0}' | dmenu -c -l 5 -p "devices" | awk -F ',' '{print $2}')

devtoggle $MAC && exit 0
