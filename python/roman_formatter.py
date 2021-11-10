class RomanFormatter:
    def format(self, arabic):
        roman = ""

        if arabic not in range(1, 3999):
            raise Exception(f"{arabic} is not in valid range of 1-3999")

        arabicNumerals = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
        romanNumerals = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
        for index in range(len(arabicNumerals)):
            while arabic >= arabicNumerals[index]:
                roman += romanNumerals[index]
                arabic -= arabicNumerals[index]
        
        return roman
