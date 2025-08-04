#
# Makefile for mysocietyorg Docker images
#

COMMIT := $(shell git log -1 --pretty=%h)
TIME   := $(shell date +%Y%m%d%H%M%S)
IMAGE  := $(shell basename `pwd`)

.PHONEY: build

build:
	@echo Building mysocietyorg/${IMAGE}:${TIME}.${COMMIT}
	docker pull mysocietyorg/debian:latest
	docker buildx build --no-cache --platform linux/amd64,linux/arm64,linux/arm/v7 -t mysocietyorg/${IMAGE}:${TIME}.${COMMIT} -t  mysocietyorg/${IMAGE}:latest --push .
