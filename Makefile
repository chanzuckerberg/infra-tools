SHELL := /bin/bash

all: clean fmt docs lint test

setup: ## setup development dependencies
	curl -L https://raw.githubusercontent.com/chanzuckerberg/bff/master/download.sh | sh

release: ## run a release
	bff bump
	git push

fmt:
	@for m in $(MODULES); do \
		terraform fmt $m; \
	done

lint:
	@for m in $(MODULES); do \
		terraform fmt -check $$m || exit $$?; \
	done;

	@for m in $(MODULES); do \
		ls $$m/*_test.go 2>/dev/null 1>/dev/null || (echo "no test(s) for $$m"; exit $$?); \
	done

docs:
	@for m in $(MODULES); do \
		pushd $$m; \
		../scripts/update-readme.sh update; \
		popd; \
	done;

check-docs:
	@for m in $(MODULES); do \
		pushd $$m; \
		../scripts/update-readme.sh check || exit $$?; \
		popd; \
	done;

clean:
		rm **/*.tfstate*; true

test: fmt
	AWS_PROFILE=cztack-ci-1 AWS_SDK_LOAD_CONFIG=true gotest -count=1 -parallel 10 -test.timeout 45m $(TEST)