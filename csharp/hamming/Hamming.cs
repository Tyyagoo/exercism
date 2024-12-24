using System;

public static class Hamming
{
    public static int Distance(string firstStrand, string secondStrand)
    {
        if (firstStrand.Length != secondStrand.Length && (firstStrand.Length != 0 || secondStrand.Length != 0))
            throw new ArgumentException("Strands must either be both empty or have the same length.");

        int diffs = 0;
        for (int i = 0; i < firstStrand.Length; i++) {
            if (firstStrand[i] != secondStrand[i]) diffs++;
        }
        return diffs;
    }
}