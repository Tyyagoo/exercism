module Spiral
  ( spiral
  ) where

import Prelude
import Data.List ((..), List(Nil))

calc :: Int -> Int -> Int -> Int
calc x 1 _ = x
calc x y s = s `div` 2 + (calc (y - 1) (s `div` 2 - x + 1) (s - 1))

spiral :: Int -> List (List Int)
spiral 0 = Nil
spiral s =
  let r = 1..s
  in map (\x -> map (\y -> calc y x (s * 2)) r) r
