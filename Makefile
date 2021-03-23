DOCKER ?= $(shell which docker || which podman)
FILES ?= $(wildcard *.tex)

.PHONY: generate $(FILES)

generate: $(FILES)

$(FILES):
	@$(MAKE) build
	@$(DOCKER) run --rm -i -v ${PWD}:/data latex xelatex $@

.PHONY: build
build:
	@$(DOCKER) build -t latex .

clean:
	@rm -f *.aux *.log *.out
	@echo "Clean complete."
