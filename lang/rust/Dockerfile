FROM rust:1.82-alpine3.20 AS base

LABEL lang="rust"
LABEL version="1.82-4"
LABEL org.opencontainers.image.source="https://github.com/krisalyssa/aoc"
LABEL org.opencontainers.image.description="Rust image for AoC"

ENV DOCKER_APP_ROOT=/aoc
WORKDIR ${DOCKER_APP_ROOT}

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
  sudo \
  && \
  addgroup aoc && \
  adduser -G aoc -s /bin/bash -D aoc && \
  echo "aoc ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/aoc && \
  chown aoc:aoc ${DOCKER_APP_ROOT}

RUN \
  rustup update && \
  rustup component add rust-src

# && mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2 \

COPY --chown=aoc:aoc bin ${DOCKER_APP_ROOT}/bin/

USER aoc

RUN \
  mkdir -p ${DOCKER_APP_ROOT}/data && \
  mkdir -p ${DOCKER_APP_ROOT}/src/target

ENTRYPOINT ["/bin/bash"]
