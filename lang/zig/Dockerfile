FROM alpine:3.20.3 AS base

LABEL lang="zig"
LABEL version="0.12.0-1"
LABEL org.opencontainers.image.source="https://github.com/krisalyssa/aoc"
LABEL org.opencontainers.image.description="Zig image for AoC"

ENV DOCKER_APP_ROOT=/aoc
WORKDIR $DOCKER_APP_ROOT

# gcc \
# jq \
# make \
# tzdata \

RUN \
  apk add --update --no-cache \
  bash \
  curl \
  git \
  musl-dev \
  sudo \
  zig \
  && \
  addgroup aoc && \
  adduser -G aoc -s /bin/bash -D aoc && \
  echo "aoc ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/aoc && \
  chown aoc:aoc $DOCKER_APP_ROOT
# && mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2 \

COPY --chown=aoc:aoc bin $DOCKER_APP_ROOT/bin

USER aoc

RUN \
  mkdir -p /aoc/data && \
  mkdir -p /aoc/src/zig-cache && \
  mkdir -p /aoc/src/zig-out

ENTRYPOINT ["/bin/bash"]
