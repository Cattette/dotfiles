export XSESSION_PID="$$"
export TERMINAL="/usr/local/bin/st"
xbindkeys &
bash $HOME/dotfiles/.usr-startup
bash $HOME/dotfiles/.usr-input
exec dwm
