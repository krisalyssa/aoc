FROM mcr.microsoft.com/devcontainers/typescript-node:1.1.6-22-bullseye AS base

LABEL lang="typescript"
LABEL version="1.1.6-1"

ENV DOCKER_APP_ROOT=/aoc
WORKDIR $DOCKER_APP_ROOT

RUN \
  apt-get update -y && \
  apt-get dist-upgrade -y && \
  apt-get clean -y && \
  adduser --home /home/aoc --shell /bin/bash aoc && \
  chown aoc:aoc $DOCKER_APP_ROOT

RUN \
  mkdir -p $DOCKER_APP_ROOT/bin && \
  mkdir -p $DOCKER_APP_ROOT/src && \
  mkdir -p $DOCKER_APP_ROOT/data
COPY --chown=aoc:aoc run test $DOCKER_APP_ROOT/bin

USER aoc

ENTRYPOINT ["/bin/bash"]