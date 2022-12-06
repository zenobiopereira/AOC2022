module Main where

data Movement = Rock | Paper | Scissors
  deriving (Show, Eq, Enum)

data Result = Loss | Tie | Win
  deriving (Show, Eq)

listToTuple :: [(Movement, Movement)] -> [Movement] -> [(Movement, Movement)]
listToTuple acc (a : b : rest) = listToTuple ((a, b) : acc) rest
listToTuple acc [] = acc
listToTuple acc _ = acc

parseExpectedResult "X" = Loss
parseExpectedResult "Y" = Tie
parseExpectedResult _ = Win

parseMove move
  | move `elem` ["A", "X"] = Rock
  | move `elem` ["B", "Y"] = Paper
  | otherwise = Scissors

roundResult :: (Movement, Movement) -> Int
roundResult (Paper, Rock) = 1
roundResult (Scissors, Paper) = 2
roundResult (Rock, Scissors) = 3
roundResult (Rock, Rock) = 4
roundResult (Paper, Paper) = 5
roundResult (Scissors, Scissors) = 6
roundResult (Scissors, Rock) = 7
roundResult (Rock, Paper) = 8
roundResult (Paper, Scissors) = 9

moveResultToMatch :: (Movement, Result) -> (Movement, Movement)
moveResultToMatch (Rock, Win) = (Rock, Paper)
moveResultToMatch (Scissors, Win) = (Scissors, Rock)
moveResultToMatch (Paper, Win) = (Paper, Scissors)
moveResultToMatch (Rock, Loss) = (Rock, Scissors)
moveResultToMatch (Paper, Loss) = (Paper, Rock)
moveResultToMatch (Scissors, Loss) = (Scissors, Paper)
moveResultToMatch (a, Tie) = (a, a)

main = do
  contents <- readFile "input"
  putStrLn "Part 1 => Total:"
  (print . sum . map roundResult . listToTuple [] . map parseMove . words) contents
  putStrLn "Part 2 => Total:"
  (print . sum . map (roundResult . moveResultToMatch . (\(a : b : []) -> (parseMove a, parseExpectedResult b)) . words) . lines) contents
