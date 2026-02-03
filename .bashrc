# Superarch bash loader
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Load superarch managed config
[ -f ~/.config/superarch/bash/bashrc ] && source ~/.config/superarch/bash/bashrc

# Load user overrides
[ -f ~/.config/custom/bash/bashrc ] && source ~/.config/custom/bash/bashrc
