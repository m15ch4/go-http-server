# Makefile to build a Go binary for Linux on AMD64 architecture

# Name of binary
BINARY_NAME=go-http-server

# Source file
SOURCE_FILE=main.go

# Build directory
BUILD_DIR=./bin

# Target OS and architecture
GOOS=linux
GOARCH=amd64

# Docker image name and version
DOCKER_IMAGE_NAME=go-http-server
DOCKER_IMAGE_VERSION=0.1

build:
	@echo "Building for $(GOOS)/$(GOARCH)"
	@GOOS=$(GOOS) GOARCH=$(GOARCH) go build -o $(BUILD_DIR)/$(BINARY_NAME) $(SOURCE_FILE)
	@echo "Build completed: $(BUILD_DIR)/$(BINARY_NAME)"

docker-build: build
	@echo "Building Docker image $(DOCKER_IMAGE_NAME)"
	@docker build -t $(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_VERSION) .
	@echo "Docker image built: $(DOCKER_IMAGE_NAME)"

docker-clean:
	@echo "Cleaning Docker image $(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_VERSION)"
	@docker image rm -f $(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_VERSION)
	@echo "Docker image cleaned"

clean: docker-clean
	@echo "Cleaning up..."
	@rm -rf $(BUILD_DIR)
	@echo "Clean completed."

.PHONY: build docker-build docker-clean clean