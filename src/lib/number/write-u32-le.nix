number: let
  rightShift = import ./right-shift.nix;
  and = builtins.bitAnd number;
in [
  (and 255)
  (rightShift (and 65280) 8)
  (rightShift (and 16711680) 16)
  (rightShift (and 4278190080) 24)
]
