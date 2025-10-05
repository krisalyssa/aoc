# prefer a base image for the language
FROM alpine:3.22.1 AS base

LABEL lang="{{AOC_LANG}}"
LABEL version="1"
LABEL org.opencontainers.image.source="https://github.com/krisalyssa/aoc"
LABEL org.opencontainers.image.description="{{AOC_LANG}} image for AoC"

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

# create any directories which will be mount points for volumes
RUN mkdir -p ${DOCKER_APP_ROOT}/data

ENTRYPOINT ["/bin/bash"]
