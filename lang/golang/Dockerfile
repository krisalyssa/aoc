FROM golang:1.25.1-alpine3.22 AS base

LABEL lang="golang"
LABEL version="1.25.1"
LABEL org.opencontainers.image.source="https://github.com/krisalyssa/aoc"
LABEL org.opencontainers.image.description="Golang image for AoC"

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
RUN mkdir -p /home/aoc/.cache
RUN mkdir -p /home/aoc/.config
RUN mkdir -p /go/pkg

ENTRYPOINT ["/bin/bash"]
