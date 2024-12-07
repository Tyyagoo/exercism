using System;
using System.Collections.Generic;

public static class ProteinTranslation
{
    public static Dictionary<string, string> CodonToProtein { get; private set; }

     static ProteinTranslation() {
         CodonToProtein = new Dictionary<string, string>
         {
             { "AUG", "Methionine" }, { "UUU", "Phenylalanine" },
             { "UUC", "Phenylalanine" }, { "UUA", "Leucine" },
             { "UUG", "Leucine" }, { "UCU", "Serine" },
             { "UCC", "Serine" }, { "UCA", "Serine" },
             { "UCG", "Serine" },  { "UAU", "Tyrosine" },
             { "UAC", "Tyrosine" }, { "UGU", "Cysteine" },
             { "UGC", "Cysteine" }, { "UGG", "Tryptophan" },
             { "UAA", "STOP" }, { "UAG", "STOP" }, { "UGA", "STOP" }
         };
     }
    
    public static string[] Proteins(string strand)
    {
        List<string> proteins = new List<string> { };
        for (int i = 0; i < strand.Length; i = i + 3)
        {
            string codon = strand.Substring(i, 3);
            string protein = ProteinTranslation.CodonToProtein[codon];
            if (protein == "STOP") break;
            proteins.Add(protein);
        }
        return proteins.ToArray();
    }
}