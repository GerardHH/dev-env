#!/bin/sh

set -o vi

# Source zap
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

# Source Nix
if [ -e /home/gerard/.nix-profile/etc/profile.d/nix.sh ]; then . /home/gerard/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# Plugins
plug "joshskidmore/zsh-fzf-history-search"
plug "zsh-users/zsh-syntax-highlighting"

# Source
plug "$HOME/.config/zsh/aliases.zsh"
plug "$HOME/.config/zsh/exports.zsh"

plug "$HOME/.config/zsh/plugins/eza.zsh"
plug "$HOME/.config/zsh/plugins/fzf-tab-completion.zsh"
plug "$HOME/.config/zsh/plugins/fzf.zsh"

# Load and initialise completion system
autoload -Uz compinit
compinit

eval "$(starship init zsh)"

eval "$(zellij setup --generate-auto-start zsh)"
