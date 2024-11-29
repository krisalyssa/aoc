FROM rust:1.82-alpine3.20 AS base

LABEL lang="rust"
LABEL version="1.82-3"
LABEL org.opencontainers.image.source="https://github.com/krisalyssa/aoc"
LABEL org.opencontainers.image.description="Rust image for AoC"

ENV DOCKER_APP_ROOT=/aoc
WORKDIR $DOCKER_APP_ROOT

# bash \
# gcc \
# jq \
# make \
# musl-dev \
# tzdata \

RUN \
  apk add --update --no-cache \
  bash \
  curl \
  git \
  musl-dev \
  && \
  addgroup aoc && \
  adduser -G aoc -s /bin/bash -D aoc && \
  chown aoc:aoc $DOCKER_APP_ROOT
# && mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2 \

COPY --chown=aoc:aoc bin $DOCKER_APP_ROOT/bin

USER aoc

RUN \
  mkdir -p /aoc/data && \
  mkdir -p /aoc/src/target

ENTRYPOINT ["/bin/bash"]
