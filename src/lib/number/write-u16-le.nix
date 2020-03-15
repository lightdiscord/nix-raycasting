number: let
  rightShift = import ./right-shift.nix;
  and = builtins.bitAnd number;
in [
  (and 255)
  (rightShift (and 65280) 8)
]
