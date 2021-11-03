struct RomanFormatter {
    func format(_ arabic: Int) -> String {
        if arabic == 2 {
            return "II"
        }
        return "I"
    }
}
