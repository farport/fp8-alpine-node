#!/bin/bash

# ===========================================================
# Author:   Marcos Lin
# Created:  29 Oct 2018
#
# Makefile used to setup alpine-node
#
# ===========================================================

PROJ_DIR             := $(shell pwd)
DATA_DIR             := $(PROJ_DIR)/data
DOCKER_INST_NAME     := fp8-alpine-node
DOCKER_IMAGE         := farport/$(DOCKER_INST_NAME)
DOCKER_IMAGE_VERSION := 8.14.0
DOCKER_IMAGE_NAME    := $(DOCKER_IMAGE):$(DOCKER_IMAGE_VERSION)
DOCKER_BUILD_CHECK   := $(DATA_DIR)/docker$(DOCKER_IMAGE_VERSION).built
DOCKER_INST_ID       = $(shell docker ps -aqf"name=$(DOCKER_INST_NAME)")
DOCKER_IMAGE_ID       = $(shell docker images -qf"reference=$(DOCKER_IMAGE_NAME)")


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
	docker build -f Dockerfile -t $(DOCKER_IMAGE_NAME) .
	touch $@
	@echo "Docker image $(DOCKER_IMAGE_NAME) built"

setup : init $(DOCKER_BUILD_CHECK)

connect : setup
ifeq ($(DOCKER_INST_ID),)
	@echo "### Running docker image"
	@docker run -v $(DATA_DIR)/yarn/:/var/cache/yarn/ --name $(DOCKER_INST_NAME) -it $(DOCKER_IMAGE_NAME) /bin/sh
else
	@echo "### Staring docker image"
	@docker start -i $(DOCKER_INST_ID)
endif

clean :
ifneq ($(DOCKER_INST_ID),)
	@echo "### Removing docker instance $(DOCKER_INST_ID)"
	@docker rm $(DOCKER_INST_ID)
endif
ifneq ($(DOCKER_IMAGE_ID),)
	@echo "### Removing docker image $(DOCKER_IMAGE_ID)"
	@docker rmi $(DOCKER_IMAGE_ID)
endif
	rm $(DOCKER_BUILD_CHECK)

# ------------------
# DEFINE PHONY TARGET: Basically all targets
.PHONY : \
	man init setup connect clean
