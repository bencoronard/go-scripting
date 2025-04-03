.PHONY: run build start

ENV_FILE := .env
BINARY := bin/app
MAIN := src/main.go

run:
	@if [ ! -f $(ENV_FILE) ]; then \
		echo "File not found: $(ENV_FILE) . Aborting."; \
		exit 1; \
	fi && \
	export $$(grep -v '^#' $(ENV_FILE) | sed '/^\s*$$/d' | sed 's/ *= */=/' | xargs) && \
	go run $(MAIN) $(ARGS)

build:
	@mkdir -p bin
	go build -o $(BINARY) $(MAIN)
	@echo "Build successful: $(BINARY)"

start:
	@if [ ! -f $(ENV_FILE) ]; then \
		echo "File not found: $(ENV_FILE) . Aborting."; \
		exit 1; \
	fi && \
	if [ ! -f $(BINARY) ]; then \
		echo "Binary not found. Run 'make build' first."; \
		exit 1; \
	fi && \
	export $$(grep -v '^#' $(ENV_FILE) | sed '/^\s*$$/d' | sed 's/ *= */=/' | xargs) && \
	./$(BINARY) $(ARGS)