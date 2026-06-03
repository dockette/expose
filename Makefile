DOCKER_IMAGE=dockette/expose
DOCKER_TAG?=latest
DOCKER_PLATFORMS?=linux/amd64,linux/arm64

.PHONY: build
build:
	docker buildx build --platform ${DOCKER_PLATFORMS} -t ${DOCKER_IMAGE}:${DOCKER_TAG} .

.PHONY: test
test:
	docker run --rm ${DOCKER_IMAGE}:${DOCKER_TAG} --version

.PHONY: run
run:
	docker run -it --rm -p 8000:8000 ${DOCKER_IMAGE}:${DOCKER_TAG}

.PHONY: docker-build
docker-build:
	docker build --pull -t ${DOCKER_IMAGE}:${DOCKER_TAG} .

.PHONY: docker-push
docker-push:
	docker push ${DOCKER_IMAGE}:${DOCKER_TAG}

.PHONY: example-install
example-install:
	composer -d example install

.PHONY: example-app
example-app:
	 php -S 0.0.0.0:8888 example/index.php

.PHONY: example-share
example-share:
	example/vendor/bin/expose share

.PHONY: test-expose
test-expose:
	docker run -it --rm -p 8000:8000 ${DOCKER_IMAGE}:${DOCKER_TAG}

.PHONY: test-server
test-server:
	docker run -it --rm -p 8000:8000 --entrypoint /bin/bash ${DOCKER_IMAGE}:${DOCKER_TAG}
