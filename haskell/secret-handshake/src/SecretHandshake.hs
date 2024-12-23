module SecretHandshake (handshake) where

import Data.Bits

actions :: [String]
actions = ["wink", "double blink", "close your eyes", "jump"]

handshake :: Int -> [String]
handshake n
  | n .&. 16 /= 0 = reverse xs
  | otherwise = xs
  where xs = [x | (i, x) <- zip [0..] actions, (n `shiftR` i) .&. 1 /= 0]
