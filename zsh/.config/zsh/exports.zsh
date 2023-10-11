#!/bin/sh

export EDITOR="nvim"
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

# History
# History file location + creation
export HISTFILE="$HOME/.cache/zsh/zsh_history"
[ ! -e $HISTFILE ] && mkdir -p "$(dirname $HISTFILE)" && touch "$HISTFILE"

# History options
HISTSIZE=100000
SAVEHIST=$HISTSIZE
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_FIND_NO_DUPS

# Setting for the UTF-8 terminal support
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
