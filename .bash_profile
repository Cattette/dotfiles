#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
# autostart x
if [ -z "$DISPLAY" ] && [ "$XDG_VTNRS" = 1 ]; then
  exec startx
fi
