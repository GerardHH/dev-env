#!/bin/sh

set -o vi

# Source zap
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

# Source Nix
if [ -e /home/gerard/.nix-profile/etc/profile.d/hm-session-vars.sh ]; then . /home/gerard/.nix-profile/etc/profile.d/hm-session-vars.sh; fi
if [ -e /home/gerard/.nix-profile/etc/profile.d/nix.sh ]; then . /home/gerard/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# Plugins
plug "zsh-users/zsh-syntax-highlighting"

# Source
plug "$HOME/.config/zsh/aliases.zsh"
plug "$HOME/.config/zsh/exports.zsh"

plug "$HOME/.config/zsh/plugins/eza.zsh"
plug "$HOME/.config/zsh/plugins/fzf.zsh"

# Load and initialise completion system
autoload -Uz compinit
compinit

plug "$HOME/.config/zsh/proprietary/tasks.zsh"
plug "$HOME/.config/zsh/proprietary/alias.zsh"

eval "$(starship init zsh)"

eval "$(zoxide init --cmd cd zsh)"

eval "$(navi widget zsh)"

# Auto start tmux if stdin is not a TTY and exit terminal on tmux exit
if [ -t 0 ] && [[ -z $TMUX ]] && [[ $- = *i* ]]; then exec tmux; fi

