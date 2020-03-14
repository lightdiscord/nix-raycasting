let

  bmpHeader = [
    66 77 # "BM"
  ] ++ [
    # TODO: Create a function for this
    70 00 00 00 # Size of the BMP file in little endian
  ] ++ [
    # Application specific
    78 105 120 0 # Nix
  ] ++ [
    # Offset starts of pixel array
    54 00 00 00
  ];

  dibHeader = [
    # Number of bytes in the DIB header
    40 0 0 0
  ] ++ [
    # Width of the bitmap in pixels
    2 0 0 0
  ] ++ [
    # Height of the bitmap in pixels
    2 0 0 0
  ] ++ [
    # Number of color planes being used
    1 0
  ] ++ [
    # Number of bits per pixel
    24 0
  ] ++ [
    0 0 0 0
  ] ++ [
    # Size of the raw bitmap data
    16 0 0 0
  ] ++ [
    19 11 0 0 # Horizontal
  ] ++ [
    19 11 0 0 # Vertical
  ] ++ [
    0 0 0 0 # Number of colors in the palette
  ] ++ [
    0 0 0 0 # Important colors
  ];

  pixelArray = [
    0 0 255
    255 0 255
    0 0
    255 0 0
    0 255 0
    0 0
  ];

in bmpHeader ++ dibHeader ++ pixelArray
