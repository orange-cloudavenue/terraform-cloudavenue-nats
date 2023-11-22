default: submodules

generate:
	go install github.com/terraform-docs/terraform-docs@v0.16.0
	terraform-docs -c .terraform-docs.yml .

test:
	terraform init
	terraform test

submodules:
	@git submodule sync
	@git submodule update --init --recursive
	@git config core.hooksPath githooks
	@git config submodule.recurse true