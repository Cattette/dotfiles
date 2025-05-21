#
# ~/.bashrc
#

# ble.sh sourcing
#[[ $- == *i* ]] && source /usr/share/blesh/ble.sh --noattach

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias grep='grep --color=auto'
#PS1='[\u@\h \W]\$ '
PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null)'; PS1='\[\e[94m\]\w\[\e[0m\] \[\e[2m\]${PS1_CMD1}\n\[\e[0;35m\]\$\[\e[0m\] '
bind 'TAB:menu-complete'

export BROWSER="/usr/bin/qutebrowser"
export TERMINAL="/usr/local/bin/st"
export EDITOR="vim"

# set bat as manual viewer
export MANPAGER="sh -c 'sed -u -e \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -lman'"

# help highlighting with bat
alias bathelp='bat --plain --language=help'
help() {
    "$@" --help 2>&1 | bathelp
}

alias ls="eza -w 70 -a"

# ble.sh on last line
#[[ ! ${BLE_VERSION-} ]] || ble-attach
