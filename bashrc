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

if which ruby >/dev/null && which gem >/dev/null; then
    PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi
