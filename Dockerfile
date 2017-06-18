FROM node:8-alpine
LABEL maintainer "Ash Wilson"

RUN apk add --no-cache git build-base automake autoconf linux-headers && \
  git clone https://github.com/facebook/watchman.git /tmp/watchman-src && \
  cd /tmp/watchman-src && \
  git checkout v4.7.0 && \
  ./autogen.sh && \
  ./configure --enable-statedir=/tmp --without-python --without-pcre && \
  make && \
  make install && \
  apk del git build-base automake autoconf linux-headers && \
  rm -r /tmp/watchman-src
