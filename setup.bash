#!/bin/bash

function stow_list()
{
    for package in "$@"
    do
        echo "stow $package"
        stow "$package" 2> /dev/null
    done
}

if [ ! -L "$HOME/.nix-profile" ]; then
    echo "Install nix"
    curl -L https://nixos.org/nix/install | sh

    echo "Source nix"
    . ~/.nix-profile/etc/profile.d/nix.sh

    echo "Install packages"
    nix-env --install --attr \
        nixpkgs.cargo \
        nixpkgs.fzf \
        nixpkgs.lazygit \
        nixpkgs.neovim \
        nixpkgs.nodejs_20 \
        nixpkgs.ripgrep \
        nixpkgs.stow \
        nixpkgs.zsh
fi

if git submodule status | grep --quiet '^-'; then
    echo "Initialize git submodules"
    git submodule update --recursive --init
fi

echo "Stow configurations"
stow_list \
    git \
    nvim \
    ripgrep \
    zsh

SHELLS=/etc/shells
if ! grep --quiet '.nix-profile/bin/zsh' "$SHELLS"; then
    echo "Add zsh as a login shell"
    command -v zsh | sudo tee -a $SHELLS

    echo "Use zsh as default shell"
    sudo chsh -s $(which zsh) $USER

    echo "Enable zap package manager for zsh"
    command -v zsh | zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1 --keep
fi
