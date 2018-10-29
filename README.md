# fp8-alpine-node

The objective of this docker file is to be used by gitlab runner.  It's a simple
extension of node:8.12-alpine that create a yarn cache directory.

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

