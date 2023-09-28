
IMAGENAME := ghcr.io/bitnoize/python

.PHONY: help build rebuild push pull

.DEFAULT_GOAL := help

help:
	@echo "Makefile commands: build rebuild push pull"

#build: export BUILD_OPTS := ...
build: .build-3-bookworm

rebuild: export BUILD_OPTS := --pull --no-cache
rebuild: .build-3-bookworm

.build-3-bookworm:
	docker build $(BUILD_OPTS) \
		-t "$(IMAGENAME):3-bookworm" \
		-t "$(IMAGENAME):latest" \
		-f Dockerfile.bookworm \
		.

#push: export PUSH_OPTS := ...
push: .push-3-bookworm

.push-3-bookworm:
	docker push $(PUSH_OPTS) "$(IMAGENAME):3-bookworm"
	docker push $(PUSH_OPTS) "$(IMAGENAME):latest"

#pull: export PULL_OPTS := ...
pull: .pull-3-bookworm

.pull-3-bookworm:
	docker pull $(PULL_OPTS) "$(IMAGENAME):3-bookworm"
	docker pull $(PULL_OPTS) "$(IMAGENAME):latest"

