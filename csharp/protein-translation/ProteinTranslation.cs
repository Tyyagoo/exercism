using System;
using System.Collections.Generic;
using System.Linq;

public static class ProteinTranslation
{
    public static Dictionary<string, string> CodonToProtein { get; } =
        new Dictionary<string, string>
        {
            { "AUG", "Methionine" }, { "UUU", "Phenylalanine" },
            { "UUC", "Phenylalanine" }, { "UUA", "Leucine" },
            { "UUG", "Leucine" }, { "UCU", "Serine" },
            { "UCC", "Serine" }, { "UCA", "Serine" },
            { "UCG", "Serine" }, { "UAU", "Tyrosine" },
            { "UAC", "Tyrosine" }, { "UGU", "Cysteine" },
            { "UGC", "Cysteine" }, { "UGG", "Tryptophan" },
            { "UAA", "STOP" }, { "UAG", "STOP" }, { "UGA", "STOP" }
        };

    public static string[] Proteins(string strand) =>
        Enumerable.Range(0, strand.Length / 3)
                  .Select(i => CodonToProtein[strand.Substring(i * 3, 3)])
                  .TakeWhile(p => p != "STOP")
                  .ToArray();
}
