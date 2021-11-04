class RomanFormatter:
    def format(self, arabic):
        roman = ""

        while arabic >= 10:
            roman += "X"
            arabic -= 10
        while arabic >= 1:
            roman += "I"
            arabic -= 1
        
        return roman
