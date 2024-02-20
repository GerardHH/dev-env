#!/bin/bash

pushd $HOME/dev-env

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
    nixpkgs.curl \
    nixpkgs.diff-so-fancy \
    nixpkgs.eza \
    nixpkgs.fd \
    nixpkgs.fzf \
    nixpkgs.git \
    nixpkgs.glibcLocales \
    nixpkgs.lazygit \
    nixpkgs.lua \
    nixpkgs.neovim \
    nixpkgs.nodejs_20 \
    nixpkgs.python3 \
    nixpkgs.python311Packages.pip \
    nixpkgs.ripgrep \
    nixpkgs.starship \
    nixpkgs.stow \
    nixpkgs.util-linux \
    nixpkgs.zellij \
    nixpkgs.zoxide \
    nixpkgs.zsh

echo "Install language servers"
nix-env --install --attr \
    nixpkgs.clang-tools \
    nixpkgs.lua-language-server \
    nixpkgs.marksman \
    nixpkgs.nodePackages.bash-language-server \
    nixpkgs.nodePackages.pyright

echo "Install static analyzers"
nix-env --install --attr \
    nixpkgs.mypy

echo "Install linters"
nix-env --install --attr \
    nixpkgs.ruff

echo "Install formatters"
nix-env --install --attr \
    nixpkgs.beautysh \
    nixpkgs.black \
    nixpkgs.stylua

# echo "Install debbuggers"

if git submodule status | grep --quiet '^-'; then
    echo "Initialize git submodules"
    git submodule update --recursive --init
fi

echo "Stow configurations"
stow --adopt .

SHELLS=/etc/shells
if ! grep --quiet '.nix-profile/bin/zsh' "$SHELLS"; then
    echo "Add zsh as a login shell"
    command -v zsh | sudo tee -a $SHELLS

    echo "Use zsh as default shell"
    sudo chsh -s $(which zsh) $USER

    echo "Enable zap package manager for zsh"
    command -v zsh | zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1 --keep
fi

source $HOME/dev-env/bin/setup-keychron.bash
fix_keychron_k2

source $HOME/dev-env/bin/setup-fonts.bash
install_hack

popd
