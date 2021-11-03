class RomanFormatter {
    format(arabic) {
        let roman = "";

        for (let i = 0; i < arabic; i++) {
            roman += "I";
        }

        return roman;
    }
}

module.exports = RomanFormatter
