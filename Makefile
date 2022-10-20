
IMAGENAME := ghcr.io/bitnoize/python

.PHONY: help build rebuild push pull

.DEFAULT_GOAL := help

help:
	@echo "Makefile commands: build rebuild push pull"

#build: export BUILD_OPTS := ...
build: .build-3.9-bullseye

rebuild: export BUILD_OPTS := --pull --no-cache
rebuild: .build-3.9-bullseye

.build-3.9-bullseye:
	docker build $(BUILD_OPTS) \
		-t "$(IMAGENAME):3.9-bullseye" \
		-t "$(IMAGENAME):3-bullseye" \
		-t "$(IMAGENAME):latest" \
		-f Dockerfile.bullseye \
		.

#push: export PUSH_OPTS := ...
push: .push-3.9-bullseye

.push-3.9-bullseye:
	docker push $(PUSH_OPTS) "$(IMAGENAME):3.9-bullseye"
	docker push $(PUSH_OPTS) "$(IMAGENAME):3-bullseye"
	docker push $(PUSH_OPTS) "$(IMAGENAME):latest"

#pull: export PULL_OPTS := ...
pull: .pull-3.9-bullseye

.pull-3.9-bullseye:
	docker pull $(PULL_OPTS) "$(IMAGENAME):3.9-bullseye"
	docker pull $(PULL_OPTS) "$(IMAGENAME):3-bullseye"
	docker pull $(PULL_OPTS) "$(IMAGENAME):latest"

