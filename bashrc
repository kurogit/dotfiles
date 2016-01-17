#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

localfile="$HOME/.bashrc.local"
if [ -f ${localfile} ]; then
    source ${localfile}
fi

alias ls='ls --color=auto -h'
alias ll='ls -hl'

alias g='gvim --remote-silent'
alias cower='cower -c'

PS1='[\u@\h \W]\$ '
