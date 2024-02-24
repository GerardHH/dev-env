# Setup
First clone repo onto system. The assumed path it `$HOME/dev-env`:
`cd && git clone https://github.com/GerardHH/dev-env.git`

Second run:
`$HOME/dev-env/bin/setup-dev-env.bash`

This should setup the whole user system.

Use `home-manager switch` when changes are made to `home.nix`. Other configuration files/folders are symlinks to the appropiate files/folders in the `dev-env`.

## Notes
- Install awesome on system.
- Install xclip (or other clipboard manager) from system. Some can't find libbsd if installed through nix.

## Bugs
- beutysh.lua, ruff.lua and clang_format.lua are being deprecated in March.
- When installing for the first time, the Alacritty.desktop symlink in home.nix will terrorize the `home-manager switch` that is being done in `setup-dev-env.bash`. Comment it out and run `setup-dev-env.bash` again, after that comment the line in again and run `setup-dev-env.bash` again. The problem is about the file `Alacritty.desktop` not yet existing before it is installed, but home-manager will care.
