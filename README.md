# Setup
First clone repo onto system. The assumed path it `$HOME/dev-env`:
`cd && git clone https://github.com/GerardHH/dev-env.git`

Second run:
`$HOME/dev-env/bin/setup-dev-env.bash`

This should setup the whole user system.

Use `home-manager switch` when changes are made to `home.nix`. Other configuration files/folders are symlinks to the appropiate files/folders in the `dev-env`.

## Notes
- Install awesome on system.
- Alacrity/kitty doesn't work through NIX. Install through normal means.
-- Or use `nixGL alacritty`, can't figure out on how to call it through awesome though.
- Install libstdc++{version}-dev on host machine, where version must be the same as the used clang compiler.
-- Or latest version supported by the repo and pray.
- Install xclip (or other clipboard manager) from system. Some can't find libbsd if installed through nix.
