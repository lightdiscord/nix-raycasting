let

  asserts = import ../asserts.nix "list-reverse";

  reverse = import ../../src/lib/list/reverse.nix;

in asserts [
  ((reverse [ 1 2 3 4 5 6 ]) == [ 6 5 4 3 2 1 ])
  ((reverse [ 1 2 3 ]) == [ 3 2 1 ])
  ((reverse [ 0 ]) == [ 0 ])
  ((reverse [ ]) == [ ])
]
