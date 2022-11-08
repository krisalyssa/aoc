FROM erlang:25-alpine

RUN apk add --update --no-cache \
  bash \
  build-base \
  ca-certificates \
  coreutils \
  curl \
  gcc \
  git \
  make \
  musl-dev \
  openssl \
  openssl-dev \
  readline-dev \
  tar \
  unzip \
  wget \
  && update-ca-certificates

RUN git clone https://github.com/erlang/rebar3.git \
  && cd rebar3 \
  && ./bootstrap

RUN git clone https://github.com/jfacorro/clojerl \
  && cd clojerl \
  && make

RUN addgroup aoc \
  && adduser -G aoc -s /bin/sh -D aoc

WORKDIR /aoc
RUN chown aoc:aoc /aoc

USER aoc

ENTRYPOINT ["/clojerl/bin/clojerl"]