struct RomanFormatter {
    func format(_ arabic: Int) -> String {
        var roman = ""
        
        if arabic == 10 {
            return "X"
        }
        for _ in 0..<arabic {
            roman += "I"
        }
        
        return roman
    }
}
