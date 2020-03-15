let

  asserts = import ../asserts.nix "number-write-u32-le";
  write = import ../../src/lib/number/write-u32-le.nix;

in asserts [
  ((write 40) == [ 40 0 0 0 ])
  ((write 2835) == [ 19 11 0 0 ])
  ((write 0) == [ 0 0 0 0 ])
  ((write 4294967295) == [ 255 255 255 255 ])
]
