struct RomanFormatter {
    func format(_ arabic: Int) -> String {
        var roman = ""
        
        for _ in 0..<arabic {
            roman += "I"
        }
        
        return roman
    }
}
