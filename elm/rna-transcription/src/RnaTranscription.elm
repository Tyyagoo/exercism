module RnaTranscription exposing (toRna)

transcribeNucleotide : Char -> Maybe Char
transcribeNucleotide nucleotide =
    case nucleotide of
        'G' -> Just 'C'
        'C' -> Just 'G'
        'T' -> Just 'A'
        'A' -> Just 'U'
        _ -> Nothing

combineResults : List (Maybe Char) -> Maybe String
combineResults nucleotides =
    nucleotides
        |> List.foldl
            (\maybeNucleotide maybeAcc ->
                case (maybeNucleotide, maybeAcc) of
                    (Just n, Just acc) -> Just (acc ++ String.fromChar n)
                    _ -> Nothing
            )
            (Just "")

toRna : String -> Result String String
toRna dna =
    dna
        |> String.toList
        |> List.map transcribeNucleotide
        |> combineResults
        |> Result.fromMaybe
            (Err "Invalid nucleotide sequence detected.")
