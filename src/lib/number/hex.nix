let
  inherit (builtins) elemAt bitAnd;

  rightShift = import ./right-shift.nix;

  chars = [ "0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "a" "b" "c" "d" "e" "f" ];
in n: (
  elemAt chars (rightShift (bitAnd n 240) 4)
  + elemAt chars (bitAnd n 15)
)
