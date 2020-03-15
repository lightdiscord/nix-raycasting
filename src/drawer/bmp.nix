let

  writeU16 = import ../lib/number/write-u16-le.nix;
  writeU32 = import ../lib/number/write-u32-le.nix;

  bmpHeader = 
    # "BM"
    [ 66 77 ]

    # Size of the bmp file
    ++ (writeU32 70)

    # Application specific (Here it is "Nix")
    ++ [ 78 105 120 0 ]

    # Offset starts of pixel array
    ++ (writeU32 54);

  dibHeader =
    # Number of bytes in the DIB header
    (writeU32 40)

    # Width of the bitmap in pixels
    ++ (writeU32 2)

    # Height of the bitmap in pixels
    ++ (writeU32 2)

    # Number of color planes being used
    ++ (writeU16 1)

    # Number of bits per pixel
    ++ (writeU16 24)

    # BI_RGB, no pixel array compression used
    ++ (writeU32 0)

    # Size of the raw bitmap data
    ++ (writeU32 16)

    # Pixels/metre horizontal
    ++ (writeU32 2835)

    # Pixels/metre vertical
    ++ (writeU32 2835)

    # Number of colors in the palette
    ++ (writeU32 0)

    # Important colors
    ++ (writeU32 0);

  pixelArray = [
    0 0 255
    255 0 255
    0 0
    255 0 0
    0 255 0
    0 0
  ];

in bmpHeader ++ dibHeader ++ pixelArray
