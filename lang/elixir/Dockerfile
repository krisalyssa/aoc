FROM elixir:1.17.3-otp-27-alpine AS base

LABEL lang="elixir"
LABEL version="1.17.3-3"
LABEL org.opencontainers.image.source="https://github.com/krisalyssa/aoc"
LABEL org.opencontainers.image.description="Elixir image for AoC"

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
# && mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2 \

COPY --chown=aoc:aoc bin ${DOCKER_APP_ROOT}/bin/

USER aoc

RUN \
  mkdir -p ${DOCKER_APP_ROOT}/data && \
  mkdir -p ${DOCKER_APP_ROOT}/src/_build && \
  mkdir -p ${DOCKER_APP_ROOT}/src/deps && \
  mkdir -p /home/aoc/.mix

ENTRYPOINT ["/bin/bash"]
