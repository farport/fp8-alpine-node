# fp8-alpine-node

Simple extension of `node:8.12-alpine` that sets and exposes yarn cache directory.

## Relase History

##### 0.1.0 [2018-10-29]
* First version as simple wrapper for `node:8.12-alpine`

##### 0.2.0 [2018-10-29]
* Added `git` dependecy needed by `web3` package

##### 0.3.0 [2018-10-29]
* Added `python` dependencies 

## Additiona Dependencies

1. `python`: package that uses [node-gyp](https://github.com/mhart/alpine-node/issues/27)
   requires python.  The dependecies are `make gcc g++ python`  
1. `git`: some packages has git based dependencies so `git` is needs to be added to make
   those packages work.  E.g.: [websocket:1.0.28](https://github.com/theturtle32/WebSocket-Node/blob/v1.0.28/package.json)  

## Docker Sample Command

```
docker run \
    -v /var/data/yarn/:/var/data/yarn/ \
    --name $(DOCKER_IMAGE_NAME) \
    -it $(DOCKER_IMAGE) /bin/sh
```

## Usage

* `make connect`: Create image and attach to running instance
* `make setup`:   Create image
* `make clean`:   Delete created images

## Deploy to docker hub

1. `docker login`
1. `docker tag farport/fp8-alpine-node farport/fp8-alpine-node:<version>`
1. `docker push farport/fp8-alpine-node:<version>`
