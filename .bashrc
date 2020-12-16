#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

HISTSIZE=5000
HISTFILESIZE=5000
PATH=$HOME/scripts:$PATH

alias la='ls -la --color=auto'
alias vim='nvim'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

source /home/ecal/.config/broot/launcher/bash/br

# Starship prompt
eval "$(starship init bash)"
