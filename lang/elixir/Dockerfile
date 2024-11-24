FROM elixir:1.17.3-otp-27-alpine AS base

LABEL lang="elixir"
LABEL version="1.17.3-1"

ENV DOCKER_APP_ROOT=/aoc
WORKDIR $DOCKER_APP_ROOT

RUN \
  apk add --update --no-cache \
    bash \
    git \
    && \
  addgroup aoc && \
  adduser -G aoc -s /bin/bash -D aoc && \
  chown aoc:aoc $DOCKER_APP_ROOT
  # && mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2 \

RUN \
  mkdir -p $DOCKER_APP_ROOT/bin && \
  mkdir -p $DOCKER_APP_ROOT/src && \
  mkdir -p $DOCKER_APP_ROOT/data
COPY --chown=aoc:aoc run test $DOCKER_APP_ROOT/bin

USER aoc
RUN mix local.hex --force

ENTRYPOINT ["/bin/bash"]