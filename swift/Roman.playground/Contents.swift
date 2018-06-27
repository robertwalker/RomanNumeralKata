//: Roman Numerals Kata
// I: 1
// V: 5
// X: 10
// L: 50
// C: 100
// D: 500
// M: 1000

import Foundation
import XCTest

//class RomanFormatter {
//    func format(_ arabic: Int) -> String {
//        return ""
//    }
//}

class RomanFormatterTests: XCTestCase {
    var fmt: RomanFormatter!
    
    override func setUp() {
        fmt = RomanFormatter()
    }

    func testConvert1() {
        let roman = fmt.format(1)
        XCTAssertEqual(roman, "I")
    }
}

RomanFormatterTests.defaultTestSuite.run()
