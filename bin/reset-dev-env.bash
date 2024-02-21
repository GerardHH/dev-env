#!/usr/bin/bash

echo "Uninstall all nix installed applications"
nix-env --uninstall '.*'
echo "Remove all nix related folders in $HOME"
rm -rf "$HOME/.nix*"
