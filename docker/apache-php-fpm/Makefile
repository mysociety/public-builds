#
# Makefile for mysocietyorg Docker images
#

COMMIT := $(shell git log -1 --pretty=%h)
TIME   := $(shell date +%Y%m%d%H%M%S)
IMAGE  := $(shell basename `pwd`)
DISTRO = bookworm

.PHONEY: build

build:
	@echo Building mysocietyorg/${IMAGE}:${DISTRO}.${TIME}.${COMMIT}
	docker pull mysocietyorg/debian:${DISTRO}
	docker buildx build --no-cache --platform linux/amd64,linux/arm64,linux/arm/v7 -t mysocietyorg/${IMAGE}:${DISTRO} -t mysocietyorg/${IMAGE}:${DISTRO}.${TIME}.${COMMIT} -t mysocietyorg/${IMAGE}:latest --push .
