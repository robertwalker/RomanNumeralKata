class RomanFormatter:
    def format(self, arabic):
        roman = ""

        for _ in range(arabic):
            roman += "I"
        
        return roman
