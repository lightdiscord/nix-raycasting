let
  floor = import ../float/floor.nix;
  pow = import ./pow.nix;
in number: shift: if shift == 0
  then number
  else floor (number / (pow 2 shift))
