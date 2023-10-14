#!/bin/bash

function stow_list()
{
    for package in "$@"
    do
        echo "stow $package"
        stow "$package"
    done
}

if [ ! -L "$HOME/.nix-profile" ]; then
    echo "Install nix"
    curl -L https://nixos.org/nix/install | sh
fi

echo "Source nix"
. ~/.nix-profile/etc/profile.d/nix.sh

echo "Install packages"
nix-env --install --attr \
    nixpkgs.bat \
    nixpkgs.cargo \
    nixpkgs.diff-so-fancy \
    nixpkgs.eza \
    nixpkgs.fd \
    nixpkgs.fzf \
    nixpkgs.lazygit \
    nixpkgs.lua \
    nixpkgs.neovim \
    nixpkgs.nodejs_20 \
    nixpkgs.ripgrep \
    nixpkgs.stow \
    nixpkgs.tmux \
    nixpkgs.xclip \
    nixpkgs.zsh

if git submodule status | grep --quiet '^-'; then
    echo "Initialize git submodules"
    git submodule update --recursive --init
fi

echo "Stow configurations"
stow_list \
    alacritty \
    git \
    lazygit \
    nvim \
    ripgrep \
    tmux \
    zsh

TPM_DIR=$HOME/.config/tmux/plugins/tpm
if [ ! -d "$TPM_DIR" ]; then
    echo "Install tmux package manager"
    mkdir -p $TPM_DIR
    git clone https://github.com/tmux-plugins/tpm $TPM_DIR

    echo "Setup tmux"
    # start a server but don't attach to it
    tmux start-server
    # create a new session but don't attach to it either
    tmux new-session -d
    # install the plugins
    $TPM_DIR/scripts/install_plugins.sh
    # killing the server is not required, I guess
    tmux kill-server
fi

SHELLS=/etc/shells
if ! grep --quiet '.nix-profile/bin/zsh' "$SHELLS"; then
    echo "Add zsh as a login shell"
    command -v zsh | sudo tee -a $SHELLS

    echo "Use zsh as default shell"
    sudo chsh -s $(which zsh) $USER

    echo "Enable zap package manager for zsh"
    command -v zsh | zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1 --keep
fi
