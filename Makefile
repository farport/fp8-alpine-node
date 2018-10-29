#!/bin/bash

# ===========================================================
# Author:   Marcos Lin
# Created:  29 Oct 2018
#
# Makefile used to setup alpine-node
#
# ===========================================================

PROJ_DIR           := $(shell pwd)
DATA_DIR           := $(PROJ_DIR)/data
DOCKER_BUILD_CHECK := $(DATA_DIR)/docker.built
DOCKER_IMAGE       := farport/fp8-alpine-node
DOCKER_IMAGE_NAME  := fp8-alpine-node
DOCKER_IMAGE_ID    = $(shell docker ps -aqf"name=$(DOCKER_IMAGE_NAME)")


# ------------------
# USAGE: First target called if no target specified
man :
	@cat README.md


# ------------------
# Check dependencies
init :
ifeq ($(shell which docker),)
	$(error docker command needed to be installed.)
endif
ifeq ($(shell which curl),)
	$(error curl command needed to be installed.)
endif


# ------------------
# MAIN TARGETS
$(DATA_DIR) :
	mkdir -p $@/yarn

$(DOCKER_BUILD_CHECK) : $(DATA_DIR)
	docker build -f Dockerfile -t $(DOCKER_IMAGE) .
	touch $@

setup : init $(DOCKER_BUILD_CHECK)
	@echo "Docker image $(DOCKER_IMAGE) built"

connect : setup
ifeq ($(DOCKER_IMAGE_ID),)
	@echo "### Running docker image"
	@docker run -v $(DATA_DIR)/yarn/:/var/data/yarn/ --name $(DOCKER_IMAGE_NAME) -it $(DOCKER_IMAGE) /bin/sh
else
	@echo "### Staring docker image"
	@docker start -i $(DOCKER_IMAGE_ID)
endif

clean :
ifneq ($(DOCKER_IMAGE_ID),)
	@echo "### Removing docker container"
	@docker rm $(DOCKER_IMAGE_ID)
	@docker rmi $(DOCKER_IMAGE)
endif
	rm $(DOCKER_BUILD_CHECK)

# ------------------
# DEFINE PHONY TARGET: Basically all targets
.PHONY : \
	man init setup connect clean
