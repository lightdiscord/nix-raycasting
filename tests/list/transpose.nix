let

  asserts = import ../asserts.nix "list-transpose";

  transpose = import ../../src/lib/list/transpose.nix;

in asserts [
  ((transpose [
    [ 1 1 1 1 1 ]
    [ 2 2 2 2 2 ]
    [ 3 3 3 3 3 ]
  ]) == [
    [ 1 2 3 ]
    [ 1 2 3 ]
    [ 1 2 3 ]
    [ 1 2 3 ]
    [ 1 2 3 ]
  ])

  ((transpose [
    [ 1 1 1 1 4 ]
    [ 2 2 2 2 5 ]
    [ 3 3 3 3 6 ]
  ]) == [
    [ 1 2 3 ]
    [ 1 2 3 ]
    [ 1 2 3 ]
    [ 1 2 3 ]
    [ 4 5 6 ]
  ])

  ((transpose [
    [ 1 2 3 ]
    [ 1 2 3 ]
    [ 1 2 3 ]
    [ 1 2 3 ]
    [ 4 5 6 ]
  ]) == [
    [ 1 1 1 1 4 ]
    [ 2 2 2 2 5 ]
    [ 3 3 3 3 6 ]
  ])

  ((transpose [
    [ 1 1 1 1 6 ]
    [ 2 2 2 2 7 ]
    [ 3 3 3 3 8 ]
    [ 4 4 4 4 9 ]
    [ 5 5 5 5 0 ]
  ]) == [
    [ 1 2 3 4 5 ]
    [ 1 2 3 4 5 ]
    [ 1 2 3 4 5 ]
    [ 1 2 3 4 5 ]
    [ 6 7 8 9 0 ]
  ])
]
