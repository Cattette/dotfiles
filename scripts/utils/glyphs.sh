#!/bin/bash
# NAME=glyphs

lsvowel="\
a
c
e
i
o
u
"

lsdiacritic="\
ring
diaeresis
cedilla
circumflex
acute
"

vowel=$(printf '%s\n' $lsvowel | awk -F ' ' '{print NR,$0}' | dmenu -c -l 10 | awk -F ' ' '{print $2}') 


diacritic=$(printf '%s\n' $lsdiacritic | awk -F ' ' '{print NR,$0}' | dmenu -c -l 10 | awk -F ' ' '{print $2}') 

if [[ -z $vowel ]]; then 
  exit 0 
fi

xdotool key $vowel$diacritic 

exit 0
