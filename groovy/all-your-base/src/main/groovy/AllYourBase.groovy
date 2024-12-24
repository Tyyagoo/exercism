class AllYourBase {
    int base
    Integer[] digits

    AllYourBase(inputBase, digits) {
        this.base = inputBase
        this.digits = digits.reverse()

        if (inputBase < 2) {
            throw new ArithmeticException()
        }
    }

    def rebase(outputBase) {
        if (outputBase < 2) {
            throw new ArithmeticException()
        }
        
        int sum = 0
        this.digits.eachWithIndex { d, i ->
            if (d >= this.base || d < 0) {
                throw new ArithmeticException()
            }
            sum += d * (this.base ** i)
        }

        def digits = []
        while (sum > 0) {
            digits << sum % outputBase
            sum = sum.intdiv(outputBase)
        }
        return digits.reverse().with { it ?: [0] }
    }
}