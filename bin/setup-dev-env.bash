#!/bin/bash

pushd $HOME/dev-env

echo "Install nix"
curl -L https://nixos.org/nix/install | sh

echo "Source nix"
. ~/.nix-profile/etc/profile.d/nix.sh

echo "Install home-manager"
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install

echo "Home manager magic"
home-manager switch

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
