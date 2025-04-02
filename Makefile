.PHONY: run

ENV_FILE := .env

run:
	@if [ ! -f $(ENV_FILE) ]; then \
		echo "$(ENV_FILE) file not found! Aborting."; \
		exit 1; \
	fi && \
	export $$(grep -v '^#' $(ENV_FILE) | sed '/^\s*$$/d' | sed 's/ *= */=/' | xargs) && \
	go run src/main.go $(ARGS)