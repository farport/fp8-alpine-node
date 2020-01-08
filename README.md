# fp8-alpine-node

Simple extension of `node:X.Y.Z-alpine` that sets and exposes yarn cache directory.

## Versions

#### Version: 10.15.0

* Base Image:   `node:10.15.3-alpine`
* Yarn Version: `1.13.0`

#### Version: 8.14.0

* Base Image:   `node:8.14.0-alpine`
* Yarn Version: `1.12.3`

### Version Convention

The objective of this docker image is to pair the version of node and yarn.  As result,
the tag used will be based on the version of alpine image used.  Assuming that `node:X.Y.Z-alpine`
is used as based image, the version for this docker image will be:

* `fp8-alpine-node:X.Y.n`

Where `n` is the build number of `fp8-alpine-node` project.

#### Source of Version

* GAE: https://cloud.google.com/appengine/docs/standard/nodejs/release-notes

## Additiona Dependencies

1. `python`: package that uses [node-gyp](https://github.com/mhart/alpine-node/issues/27)
   requires python.  The dependecies are `make gcc g++ python`  
1. `git`: some packages has git based dependencies so `git` is needs to be added to make
   those packages work.  E.g.: [websocket:1.0.28](https://github.com/theturtle32/WebSocket-Node/blob/v1.0.28/package.json)  
1. `openssh-client`: This is needed when git based dependency is set as ssh path

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
