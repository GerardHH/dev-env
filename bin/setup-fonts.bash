#!/usr/bin/bash

function install_hack() {
    if [ -f "$HOME/.local/share/fonts/HackNerdFont-Regular.ttf" ]; then
        echo "Detected hack nerd font, skipping"
        return 0
    fi

    local target=https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/Hack.zip
    local output=$HOME/Downloads/Hack.zip
    echo "Downloading $target to $output"
    if curl -L "$target" --output "$output"; then
        echo "Downloading fonts failed, stopping"
        return 1
    fi

    local fonts_folder=$HOME/.local/share/fonts/
    echo "Make dir $fonts_folder"
    mkdir -p "$fonts_folder"

    echo "Extract $output to $fonts_folder"
    unzip "$output" -d "$fonts_folder"

    echo "Update the font cache"
    sudo fc-cache -v -f
}
