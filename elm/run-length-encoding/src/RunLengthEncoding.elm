module RunLengthEncoding exposing (decode, encode)

encode : String -> String
encode string =
    case String.uncons string of
        Nothing -> ""
        Just (x, xs) -> doEncode xs x 1 ""

doEncode : String -> Char -> Int -> String -> String
doEncode input ch count acc =
    let
        newAcc = \() -> (acc ++ countToString count ++ String.fromChar ch)
    in
        case String.uncons input of
            Nothing -> newAcc ()
            Just (x, xs) ->
                if x == ch then
                    doEncode xs ch (count + 1) acc
                else
                    doEncode xs x 1 (newAcc ())
                
countToString : Int -> String
countToString count =
    if count < 2 then
        ""
    else
        String.fromInt(count)

decode : String -> String
decode string =
    doDecode string [] ""

doDecode : String -> List(Char) -> String -> String
doDecode input digits acc  =
    case String.uncons input of
        Nothing -> acc
        Just (x, xs) ->
            if Char.isDigit x then
                doDecode xs (x :: digits) acc
            else
                let
                    repeatCount = toNumber (List.reverse digits)
                    chars = repeatChar x repeatCount
                in
                    doDecode xs [] (acc ++ chars)

toNumber : List(Char) -> Int
toNumber digits =
    digits
        |> List.foldl (\ ch acc -> acc ++ String.fromChar ch) ""
        |> String.toInt
        |> Maybe.withDefault 1

repeatChar : Char -> Int -> String
repeatChar char n =
    List.repeat n char
        |> String.fromList