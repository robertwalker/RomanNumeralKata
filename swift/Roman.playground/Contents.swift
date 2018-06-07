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
    let fmt = RomanFormatter()
    
    func testConvert3() {
        let roman = try! fmt.format(3)
        XCTAssertEqual(roman, "III")
    }
}

RomanFormatterTests.defaultTestSuite.run()
