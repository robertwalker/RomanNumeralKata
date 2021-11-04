class RomanFormatter:
    def format(self, arabic):
        roman = ""

        arabicNumeral = 10
        romanNumeral = "X"
        while arabic >= arabicNumeral:
            roman += romanNumeral
            arabic -= arabicNumeral
        arabicNumeral = 1
        romanNumeral = "I"
        while arabic >= arabicNumeral:
            roman += romanNumeral
            arabic -= arabicNumeral
        
        return roman
