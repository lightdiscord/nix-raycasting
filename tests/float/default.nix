let

  asserts = import ../asserts.nix "float";

in asserts [
  (import ./floor.nix)
]
