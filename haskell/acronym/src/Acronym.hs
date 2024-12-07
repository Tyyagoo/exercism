module Acronym (abbreviate) where

import Data.Char (toUpper, isUpper, isLower, isAlpha)

select :: (Char, Char) -> [Char]
select (x, y)
  | not (isAlpha x || x == '\'') && isAlpha y = [toUpper y]
  | isLower x && isUpper y = [y]
  | otherwise = []

abbreviate :: String -> String
abbreviate xs = concatMap select $ zip (" " ++ xs) xs
