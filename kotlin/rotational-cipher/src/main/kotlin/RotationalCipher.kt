class RotationalCipher(private val shift: Int) {
    fun encode(text: String): String {
        return text.map { char ->
            when {
                char.isUpperCase() -> 'A' + (char - 'A' + shift) % 26
                char.isLowerCase() -> 'a' + (char - 'a' + shift) % 26
                else -> char
            }
        }.joinToString("")
    }
}
