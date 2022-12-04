module Main where

import Text.Read (readMaybe)
import Data.Maybe (fromMaybe)
import Data.List (sort)

toMaybeInt = map (\str -> readMaybe str :: Maybe Int)

calc :: [Int] -> [Maybe Int] -> [Int]
calc acc [] = acc
calc acc ls =
  let
    rest = dropWhile (/= Nothing) (tail ls)
    kcals = (sum . map (fromMaybe 0). takeWhile (/= Nothing)) (tail ls)
  in calc (kcals : acc)  rest


main = do
    content <- readFile "input"
    putStrLn "Biggest Kcals ammount:"
    (print . maximum . sort . calc [] . toMaybeInt . lines) content -- res 1
    putStrLn "Top 3 Biggest Kcals ammount sum:"
    (print . sum . take 3. reverse . sort . calc [] . toMaybeInt . lines) content -- res 2