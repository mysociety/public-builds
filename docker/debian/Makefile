#
# Makefile for mysocietyorg Docker images
#

COMMIT := $(shell git log -1 --pretty=%h)
TIME   := $(shell date +%Y%m%d%H%M%S)
IMAGE  := $(shell basename `pwd`)

.PHONEY: all stretch push

stretch:
	@echo Building mysocietyorg/${IMAGE}:${TIME}.${COMMIT}
	docker pull debian:stretch-slim
	docker build --no-cache -f Dockerfile.stretch -t mysocietyorg/${IMAGE}:${TIME}.${COMMIT} .
	docker tag mysocietyorg/${IMAGE}:${TIME}.${COMMIT} mysocietyorg/${IMAGE}:latest
	docker tag mysocietyorg/${IMAGE}:${TIME}.${COMMIT} mysocietyorg/${IMAGE}:stretch

push:
	@echo Pushing mysocietyorg/${IMAGE}
	docker push mysocietyorg/${IMAGE}

all: stretch push
