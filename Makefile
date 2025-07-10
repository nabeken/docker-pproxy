# Docker image configuration
IMAGE_NAME := local/pproxy:latest

.PHONY: build run

build: ## Build the Docker image locally
	docker build -t $(IMAGE_NAME) .

run: ## Run the container interactively (requires SOCKS5_SERVER variable)
	@if [ -z "$(SOCKS5_SERVER)" ]; then \
		echo "Error: SOCKS5_SERVER variable is required"; \
		echo "Usage: make run SOCKS5_SERVER=socks5://your-server:1080"; \
		exit 1; \
	fi
	docker run -it --rm -p 127.0.0.1:8080:8080 $(IMAGE_NAME) -l http+socks5://:8080 -r $(SOCKS5_SERVER) -v