FROM node:8.14.0-alpine
# node:8.14.0-alpine includes a yarn version 1.12.3

MAINTAINER Marcos Lin <marcos.lin@farport.co>

RUN apk update \
    && apk add --no-cache make gcc g++ git python \
    && mkdir -p /var/data/yarn/ \
    && yarn config set cache-folder /var/cache/yarn/

VOLUME ["/var/cache/yarn/"]
