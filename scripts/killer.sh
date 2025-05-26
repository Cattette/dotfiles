#!/bin/bash

item=$(ps -e | dmenu | awk '{print $4}')

if [[ !  -z $item ]]; then
  killall $item
else
  exit 0
fi
