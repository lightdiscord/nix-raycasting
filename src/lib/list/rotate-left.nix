let
  reverse = import ./reverse.nix;
  tranpose = import ./transpose.nix;
in matrix: reverse (tranpose matrix)
