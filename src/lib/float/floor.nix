let

  # Horrible until I find another way
  fn = current: target:
    if current + 1 < target then fn (current + 1) target
    else if current + 1 == target then current + 1
    else current;

in fn 0
