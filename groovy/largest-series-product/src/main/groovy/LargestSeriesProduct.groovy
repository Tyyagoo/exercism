class LargestSeriesProduct {
    static largestProduct(digits, span) {
        if (span < 0) {
            throw new IllegalArgumentException("span must not be negative")
        }
        
        if (digits.size() < span) {
            throw new IllegalArgumentException("span must be smaller than string length")
        }

        int maxMul = 0
        for (int i = 0; i < digits.size() - span + 1; i++) {
            String number = digits.substring(i, i + span)
            int mul = 1
            number.each {c ->
                if (!c.isInteger()) {
                    throw new IllegalArgumentException("digits input must only contain digits")
                }

                mul *= c as Integer
            }

            if (mul > maxMul) maxMul = mul
        }
        return maxMul
    }
}
