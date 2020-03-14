let

  asserts = import ./asserts.nix "tests";

in asserts [
  (import ./float)
  (import ./number)
  (import ./list)
]
