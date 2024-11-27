FROM mcr.microsoft.com/devcontainers/typescript-node:1.1.6-22-bullseye AS base

LABEL lang="typescript"
LABEL version="1.1.6-2"
LABEL org.opencontainers.image.source="https://github.com/krisalyssa/aoc"
LABEL org.opencontainers.image.description="Typescript image for AoC"

ENV DOCKER_APP_ROOT=/aoc
WORKDIR $DOCKER_APP_ROOT

RUN \
  apt-get update -y && \
  apt-get dist-upgrade -y && \
  apt-get install -y \
    build-essential \
    curl \
    git \
    sudo \
    unzip \
    && \
  apt-get clean -y && \
  adduser --home /home/aoc --shell /bin/bash aoc && \
  echo "aoc ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/aoc && \
  chown aoc:aoc $DOCKER_APP_ROOT

COPY --chown=aoc:aoc bin $DOCKER_APP_ROOT/bin

USER aoc

RUN \
  mkdir -p /home/aoc/.cache && \
  mkdir -p $DOCKER_APP_ROOT/src && \
  mkdir -p $DOCKER_APP_ROOT/data && \
  cd $DOCKER_APP_ROOT/src && \
  sudo corepack enable

ENTRYPOINT ["/bin/bash"]
