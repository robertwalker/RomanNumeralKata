class RomanFormatter {
    format(arabic) {
        let roman = "";

        if (!Number.isInteger(arabic)) {
            throw `${arabic} is not a valid integer value`;
        }

        if (arabic < 1 || arabic > 3999) {
            throw `${arabic} is not in the supported range of 1-3999`;
        }

        const arabicNumerals = [10, 9, 5, 4, 1];
        const romanNumerals = ["X", "IX", "V", "IV", "I"];
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
