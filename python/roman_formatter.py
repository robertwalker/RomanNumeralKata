class RomanFormatter:
    def format(self, arabic):
        roman = ""

        arabicNumerals = [10, 1]
        romanNumerals = ["X", "I"]
        while arabic >= arabicNumerals[0]:
            roman += romanNumerals[0]
            arabic -= arabicNumerals[0]
        while arabic >= arabicNumerals[1]:
            roman += romanNumerals[1]
            arabic -= arabicNumerals[1]
        
        return roman
