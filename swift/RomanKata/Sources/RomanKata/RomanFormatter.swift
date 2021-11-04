struct RomanFormatter {
    func format(_ number: Int) -> String {
        var arabic = number
        var roman = ""
        
        let arabicNumerals = [10, 1]
        let romanNumerals = ["X", "I"]
        while arabic >= arabicNumerals[0] {
            roman += romanNumerals[0]
            arabic -= arabicNumerals[0]
        }
        while arabic >= arabicNumerals[1] {
            roman += romanNumerals[1]
            arabic -= arabicNumerals[1]
        }
        
        return roman
    }
}
