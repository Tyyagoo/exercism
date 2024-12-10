import java.util.regex.Pattern;
import java.util.regex.Matcher;

class SqueakyClean {
    static String clean(String identifier) {
        Pattern pattern = Pattern.compile("(-[a-zA-Z])");
        Matcher matcher = pattern.matcher(identifier);

        return matcher.replaceAll(m -> m.group().substring(1).toUpperCase())
            .replace(' ', '_')
            .replace('4', 'a')
            .replace('3', 'e')
            .replace('0', 'o')
            .replace('1', 'l')
            .replace('7', 't')
            .replaceAll("[^a-zA-Z0-9_]", "");
    }
}