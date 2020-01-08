FROM node:10.15.3-alpine
# node:10.15.3-alpine includes a yarn version 1.13.0

LABEL maintainer="Marcos Lin <marcos.lin@farport.co>"

ADD bin/execs.sh /bin

RUN apk update \
    && apk add --no-cache make gcc g++ git python openssh-client \
    && mkdir /root/.ssh \
    && chmod 600 /root/.ssh \
    && mkdir /shared \
    && mkdir /config \
    && mkdir /proj \
    && mkdir -p /var/data/yarn/ \
    && chmod 755 /bin/execs.sh \
    && yarn config set cache-folder /var/cache/yarn/

VOLUME ["/shared", "/var/cache/yarn/"]
