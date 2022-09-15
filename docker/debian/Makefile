#
# Makefile for mysocietyorg Docker images
#

COMMIT := $(shell git log -1 --pretty=%h)
TIME   := $(shell date +%Y%m%d%H%M%S)
IMAGE  := $(shell basename `pwd`)

.PHONEY: all buster bullseye

buster:
	@echo Building mysocietyorg/${IMAGE}:buster
	docker pull debian:buster-slim
	docker buildx build --no-cache -f Dockerfile.buster --platform linux/amd64,linux/arm64,linux/arm/v7 -t mysocietyorg/${IMAGE}:buster -t mysocietyorg/${IMAGE}:buster.${TIME}.${COMMIT} --push .

bullseye:
	@echo Building mysocietyorg/${IMAGE}:bullseye
	docker pull debian:bullseye-slim
	docker buildx build --no-cache -f Dockerfile.bullseye --platform linux/amd64,linux/arm64,linux/arm/v7 -t mysocietyorg/${IMAGE}:bullseye  -t mysocietyorg/${IMAGE}:${TIME}.${COMMIT} -t mysocietyorg/${IMAGE}:latest --push .

all: buster bullseye
