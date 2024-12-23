module FoodChain (song) where

import Text.Printf

animals :: [String]
animals = ["fly", "spider", "bird", "cat", "dog", "goat", "cow", "horse"]

swallow :: String -> String -> String
swallow what "spider" = printf "\nShe swallowed the %s to catch the spider that wriggled and jiggled and tickled inside her." what
swallow what why = printf "\nShe swallowed the %s to catch the %s." what why

rhyme :: String -> String
rhyme animal = case animal of
    "fly" -> ""
    "spider" -> "\nIt wriggled and jiggled and tickled inside her."
    "bird" -> "\nHow absurd to swallow a bird!"
    "cat" -> "\nImagine that, to swallow a cat!"
    "dog" -> "\nWhat a hog, to swallow a dog!"
    "goat" -> "\nJust opened her throat and swallowed a goat!"
    "cow" -> "\nI don't know how she swallowed a cow!"
    "horse" -> "\nShe's dead, of course!"
    _ -> "\nWooah, we don't do that here!"

verse :: Int -> String
verse n
    | n == 7 = printf "I know an old lady who swallowed a %s.%s" animal (rhyme animal)
    | otherwise =
      printf "I know an old lady who swallowed a %s.%s%s\nI don't know why she swallowed the fly. Perhaps she'll die.\n" 
        animal 
        (rhyme animal) 
        (concatMap (\i -> swallow (animals !! i) (animals !! (i - 1))) [n, n-1 .. 1])
  where 
    animal = animals !! n


song :: String
song = unlines $ map verse [0..length animals - 1]
