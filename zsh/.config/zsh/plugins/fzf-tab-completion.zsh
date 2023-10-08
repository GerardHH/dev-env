# Plug pluggin, but ignore output. To prevent `fzf-tab-completion not activated`
plug "lincheney/fzf-tab-completion" > /dev/null

# Enable fzf-zsh-completion
source $ZAP_PLUGIN_DIR/fzf-tab-completion/zsh/fzf-zsh-completion.sh

# Set <TAB> to autocomplete
bindkey '^I' fzf_completion

# Enable completion for everything
zstyle ':completion:*' fzf-search-display true
