#!/bin/sh

# install nix
curl -L https://nixos.org/nix/install | sh

# source nix
. ~/.nix-profile/etc/profile.d/nix.sh

# install packages
nix-env -iA \
	nixpkgs.lazygit \
	nixpkgs.neovim \
	nixpkgs.stow \
	nixpkgs.zsh

# stow configurations
stow nvim
stow zsh

# Add zsh as a login shell
command -v zsh | sudo tee -a /etc/shells

# Use zsh as default shell
sudo chsh -s $(which zsh) $USER

# Enable zap package manager for zsh
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1 --keep
