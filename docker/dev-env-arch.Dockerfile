# FROM archlinux:base-devel
FROM robertdebock/docker-archlinux-systemd

ARG USER
ARG USER_ID
ARG GROUP_ID

# Create same user as host
RUN groupadd --gid ${GROUP_ID} ${USER} && useradd --create-home --uid ${USER_ID} --gid ${GROUP_ID} --groups wheel ${USER}

# Remove need for password (please fix), needed for running makepkg
RUN passwd -d ${USER} && echo "${USER} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Pull and setup yay
RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm base-devel git && \
    mkdir -p /tmp/yay-build && \
    chown ${USER}:${USER} /tmp/yay-build && \
    su - ${USER} -c "git clone https://aur.archlinux.org/yay.git /tmp/yay-build/yay" && \
    su - ${USER} -c "cd /tmp/yay-build/yay && makepkg -si --noconfirm" && \
    rm -rf /tmp/yay-build

RUN yay -Sy --needed --noconfirm \
    eza \
    fzf \
    git \
    lazygit \
    navi \
    ncurses \
    neovim \
    oh-my-posh \
    tmux \
    zoxide \
    zsh

USER ${USER}

ENTRYPOINT zsh
