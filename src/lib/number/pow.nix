let
  pow = base: exponent:
    if exponent == 0 then 1
    else base * (pow base (exponent - 1));
in pow
