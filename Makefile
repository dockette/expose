DOCKER_IMAGE=dockette/expose

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
