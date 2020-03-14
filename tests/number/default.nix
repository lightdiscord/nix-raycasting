let

  asserts = import ../asserts.nix "number";

in asserts [
  (import ./abs.nix)
]
