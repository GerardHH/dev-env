#!/bin/bash

if command -v apt &> /dev/null; then
    echo "Updating apt"
    sudo apt update && \
        sudo apt upgrade --yes && \
        sudo apt autoremove
fi
