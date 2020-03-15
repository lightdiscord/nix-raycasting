let
  pkgs = (import <nixpkgs> {});

  screen = import ./screen.nix {
    screenHeight = 480;
    screenWidth = 640;
  };

in (pkgs.callPackage ./writer/file.nix {}) (import ./drawer/bmp.nix { inherit screen; })
