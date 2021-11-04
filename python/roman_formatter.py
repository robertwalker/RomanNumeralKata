class RomanFormatter:
    def format(self, arabic):
        roman = ""

        arabicNumerals = [10, 1]
        romanNumerals = ["X", "I"]
        for index in range(len(arabicNumerals)):
            while arabic >= arabicNumerals[index]:
                roman += romanNumerals[index]
                arabic -= arabicNumerals[index]
        
        return roman
