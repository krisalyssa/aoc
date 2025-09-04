FROM julia:1.11.6-trixie AS base

LABEL lang="julia"
LABEL version="1.11.6"
LABEL org.opencontainers.image.source="https://github.com/krisalyssa/aoc"
LABEL org.opencontainers.image.description="Julia image for AoC"

ENV DOCKER_APP_ROOT=/aoc
WORKDIR ${DOCKER_APP_ROOT}

RUN apt-get update
RUN apt-get install --quiet --assume-yes \
  bash \
  curl \
  git \
  sudo
RUN useradd --create-home --shell /bin/bash --user-group aoc
RUN echo "aoc ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/aoc
RUN chown aoc:aoc ${DOCKER_APP_ROOT}

COPY --chown=aoc:aoc bin ${DOCKER_APP_ROOT}/bin/

USER aoc

RUN mkdir -p ${DOCKER_APP_ROOT}/data

ENTRYPOINT ["/bin/bash"]
