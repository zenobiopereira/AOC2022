c "main.exs"
str = "vJrwpWtwJgWrhcsFMMfFFhFp\njqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL\nPmmdzqPrVvPwwTWBwg\nwMqvLMZHhHMvwLHjbvcjnnSBnvTQFn\nttgJtRGJQctTZtZT\nCrZsJsPPZsGzwwsLwLmpwMDw\n"
[head | tail] =
  [
    MapSet.new(["F", "J", "M", "W", "c", "f", "g", "h", "p", "r", "s", "t", "v",
      "w"]),
    MapSet.new(["D", "F", "G", "H", "L", "M", "N", "R", "S", "Z", "f", "j", "q",
      "r", "s", "z"]),
    MapSet.new(["B", "P", "T", "V", "W", "d", "g", "m", "q", "r", "v", "w", "z"])
  ]
