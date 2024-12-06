module ProteinTranslation

let translate = function
    | "AUG" -> "Methionine"
    | "UUU" | "UUC" -> "Phenylalanine"
    | "UUA" | "UUG" -> "Leucine"
    | "UCU" | "UCC" | "UCA" | "UCG" -> "Serine"
    | "UAU" | "UAC" -> "Tyrosine"
    | "UGU" | "UGC" -> "Cysteine"
    | "UGG" -> "Tryptophan"
    | "UAA" | "UAG" | "UGA" -> "STOP"
    | codon -> failwith $"Unknown codon {codon}"

let proteins rna =
    Seq.chunkBySize 3 rna
    |> Seq.map (System.String >> translate)
    |> Seq.takeWhile ((<>) "STOP")
    |> Seq.toList
