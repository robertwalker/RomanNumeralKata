// Roman Numerals Kata
// I: 1
// V: 5
// X: 10
// L: 50
// C: 100
// D: 500
// M: 1000

import XCTest
@testable import RomanKata

final class RomanFormatterTests: XCTestCase {
    let fmt = RomanFormatter()
    
    func testConvert1() {
        let roman = fmt.format(1)
        XCTAssertEqual(roman, "I")
    }
    
    func testConvert2() {
        let roman = fmt.format(2)
        XCTAssertEqual(roman, "II")
    }
    
    func testConvert3() {
        let roman = fmt.format(3)
        XCTAssertEqual(roman, "III")
    }
}
