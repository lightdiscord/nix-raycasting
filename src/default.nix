let
  pkgs = (import <nixpkgs> {});

  inherit (pkgs.lib) concatStrings genList concatStringsSep;

  floor = import ./lib/float/floor.nix;
  abs = import ./lib/number/abs.nix;
  rotateLeft = import ./lib/list/rotate-left.nix;

  inherit (builtins) elemAt;

  world = import ./maps/example.nix;

  tileAt = x: y: elemAt (elemAt world.tiles y) x;

  isWall = x: y: (tileAt x y) != 0;

  color = value:
    if value == 1 then [255 0 0]
    else if value == 2 then [0 255 0]
    else if value == 3 then [0 0 255]
    else if value == 4 then [255 255 255]
    else [255 255 0];

  colorAt = x: y: color (tileAt x y);

  div = a: b: if b != 0 then a / b else 9999999;

  screenHeight = 50;
  screenWidth = 90;

  posX = 12;
  posY = 5;
  
  dirX = -1;
  dirY = 0;

  planeX = 0;
  planeY = 0.66;

  vertical = x: let
    cameraX = 2 * x / screenWidth - 1;
    rayDirX = dirX + planeX * cameraX;
    rayDirY = dirY + planeY * cameraX;

    mapX = floor posX;
    mapY = floor posY;

    deltaDistX = abs (div 1 rayDirX);
    deltaDistY = abs (div 1 rayDirY);

    stepX = if rayDirX < 0 then -1 else 1;
    stepY = if rayDirY < 0 then -1 else 1;

    sideDistX = if rayDirX < 0
      then (posX - mapX) * deltaDistX
      else (mapX + 1.0 - posX) * deltaDistX;

    sideDistY = if rayDirY < 0
      then (posY - mapY) * deltaDistY
      else (mapY + 1.0 - posY) * deltaDistY;

    dda = { sideDistX, sideDistY, mapX, mapY }@args: let
      new_args = args // (if sideDistX < sideDistY
        then { sideDistX = sideDistX + deltaDistX; mapX = mapX + stepX; }
        else { sideDistY = sideDistY + deltaDistY; mapY = mapY + stepY; });
    in if isWall mapX mapY
      then (new_args // { side = sideDistX >= sideDistY; })
      else dda new_args;

    result = dda { inherit sideDistX sideDistY mapX mapY; };

    perpWallDist = if result.side
      then (result.mapY - posY + (1 - stepY) / 2) / rayDirY
      else (result.mapX - posX + (1 - stepX) / 2) / rayDirX;

    lineHeight = floor (screenHeight / perpWallDist);

    drawStart = -lineHeight / 2 + screenHeight / 2;
    drawEnd = lineHeight / 2 + screenHeight / 2;

  in { inherit drawStart drawEnd; };

  screen = rotateLeft (genList vertical screenWidth);

in (pkgs.callPackage ./writer/file.nix {}) (import ./drawer/bmp.nix)
