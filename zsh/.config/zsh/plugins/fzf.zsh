#!/bin/sh

# Plug pluggin, but ignore output. To prevent `fzf-tab-completion not activated`
plug "lincheney/fzf-tab-completion" > /dev/null

# Enable fzf-zsh-completion
source $ZAP_PLUGIN_DIR/fzf-tab-completion/zsh/fzf-zsh-completion.sh

# Set <TAB> to autocomplete
bindkey '^I' fzf_completion

# Enable completion for everything
zstyle ':completion:*' fzf-search-display true

# fzf powered history search
plug "joshskidmore/zsh-fzf-history-search"

# #Default options to fzf command
export FZF_DEFAULT_OPTS='--height 90% --layout=reverse --border --cycle'

_fzf_compgen_path() {
    fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
    fd --type d --hidden --follow --exclude ".git" . "$1"
}
