FROM ubuntu:22.04

# apt installation step
RUN apt update && apt upgrade && apt install --yes \
    build-essential \
    zsh \
    && apt autoremove --yes

# Create same user as host, do this first so that the ID's don't get stolen
ARG USER
ARG USER_ID
ARG GROUP_ID

RUN groupadd --gid ${GROUP_ID} ${USER} && useradd --create-home --shell /bin/zsh --uid ${USER_ID} --gid ${GROUP_ID} ${USER}

# Finish up container for use
USER ${USER}

ENTRYPOINT zsh
