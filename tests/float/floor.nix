let

  asserts = import ../asserts.nix "float-floor";

  floor = import ../../src/lib/float/floor.nix;

in asserts [
  ((floor 3.14) == 3)
  ((floor 3.99) == 3)
  ((floor 3) == 3)
  ((floor 0.1) == 0)
  ((floor 0) == 0)
  ((floor (-0.1)) == -1)
  ((floor (-3.14)) == -4)
  ((floor (-10)) == -10)
]
