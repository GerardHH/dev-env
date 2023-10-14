#!/bin/zsh

# source $HOME/.nix-profile/share/fzf/completion.zsh
source $HOME/.nix-profile/share/fzf/key-bindings.zsh

# plug "Aloxaf/fzf-tab"
# zplug Valodim/zsh-capture-completion, as:command, use:capture.zsh, rename-to:capture.zsh

# Use normal tab as the trigger sequence instead of the default **
export FZF_COMPLETION_TRIGGER=''

# #Default options to fzf command
export FZF_DEFAULT_OPTS='--height 90% --layout=reverse --border'

# Use fd for listing path candidates
_fzf_compgen_path() {
    fd --hidden --exclude ".git" . "$1"
}

_fzf_compgen_dir() {
    fd --type directory --hidden --exclude ".git" . "$1"
}

# _fzf_comprun() {
#     local command=$1
#     shift
#
#     case $command in
#             (ssh) fzf --preview 'dig {}' "$@" ;;
#             (vi|cd)   fzf --preview "source $HOME/.config/zsh/plugins/fzf-preview.zsh && _preview_helper {}" "$@" ;;
#             (git) _complete_git ;;
#             (*) fzf "$@" ;;
#     esac
# }
