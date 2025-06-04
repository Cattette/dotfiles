#!/bin/bash
prompt="\
;w;https://en.wikipedia.org/w/index.php?search=
;s;https://search.privacyredirect.com/?q=
;aw;https://wiki.archlinux.org/index.php?search=
;map;https://www.google.com/maps/place/
"

input=$(cat ./.history | dmenu -c -p "search" -l 10)

if [[ -z $input ]]; then
  exit 0
fi

sengine=$(echo $input | awk '{print $1}')
sterm=$(echo $input | awk '{$1=""; print $0}' | tr ' ' '+' )

$BROWSER $(printf '%s\n' $prompt | grep ";$sengine;" | awk -F ';' '{print $3}')${sterm:1}
