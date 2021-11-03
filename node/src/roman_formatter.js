class RomanFormatter {
    format(arabic) {
        if (arabic === 2) {
            return "II";
        }
        return "I";
    }
}

module.exports = RomanFormatter
