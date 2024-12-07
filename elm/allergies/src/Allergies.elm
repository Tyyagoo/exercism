module Allergies exposing (Allergy(..), isAllergicTo, toList)

import Bitwise exposing (and)

type Allergy
    = Eggs
    | Peanuts
    | Shellfish
    | Strawberries
    | Tomatoes
    | Chocolate
    | Pollen
    | Cats

allergyValues : List Allergy
allergyValues = [ Eggs, Peanuts, Shellfish, Strawberries, Tomatoes, Chocolate, Pollen, Cats ]

allergyToInt : Allergy -> Int
allergyToInt allergy =
    case allergy of
        Eggs -> 1
        Peanuts -> 2
        Shellfish -> 4
        Strawberries -> 8
        Tomatoes -> 16
        Chocolate -> 32
        Pollen -> 64
        Cats -> 128

isAllergicTo : Allergy -> Int -> Bool
isAllergicTo allergy score =
    allergyToInt allergy |> and score |> (/=) 0

toList : Int -> List Allergy
toList score = List.filter (\a -> isAllergicTo a score) allergyValues
