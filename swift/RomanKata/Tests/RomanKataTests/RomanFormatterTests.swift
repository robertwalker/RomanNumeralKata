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
    
    @Test("expect roman to be I")
    func convert1() {
        let roman = fmt.format(1)
        #expect(roman == "I")
    }
}
