#!/usr/bin/env bash
# first arg is device address
device="$1"

if bluetoothctl info "$device" | grep 'Connected: yes' -q; then
  bluetoothctl disconnect "$device"
else
  bluetoothctl connect "$device"
fi