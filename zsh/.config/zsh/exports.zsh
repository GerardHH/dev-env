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

# Set locale support for terminal
export LOCALE_ARCHIVE="$(nix-env --installed --no-name --out-path --query glibc-locales)/lib/locale/locale-archive"
