# fp8-alpine-node

Simple extension of `node:8.12-alpine` that sets and exposes yarn cache directory.

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

