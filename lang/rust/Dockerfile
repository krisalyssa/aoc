FROM rust:1.82-alpine3.20 AS base

LABEL lang="rust"

ENV DOCKER_APP_ROOT=/aoc
WORKDIR $DOCKER_APP_ROOT

RUN apk add --update --no-cache \
  bash \
  && addgroup aoc \
  && adduser -G aoc -s /bin/bash -D aoc \
  && chown aoc:aoc $DOCKER_APP_ROOT
  # && mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2 \

RUN \
  mkdir -p $DOCKER_APP_ROOT/bin && \
  mkdir -p $DOCKER_APP_ROOT/src && \
  mkdir -p $DOCKER_APP_ROOT/data
COPY --chown=aoc:aoc run test $DOCKER_APP_ROOT/bin

USER aoc

ENTRYPOINT ["/bin/bash"]