IMAGE_NAME := voyagerwy130/grpc-go:1.0
CONTAINER_NAME := todoapp.server
VOLUMEDIR := /go/src/github.com/VoyagerYoshida/todo-app/server
PWD := $(shell pwd)

.PHONY: proto/build
proto/build:
	@docker build --tag $(IMAGE_NAME) -f ./docker/Dockerfile .

.PHONY: proto/bash
proto/bash:
	@docker run --rm -it --name $(CONTAINER_NAME) -v $(PWD):$(VOLUMEDIR) $(IMAGE_NAME) /bin/bash
