.PHONY: tests

tests:
	nix eval '(import ./tests)'

