let

  asserts = import ../asserts.nix "number";

in asserts [
  (import ./abs.nix)
  (import ./remainder.nix)
  (import ./write-u32-le.nix)
  (import ./write-u16-le.nix)
]
