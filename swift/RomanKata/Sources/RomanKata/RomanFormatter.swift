enum NumericRangeError: Error {
    case numberOutOfBounds
}

struct RomanFormatter {
    func format(_ number: Int) throws -> String {
        var arabic = number
        var roman = ""
        
        guard (1...3999).contains(arabic) else {
            throw NumericRangeError.numberOutOfBounds
        }

        let arabicNumerals = [10, 9, 5, 4, 1]
        let romanNumerals = ["X", "IX", "V", "IV", "I"]
        for index in 0..<arabicNumerals.count {
            while arabic >= arabicNumerals[index] {
                roman += romanNumerals[index]
                arabic -= arabicNumerals[index]
            }
        }
        
        return roman
    }
}
