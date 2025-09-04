FROM python:3.13.5-alpine AS base

LABEL lang="python"
LABEL version="3.13.5"
LABEL org.opencontainers.image.source="https://github.com/krisalyssa/aoc"
LABEL org.opencontainers.image.description="Python image for AoC"

ENV DOCKER_APP_ROOT=/aoc

WORKDIR ${DOCKER_APP_ROOT}

RUN \
  apk add --update --no-cache \
  bash \
  curl \
  git \
  musl-dev \
  sudo \
  && \
  addgroup aoc && \
  adduser -G aoc -s /bin/bash -D aoc && \
  echo "aoc ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/aoc && \
  chown aoc:aoc ${DOCKER_APP_ROOT}

COPY --chown=aoc:aoc bin ${DOCKER_APP_ROOT}/bin/

USER aoc

RUN mkdir -p ${DOCKER_APP_ROOT}/data

ENV PYTHONPATH=${DOCKER_APP_ROOT}/src

ENTRYPOINT ["/bin/bash"]
