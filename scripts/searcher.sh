#!bin/bash

rawquery=$(xclip -o -selection primary)

query=$(echo "${rawquery// /+}")

#qutebrowser "https://www.google.com/search?q=$query"

enginels() {
  echo "---Select search engine---"
  echo "1-Google"
  echo "2-DuckDuckGo"
  echo "3-SearX"
}

selengine=$(enginels | rofi -dmenu)

if [ $selengine = "1-Google" ]; then
  $BROWSER "https://www.google.com/search?q=$query"
fi
if [ $selengine = '2-DuckDuckGo' ]; then
  $BROWSER "https://start.duckduckgo.com/?q=$query"
fi
if [ $selengine = '3-SearX' ]; then
  $BROWSER "https://search.privacyredirect.com/?q=$query"
fi
