FROM clojure:temurin-23-lein-2.11.2-bullseye-slim AS base

LABEL lang="clojure"
LABEL version="1.11.1-1"
LABEL org.opencontainers.image.source="https://github.com/krisalyssa/aoc"
LABEL org.opencontainers.image.description="Clojure image for AoC"

ENV DOCKER_APP_ROOT=/aoc
WORKDIR ${DOCKER_APP_ROOT}

RUN \
  apt-get update -y && \
  apt-get dist-upgrade -y && \
  apt-get install -y \
  apt-utils \
  autoconf \
  automake \
  build-essential \
  sudo \
  && \
  apt-get clean -y && \
  adduser --home /home/aoc --shell /bin/bash aoc && \
  echo "aoc ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/aoc && \
  chown aoc:aoc ${DOCKER_APP_ROOT}

COPY --chown=aoc:aoc bin ${DOCKER_APP_ROOT}/bin/

USER aoc

RUN \
  mkdir -p ${DOCKER_APP_ROOT}/data && \
  mkdir -p ${DOCKER_APP_ROOT}/src/target && \
  mkdir -p /home/aoc/.m2

ENTRYPOINT ["/bin/bash"]
