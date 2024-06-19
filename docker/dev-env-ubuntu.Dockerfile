FROM ubuntu:22.04

# apt installation step
RUN apt update && apt upgrade && apt install --yes \
    build-essential \
    curl \
    git \
    sudo \
    zsh \
    && apt autoremove --yes

# Create same user as host, do this first so that the ID's don't get stolen
ARG USER
ARG USER_ID
ARG GROUP_ID

RUN groupadd --gid ${GROUP_ID} ${USER} && useradd --create-home --shell /bin/zsh --uid ${USER_ID} --gid ${GROUP_ID} ${USER}

# Install brew
ARG BREW_USER=linuxbrew
ARG BREW_PATH=/home/linuxbrew/.linuxbrew

RUN useradd --create-home --shell /bin/zsh ${BREW_USER} && \
    usermod --append --group sudo ${BREW_USER} && \
    passwd --delete linuxbrew && \
    echo '${BREW_USER} ALL=(ALL) NOPASSWD:ALL' >>/etc/sudoers && \
    mkdir --parent ${BREW_PATH} && \
    chown --recursive ${BREW_USER}: ${BREW_PATH}

USER ${BREW_USER}

# RUN cd ${BREW_PATH} && \
#     /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Finish up container for use
USER ${USER}

ENV PATH="${BREW_PATH}/bin:${PATH}"

ENTRYPOINT zsh
