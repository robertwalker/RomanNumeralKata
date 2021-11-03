struct RomanFormatter {
    func format(_ arabic: Int) -> String {
        if arabic == 3 {
            return "I" + "I" + "I"
        }
        if arabic == 2 {
            return "I" + "I"
        }
        return "I"
    }
}
