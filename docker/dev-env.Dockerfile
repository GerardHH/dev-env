FROM archlinux:base-devel

RUN pacman -Sy --needed --noconfirm \
    git \
    lazygit \
    neovim
