FROM alpine:latest

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

RUN curl --location --remote-time --remote-name --url http://www.lua.org/ftp/lua-5.4.4.tar.gz \
  && tar zxf lua-5.4.4.tar.gz \
  && cd lua-5.4.4 \
  && make all \
  && make test \
  && make install

RUN curl --location --remote-time --remote-name --url https://luarocks.org/releases/luarocks-3.9.1.tar.gz \
  && tar zxf luarocks-3.9.1.tar.gz \
  && cd luarocks-3.9.1 \
  && ./configure \
  && make \
  && make install

RUN addgroup aoc \
  && adduser -G aoc -s /bin/bash -D aoc

WORKDIR /aoc
RUN chown aoc:aoc /aoc

USER aoc

# RUN mkdir -p /home/aoc/bin \
#   && luarocks path > /home/aoc/bin/lua \
#   && echo "/usr/local/bin/lua \"$@\"" >> /home/aoc/bin/lua \
#   && chmod +x /home/aoc/bin/lua

RUN mkdir -p /home/aoc/bin \
  && echo '#!/bin/bash' > /home/aoc/bin/lua \
  && luarocks path >> /home/aoc/bin/lua \
  && echo '/usr/local/bin/lua $@' >> /home/aoc/bin/lua \
  && chmod +x /home/aoc/bin/lua

RUN echo "alias luarocks='/usr/local/bin/luarocks --local'" >> /home/aoc/.bashrc
RUN echo "export PATH=/home/aoc/bin:$PATH" >> /home/aoc/.bashrc

# RUN luarocks path > ~/.bashrc

# ENTRYPOINT ["/bin/bash"]
ENTRYPOINT ["/home/aoc/bin/lua"]
