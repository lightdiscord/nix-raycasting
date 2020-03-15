let

  asserts = import ./asserts.nix "root";

in asserts [
  (import ./float)
  (import ./number)
  (import ./list)
]
