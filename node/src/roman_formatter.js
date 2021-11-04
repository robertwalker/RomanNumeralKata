class RomanFormatter {
    format(arabic) {
        let roman = "";

        let arabicNumeral = 10;
        let romanNumeral = "X";
        while (arabic >= arabicNumeral) {
            roman += romanNumeral;
            arabic -= arabicNumeral;
        }
        arabicNumeral = 1;
        romanNumeral = "I";
        while (arabic >= arabicNumeral) {
            roman += romanNumeral;
            arabic -= arabicNumeral;
        }

        return roman;
    }
}

module.exports = RomanFormatter
