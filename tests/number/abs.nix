let

  asserts = import ../asserts.nix "number-abs";

  abs = import ../../src/lib/number/abs.nix;

in asserts [
  ((abs 0) == 0)
  ((abs (-42)) == 42)
  ((abs 42) == 42)
]
