#
# Makefile for mysocietyorg Docker images
#

COMMIT := $(shell git log -1 --pretty=%h)
TIME   := $(shell date +%Y%m%d%H%M%S)
IMAGE  := $(shell basename `pwd`)

.PHONEY: build push

build:
	@echo Building mysocietyorg/${IMAGE}:${TIME}.${COMMIT}
	docker pull mysocietyorg/debian:stretch
	docker build --no-cache -t mysocietyorg/${IMAGE}:${TIME}.${COMMIT} .
	docker tag mysocietyorg/${IMAGE}:${TIME}.${COMMIT} mysocietyorg/${IMAGE}:latest

push:
	@echo Pushing mysocietyorg/${IMAGE}
	docker push mysocietyorg/${IMAGE}
