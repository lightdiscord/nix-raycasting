let
  asserts = import ../asserts.nix "number-remainder";
  remainder = import ../../src/lib/number/remainder.nix;
in asserts [
  ((remainder 9 3) == 0)
  ((remainder 10 3) == 1)
  ((remainder 12 5) == 2)
  ((remainder 2 3) == 2)
  ((remainder 0 1) == 0)
]

