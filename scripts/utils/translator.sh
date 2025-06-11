#!bin/bash
#NAME=translate
query=$(xclip -o -selection primary)

tran=$(trans -brief "$query")

notify-send -t 5000 "$tran"

