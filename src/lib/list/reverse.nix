list:
let
  inherit (builtins) length genList elemAt;
  len = length list;
in genList (n: elemAt list (len - n - 1)) len
