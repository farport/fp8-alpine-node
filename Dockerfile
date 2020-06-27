FROM node:10.21.0-alpine3.11
# node:10.21.0-alpine includes a yarn version 1.22.4

LABEL maintainer="Marcos Lin <marcos.lin@farport.co>" \
	"app.fp8.docker.version.node"="10.21.0" \
	"app.fp8.docker.version.yarn"="1.22.4"

ADD bin/execs.sh /bin

RUN apk update \
    && apk add --no-cache make gcc g++ git python openssh-client rsync \
    && mkdir /root/.ssh \
    && chmod 600 /root/.ssh \
    && mkdir /shared \
    && mkdir /config \
    && mkdir /proj \
    && mkdir -p /var/data/yarn/ \
    && chmod 755 /bin/execs.sh \
    && yarn config set cache-folder /var/cache/yarn/

VOLUME ["/shared", "/var/cache/yarn/"]
