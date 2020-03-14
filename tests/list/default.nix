let

  asserts = import ../asserts.nix "list";

in asserts [
  (import ./transpose.nix)
  (import ./reverse.nix)
  (import ./rotate-left.nix)
]
