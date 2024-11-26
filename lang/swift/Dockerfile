FROM swift:6.0.2-noble AS base

LABEL lang="swift"
LABEL version="6.0.2-2"
LABEL org.opencontainers.image.source="https://github.com/krisalyssa/aoc"
LABEL org.opencontainers.image.description="Swift image for AoC"

ENV DOCKER_APP_ROOT=/aoc
WORKDIR $DOCKER_APP_ROOT

RUN \
  apt-get update -y && \
  apt-get dist-upgrade -y && \
  apt-get install -y \
    build-essential \
    curl \
    git \
    sudo \
    unzip \
    && \
  apt-get clean -y && \
  adduser --home /home/aoc --shell /bin/bash aoc && \
  echo "aoc ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/aoc && \
  chown aoc:aoc $DOCKER_APP_ROOT

COPY --chown=aoc:aoc bin $DOCKER_APP_ROOT/bin

USER aoc

RUN \
  mkdir -p /aoc/data && \
  mkdir -p /aoc/src/.build

ENTRYPOINT ["/bin/bash"]