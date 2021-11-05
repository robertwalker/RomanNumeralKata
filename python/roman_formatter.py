class RomanFormatter:
    def format(self, arabic):
        roman = ""

        arabicNumerals = [10, 5, 1]
        romanNumerals = ["X", "V", "I"]
        for index in range(len(arabicNumerals)):
            while arabic >= arabicNumerals[index]:
                roman += romanNumerals[index]
                arabic -= arabicNumerals[index]
        
        return roman
