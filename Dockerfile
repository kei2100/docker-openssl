# vim: filetype=dockerfile
FROM ubuntu:16.04

RUN apt-get update && apt-get install -y \
    openssl \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /etc/ssl
VOLUME /etc/ssl

