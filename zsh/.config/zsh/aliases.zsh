#!/bin/sh

alias lg='lazygit'
alias vi='nvim'

# easier to read disk
alias df='df -h'     # human-readable sizes
alias free='free -m' # show sizes in MB

# Colorize output
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Fuzzy magic
FD="fd --hidden --follow --exclude '.git'"
alias fcd="cd \$($FD --type directory | fzf)"
alias fvi="vi \$($FD --type file | fzf)"
