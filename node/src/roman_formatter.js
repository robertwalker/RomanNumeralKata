class RomanFormatter {
    format(arabic) {
        let roman = "";

        const arabicNumerals = [10, 1];
        const romanNumerals = ["X", "I"];
        for (let index = 0; index < arabicNumerals.length; index++) {
            while (arabic >= arabicNumerals[index]) {
                roman += romanNumerals[index];
                arabic -= arabicNumerals[index];
            }
        }

        return roman;
    }
}

module.exports = RomanFormatter
