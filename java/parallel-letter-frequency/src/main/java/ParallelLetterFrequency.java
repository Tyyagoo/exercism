import java.util.Map;
import java.util.Arrays;
import java.util.stream.Collectors;

class ParallelLetterFrequency {
    private String[] texts;

    ParallelLetterFrequency(String[] texts) {
        this.texts = texts;
    }

    Map<Character, Integer> countLetters() {
        return Arrays.stream(this.texts).parallel()
            .flatMap(text -> countLetters(text).entrySet().stream())
            .collect(Collectors.toMap(
                Map.Entry::getKey,
                Map.Entry::getValue,
                Integer::sum
            ));
    }

    private static Map<Character, Integer> countLetters(String text) {
        return text.chars()
            .mapToObj(c -> {
                if (c >= 65 && c <= 90) return (char) (c + 32);
                if (c >= 97 && c <= 122) return (char) c;
                if (c >= 128) return (char) c;
                return (char) 0;
            })
            .filter(c -> c != 0)
            .collect(Collectors.groupingBy(
                c -> c,
                Collectors.summingInt(c -> 1)
            ));
    }
}