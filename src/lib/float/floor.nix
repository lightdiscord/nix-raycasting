let
  # Still horrible until I find another way
  # Or if a new floor builtins appear.
  floor = x:
    if 0 <= x && x < 1 then 0
    else if -1 < x && x < 0 then -1
    else if x >= 1 then 1 + floor (x - 1)
    else -1 + floor (x + 1);

in floor
