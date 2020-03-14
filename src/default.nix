with (import <nixpkgs> {}).lib;

let
  abs = x: if x < 0 then -x else x;

  screenWidth = 640;
  screenHeight = 480;

  world = import ./maps/example.nix;

  posX = 18.0;
  posY = 10.0;

  dirX = -1.0;
  dirY = 0.0;

  planeX = 0.0;
  planeY = 0.66;

  time = 0.0;
  oldTime = 0.0;

  columns = lib.range 0 screenWidth;
    floor = import ./lib/float/floor.nix;

    findLower = c: v: if v + 1 < c
      then findLower c (v + 1)
      else v;
  in findLower n 0;

  mapColumn = x: let
    cameraX = 2 * x / screenWidth - 1;
    rayDirX = dirX + planeX * cameraX;
    rayDirY = dirY + planeY * cameraY;

    mapX = floor posX;
    mapY = floor posY;

    sideDistX = if rayDirX < 0
      then (posX - mapX) * deltaDistX
      else (mapX + 1.0 - posX) * deltaDistX;

    sideDistY = if rayDirY < 0
      then (posY - mapY) * deltaDistY
      else (mapY + 1.0 - posY) * deltaDistY;

    deltaDistX = abs (1 / rayDirX);
    deltaDistY = abs (1 / rayDirY);


  in {

  };

in {

}
