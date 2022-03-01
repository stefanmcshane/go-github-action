include common/make/go.mk
include common/make/help.mk

BRANCH=$(shell git rev-parse --abbrev-ref HEAD)
SHA=${shell git rev-parse --short HEAD}

# Ensure the service name matches the name of the repo
SERVICE=go-ci-tools

## Top level
build: ## Builds docker image and tags
	docker build  -t "stefanmcshane/${SERVICE}:latest" -t "stefanmcshane/${SERVICE}:${BRANCH}-${SHA}" . --no-cache --platform=linux/amd64

publish: ## Publish docker images to registry
	docker push stefanmcshane/${SERVICE}:latest
	docker push stefanmcshane/${SERVICE}:${BRANCH}-${SHA}

install-tools: go-install-platform-tools  ## Install all required tools

