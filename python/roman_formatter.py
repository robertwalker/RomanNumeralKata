class RomanFormatter:
    def format(self, arabic):
        roman = ""

        arabicNumerals = [10, 9, 5, 4, 1]
        romanNumerals = ["X", "IX", "V", "IV", "I"]
        for index in range(len(arabicNumerals)):
            while arabic >= arabicNumerals[index]:
                roman += romanNumerals[index]
                arabic -= arabicNumerals[index]
        
        return roman
