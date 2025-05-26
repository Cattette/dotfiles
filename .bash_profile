#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
# autostart x
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
startx
fi
