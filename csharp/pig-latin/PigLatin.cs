using System;
using System.Text.RegularExpressions;
using System.Collections.Generic;

public static class PigLatin
{
    public static string Translate(string phrase)
    {
        List<string> words = new List<string>();
        foreach (var word in phrase.Split(' ')) {
            if (Regex.Match(word, @"^([aeiou]|xr|yt)").Success) {
                words.Add($"{word}ay");
                continue;
            }

            String pattern = @"^(y|[^aeiouy]*qu|[^aeiouy]+)(.*)";
            Match match = Regex.Match(word, pattern);
            string fst = match.Groups[2].Value;
            string snd = match.Groups[1].Value;
            words.Add($"{fst}{snd}ay");
        }

        return String.Join(" ", words);
    }
}