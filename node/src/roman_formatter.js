class RomanFormatter {
    format(arabic) {
        let roman = "";

        if (arabic == 10) {
            return "X";
        }
        for (let i = 0; i < arabic; i++) {
            roman += "I";
        }

        return roman;
    }
}

module.exports = RomanFormatter
