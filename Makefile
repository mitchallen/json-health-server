# Variables
IMAGE_NAME := json-health
TAG := latest
CONTAINER_NAME := health-server
PORT := 3100

.PHONY: help start docker-clean docker-build predocker-run docker-run app-open docker-rerun docker-stop docker-start test

help:
	@echo "Available targets:"
	@echo "  make start            - Run the Node.js application"
	@echo "  make docker-clean     - Stop, remove the Docker container, and remove the Docker image"
	@echo "  make docker-build     - Build the Docker image"
	@echo "  make docker-run       - Build the Docker image and run the container"
	@echo "  make docker-rerun     - Clean, build, and run the Docker container"
	@echo "  make docker-stop      - Stop the Docker container"
	@echo "  make docker-start     - Start the Docker container"
	@echo "  make test             - Run tests (currently not specified)"

start:
	node src/index.js

docker-clean:
	@docker stop $(CONTAINER_NAME) || true
	@docker rm $(CONTAINER_NAME) || true
	@docker rmi $(IMAGE_NAME):$(TAG) || true

docker-build:
	docker build . -t $(IMAGE_NAME):$(TAG)

predocker-run: docker-build

docker-run: predocker-run
	docker run -d -p $(PORT):3000 --restart always --env-file ./env.docker.list --name $(CONTAINER_NAME) $(IMAGE_NAME):$(TAG)

app-open:
	@docker ps --size | grep $(CONTAINER_NAME)
	@open http://localhost:$(PORT)

docker-rerun: docker-clean docker-run

docker-stop:
	docker stop $(CONTAINER_NAME)

docker-start:
	docker start $(CONTAINER_NAME)

test:
	@echo "Error: no test specified" && exit 1

# Set the default target to help
.DEFAULT_GOAL := help
