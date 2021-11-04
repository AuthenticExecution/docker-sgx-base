REPO        = authexec/docker-sgx-base
TAG        ?= latest
VOLUME     ?= $(shell pwd)
SGX_DEVICE ?= /dev/isgx

build:
	docker build -t $(REPO):$(TAG) .

push: login
	docker push $(REPO):$(TAG)

pull:
	docker pull $(REPO):$(TAG)

run:
	docker run --rm -it --network=host --device $(SGX_DEVICE) -v $(VOLUME):/usr/src/app/ -v /var/run/aesmd/:/var/run/aesmd $(REPO):$(TAG) bash

login:
	docker login
