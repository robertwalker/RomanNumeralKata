struct RomanFormatter {
    func format(_ number: Int) -> String {
        var arabic = number
        var roman = ""
        
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
