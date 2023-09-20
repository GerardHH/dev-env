# install nix
curl -L https://nixos.org/nix/install | sh

# source nix
. ~/.nix-profile/etc/profile.d/nix.sh

# install packages
nix-env -iA \
	nixpkgs.lazygit \
	nixpkgs.neovim \
	nixpkgs.stow

# stow configurations
stow nvim
