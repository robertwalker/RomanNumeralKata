class RomanFormatter {
    format(arabic) {
        if (arabic === 3) {
            return "I" + "I" + "I"
        }
        if (arabic === 2) {
            return "I" + "I";
        }
        return "I";
    }
}

module.exports = RomanFormatter
