DOCKER_IMAGE=dockette/expose
DOCKER_TAG?=latest
DOCKER_PLATFORMS?=linux/amd64,linux/arm64

build:
	docker buildx build --platform ${DOCKER_PLATFORMS} -t ${DOCKER_IMAGE}:${DOCKER_TAG} .

test:
	docker run --rm ${DOCKER_IMAGE}:${DOCKER_TAG} --version

run:
	docker run -it --rm -p 8000:8000 ${DOCKER_IMAGE}:${DOCKER_TAG}

docker-build:
	docker build --pull -t ${DOCKER_IMAGE}:${DOCKER_TAG} .

docker-push:
	docker push ${DOCKER_IMAGE}:${DOCKER_TAG}

example-install:
	composer -d example install

example-app:
	 php -S 0.0.0.0:8888 example/index.php

example-share:
	example/vendor/bin/expose share

test-expose:
	docker run -it --rm -p 8000:8000 ${DOCKER_IMAGE}:${DOCKER_TAG}

test-server:
	docker run -it --rm -p 8000:8000 --entrypoint /bin/bash ${DOCKER_IMAGE}:${DOCKER_TAG}
