class RomanFormatter {
    format(arabic) {
        let roman = "";

        const arabicNumerals = [10, 1];
        const romanNumerals = ["X", "I"];
        while (arabic >= arabicNumerals[0]) {
            roman += romanNumerals[0];
            arabic -= arabicNumerals[0];
        }
        while (arabic >= arabicNumerals[1]) {
            roman += romanNumerals[1];
            arabic -= arabicNumerals[1];
        }

        return roman;
    }
}

module.exports = RomanFormatter
