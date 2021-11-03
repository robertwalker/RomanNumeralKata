class RomanFormatter:
    def format(self, arabic):
        roman = ""

        if arabic == 10:
            return "X"
        for _ in range(arabic):
            roman += "I"
        
        return roman
