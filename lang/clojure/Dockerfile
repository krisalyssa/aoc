FROM clojure:temurin-23-lein-2.11.2-bullseye-slim AS base

LABEL lang="clojure"
LABEL version="23-1"
LABEL org.opencontainers.image.source="https://github.com/krisalyssa/aoc"
LABEL org.opencontainers.image.description="Clojure image for AoC"

ENV DOCKER_APP_ROOT=/aoc
WORKDIR $DOCKER_APP_ROOT

RUN \
  apt-get update -y && \
  apt-get dist-upgrade -y && \
  apt-get clean -y && \
  adduser --home /home/aoc --shell /bin/bash aoc && \
  chown aoc:aoc $DOCKER_APP_ROOT

RUN \
  mkdir -p $DOCKER_APP_ROOT/bin && \
  mkdir -p $DOCKER_APP_ROOT/src && \
  mkdir -p $DOCKER_APP_ROOT/data
COPY --chown=aoc:aoc run test $DOCKER_APP_ROOT/bin

USER aoc

ENTRYPOINT ["/bin/bash"]