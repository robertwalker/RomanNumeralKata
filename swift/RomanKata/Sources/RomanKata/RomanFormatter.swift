enum RomanError: Error {
    case numberOutOfRange
}

struct RomanFormatter {
    func format(_ number: Int) throws -> String {
        var arabic = number
        var roman = ""
        
        guard (1...3999).contains(arabic) else {
            throw RomanError.numberOutOfRange
        }
        
        let arabicNumerals = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
        let romanNumerals = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
        for index in 0..<arabicNumerals.count {
            while arabic >= arabicNumerals[index] {
                roman += romanNumerals[index]
                arabic -= arabicNumerals[index]
            }
        }
        
        return roman
    }
}
