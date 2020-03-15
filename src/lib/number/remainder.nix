let
  floor = import ../float/floor.nix;
in left: right: left - ((floor (left / right)) * right)
