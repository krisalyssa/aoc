FROM erlang:28.0.2.0-alpine AS base

LABEL lang="gleam"
LABEL version="1.12.0"
LABEL org.opencontainers.image.source="https://github.com/krisalyssa/aoc"
LABEL org.opencontainers.image.description="Gleam image for AoC"

ENV DOCKER_APP_ROOT=/aoc
WORKDIR ${DOCKER_APP_ROOT}

RUN \
  apk add --update --no-cache \
  bash \
  build-base \
  cargo \
  curl \
  git \
  musl-dev \
  rust \
  sudo \
  && \
  addgroup aoc && \
  adduser -G aoc -s /bin/bash -D aoc && \
  echo "aoc ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/aoc && \
  chown aoc:aoc ${DOCKER_APP_ROOT}

USER aoc

COPY --chown=aoc:aoc bin ${DOCKER_APP_ROOT}/bin/

RUN \
  cd /home/aoc && \
  git clone https://github.com/gleam-lang/gleam.git --branch v1.12.0 && \
  cd gleam && \
  make install && \
  cd /home/aoc && \
  rm -rf gleam
ENV PATH=/home/aoc/.cargo/bin:$PATH

RUN mkdir -p ${DOCKER_APP_ROOT}/data

# RUN gleam new --name aoc --skip-git .

ENTRYPOINT ["/bin/bash"]
