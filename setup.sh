#!/bin/sh

# install nix
curl -L https://nixos.org/nix/install | sh

# source nix
. ~/.nix-profile/etc/profile.d/nix.sh

# install packages
nix-env -iA \
    nixpkgs.cargo \
    nixpkgs.fzf \
    nixpkgs.lazygit \
    nixpkgs.neovim \
    nixpkgs.nodejs_20 \
    nixpkgs.ripgrep \
    nixpkgs.stow \
    nixpkgs.zsh

# Initialize git submodules
git submodules update --recursive --init

# stow configurations
stow git
stow nvim
stow ripgrep
stow zsh

# Add zsh as a login shell
command -v zsh | sudo tee -a /etc/shells

# Use zsh as default shell
sudo chsh -s $(which zsh) $USER

# Enable zap package manager for zsh
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1 --keep
