DOCKER_IMAGE=dockette/expose
VERSION:=$(shell cat VERSION)

docker-build:
	docker build --pull -t ${DOCKER_IMAGE} .

docker-push:
	docker push ${DOCKER_IMAGE}

example-install:
	composer -d example install

example-app:
	 php -S 0.0.0.0:8888 example/index.php

example-share:
	example/vendor/bin/expose share

test-expose:
	docker run -it --rm -p 8000:8000 ${DOCKER_IMAGE}

test-server:
	docker run -it --rm -p 8000:8000 --entrypoint /bin/bash ${DOCKER_IMAGE}

.PHONY: version
version:
	@echo ${VERSION}

.PHONY: release
release:
	@date -u +%Y.%m.%d > VERSION
	@echo "VERSION: ${VERSION} -> $$(cat VERSION)"
	@echo "next: git commit -am \"Release: $$(cat VERSION)\" && git push"
