{ screen }:

let

  inherit ((import <nixpkgs> {}).lib) flatten;

  inherit (builtins) map genList length;

  rotateLeft = import ../lib/list/rotate-left.nix;
  reverseList = import ../lib/list/reverse.nix;

  writeU16 = import ../lib/number/write-u16-le.nix;
  writeU32 = import ../lib/number/write-u32-le.nix;
  remainder = import ../lib/number/remainder.nix;

  generatePixel = { drawStart, drawEnd, color, side }: y:
    if drawStart <= y && y <= drawEnd then color else [ 0 0 0 ];

  generatePixelColumn = column:
    genList
    (generatePixel column)
    screen.height;

  #padColumn = column: let
  #  len = length column;
  #  rest = remainder len 4;
  #in column ++ (if rest == 0 then [] else (genList (_: 0) (4 - rest)));

  padding = columns: let
    line = flatten columns;
    len = length line;
    rest = remainder len 4;
  in (if rest == 0 then [] else (genList (_: 0) (4 - rest))) ++ line;

  generateColumn = column:
    generatePixelColumn column;

  pixelArray = # 16
    flatten (map reverseList (map padding (rotateLeft (map generateColumn screen.columns))));

  res = 72 * 40;

  dibHeader = # 40
    # Number of bytes in the DIB header
    (writeU32 40)

    # Width of the bitmap in pixels
    ++ (writeU32 screen.width)

    # Height of the bitmap in pixels
    ++ (writeU32 screen.height)

    # Number of color planes being used
    ++ (writeU16 1)

    # Number of bits per pixel
    ++ (writeU16 24)

    # BI_RGB, no pixel array compression used
    ++ (writeU32 0)

    # Size of the raw bitmap data
    ++ (writeU32 (length pixelArray))

    # Pixels/metre horizontal
    ++ (writeU32 res)

    # Pixels/metre vertical
    ++ (writeU32 res)

    # Number of colors in the palette
    ++ (writeU32 0)

    # Important colors
    ++ (writeU32 0);

  bmpHeader = # 14
    # "BM"
    [ 66 77 ]

    # Size of the bmp file
    ++ (writeU32 (14 + (length dibHeader) + (length pixelArray)))

    # Application specific (Here it is "Nix")
    ++ [ 78 105 120 0 ]

    # Offset starts of pixel array
    ++ (writeU32 (14 + (length dibHeader)));



in bmpHeader ++ dibHeader ++ pixelArray
