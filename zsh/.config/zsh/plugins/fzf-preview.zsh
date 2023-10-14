#!/bin/zsh

_preview_helper() {
    local input=$1
    case $(stat -c%F $input) in
            ("directory")    eza --color=always --icons --level=1 --tree $input ;;
            (*) bat --color=always --line-range=:100 --number $input ;;
    esac

}
