{ runCommand }: bytes: let
  hex = import ../lib/number/hex.nix;

  inherit (builtins) concatStringsSep;

  bytes' =
    concatStringsSep
    ""
    (map (byte: "\\x${hex byte}") bytes);

in runCommand "image-${toString builtins.currentTime}" { } ''
  echo -ne "${bytes'}" > $out
''
