#!/bin/bash
# script for selecting utilities. useful if too many keybinds

# collect labels for dmenu from file headers
labels=$(
cd ./utils
for file in ./*sh; do
  sed -n '2p' $file | awk '{print $3}'
done
)
# dmenu label gets number, number is removed before STDOUT
choice=$(printf '%s\n' $labels | awk '{print NR,$1}' | dmenu -c -l 11 -p "sysutils" | awk '{print $2}')
if [[ -z $choice ]]; then 
  exit 0 
fi
# dmenu STDOUT serves as keyword to find script file. What could go wrong?
util=$(grep -rl './utils' -e $choice)

bash $util & exit 0
