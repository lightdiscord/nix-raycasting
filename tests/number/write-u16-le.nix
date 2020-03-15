let

  asserts = import ../asserts.nix "number-write-u16-le";
  write = import ../../src/lib/number/write-u16-le.nix;

in asserts [
  ((write 40) == [ 40 0 ])
  ((write 2835) == [ 19 11 ])
  ((write 0) == [ 0 0 ])
  ((write 65535) == [ 255 255 ])
]
