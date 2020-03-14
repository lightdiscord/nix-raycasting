.PHONY: tests draw

tests:
	nix eval '(import ./tests)'

draw:
	nix-build src/
	display result
