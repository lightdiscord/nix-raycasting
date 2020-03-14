scope: let

  inherit (builtins) genList elemAt length all;

  enumerate = list: genList
    (index: { inherit index; item = (elemAt list index); })
    (length list);

  all' = predicate: list: all predicate (enumerate list);

  check = { index, item }: if item
    then true
    else abort "Error in the test #${toString index} of ${scope}";

in all' check
