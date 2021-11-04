struct RomanFormatter {
    func format(_ number: Int) -> String {
        var arabic = number
        var roman = ""
        
        var arabicNumeral = 10
        var romanNumeral = "X"
        while arabic >= arabicNumeral {
            roman += romanNumeral
            arabic -= arabicNumeral
        }
        arabicNumeral = 1
        romanNumeral = "I"
        while arabic >= arabicNumeral {
            roman += romanNumeral
            arabic -= arabicNumeral
        }
        
        return roman
    }
}
