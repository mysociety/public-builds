#
# Public Images - Docker Makefile
#
# Usage: make [ build | push ] REPO=fixmystreet IMAGE=postgres
#

COMMIT := $$(git log -1 --pretty=%h)
IMAGE  ?= postgres
REPO   ?= fixmystreet

.PHONEY: build push

build:
	@echo Building ${REPO}/${IMAGE}:${COMMIT}
	docker build -t ${REPO}/${IMAGE}:${COMMIT} ./${IMAGE}
	docker tag ${REPO}/${IMAGE}:${COMMIT} ${REPO}/${IMAGE}:latest

push:
	@echo Pushing ${REPO}/${IMAGE}
	docker push ${REPO}/${IMAGE}
