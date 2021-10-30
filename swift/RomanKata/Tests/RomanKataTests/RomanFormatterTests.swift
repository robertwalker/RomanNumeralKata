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
    
    func testConvert1() throws {
        let roman = fmt.format(1)
        XCTAssertEqual(roman, "I")
    }
}
