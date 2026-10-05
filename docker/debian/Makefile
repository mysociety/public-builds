#
# Makefile for mysocietyorg Docker images
#

COMMIT := $(shell git log -1 --pretty=%h)
TIME   := $(shell date +%Y%m%d%H%M%S)
IMAGE  := $(shell basename `pwd`)

.PHONEY: all bookworm

all: bookworm

bookworm:
	@echo Building mysocietyorg/${IMAGE}:bookworm
	docker pull debian:bookworm-slim
	docker buildx build --no-cache -f Dockerfile.bookworm --platform linux/amd64,linux/arm64,linux/arm/v7 -t mysocietyorg/${IMAGE}:bookworm -t mysocietyorg/${IMAGE}:${TIME}.${COMMIT} -t mysocietyorg/${IMAGE}:latest --push .
