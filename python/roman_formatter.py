class RomanFormatter:
    def format(self, arabic):
        roman = ""

        if arabic not in range(1, 3999):
            raise Exception(f"{arabic} is not in valid range of 1-3999")

        arabicNumerals = [10, 9, 5, 4, 1]
        romanNumerals = ["X", "IX", "V", "IV", "I"]
        for index in range(len(arabicNumerals)):
            while arabic >= arabicNumerals[index]:
                roman += romanNumerals[index]
                arabic -= arabicNumerals[index]
        
        return roman
