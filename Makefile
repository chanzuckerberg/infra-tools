SHELL := /bin/bash

release: ## run a release
	bff bump
	git push
	git push --tags