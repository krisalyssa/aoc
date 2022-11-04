FROM erlang:25-alpine

RUN apk add --update --no-cache \
  bash \
  ca-certificates \
  curl \
  gcc \
  git \
  make \
  musl-dev \
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