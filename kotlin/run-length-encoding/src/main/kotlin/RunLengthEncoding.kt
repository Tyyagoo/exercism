object RunLengthEncoding {

    fun encode(input: String): String {
        if (input.length < 2) return input

        var count = 1
        var current = input[0]
        val result = mutableListOf<String>()
        
        for (ch: Char in input.substring(1)) {
            if (current == ch) {
                count++
            } else {
                result.add(if (count == 1) "$current" else "$count$current")
                current = ch
                count = 1
            }
        }

        result.add(if (count == 1) "$current" else "$count$current")

        return result.joinToString("")
    }

    fun decode(input: String): String {
        val digits = StringBuilder()
        val output = StringBuilder()

        for (ch: Char in input) {
            if (ch.isDigit()) {
                digits.append(ch)
            } else {
                val times = digits.toString().toIntOrNull() ?: 1
                digits.clear()
                repeat(times) {
                    output.append(ch)
                }
                
            }
        }

        return output.toString()
    }
}
