let

  inherit (builtins) length head tail;

  transpose = matrix: if length (head matrix) == 0
    then []
    else [(map head matrix)] ++ (transpose (map tail matrix));

in transpose
