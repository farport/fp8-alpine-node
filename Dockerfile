FROM node:8.12-alpine
MAINTAINER Marcos Lin <marcos.lin@farport.co>

RUN apk update \
    && mkdir -p /var/data/yarn/ \
    && yarn config set cache-folder /var/data/yarn/

VOLUME ["/var/data/yarn/"]
