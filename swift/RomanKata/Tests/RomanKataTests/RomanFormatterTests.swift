// Roman Numerals Kata
// I: 1
// V: 5
// X: 10
// L: 50
// C: 100
// D: 500
// M: 1000

import Testing
@testable import RomanKata

struct RomanFormatterTests {
    let fmt = RomanFormatter()
    
    @Test("expect roman to be equal in value to arabic", arguments:
            zip(
                [1, 2, 3, 4, 5, 6, 8, 9, 10, 20, 30, 40, 50,
                 90, 100, 300, 400, 500, 900, 1000, 3000],
                ["I", "II", "III", "IV", "V", "VI", "VIII", "IX", "X", "XX", "XXX", "XL", "L",
                 "XC", "C", "CCC", "CD", "D", "CM", "M", "MMM"]
            )
    )
    func convertToRoman(arabic: Int, expectedRoman: String) throws {
        let roman = try fmt.format(arabic)
        #expect(roman == expectedRoman)
    }
    
    @Test("expect a range error for numbers less than 1 or greater than 3999",
          arguments: [-1, 0, 4000])
    func outOfRangeNumberThrowsError(arabic: Int) {
        #expect(throws: RomanError.numberOutOfRange) {
            try fmt.format(arabic)
        }
    }
}
