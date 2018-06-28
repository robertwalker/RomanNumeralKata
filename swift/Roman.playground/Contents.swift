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

class RomanFormatter {
    func format(_ number: Int) -> String {
        var arabic = number
        var roman = ""
        
        if arabic == 10 {
            roman += "X"
            arabic -= 10
        }
        for _ in 0..<arabic {
            roman += "I"
        }
        
        return roman
    }
}

class RomanFormatterTests: XCTestCase {
    var fmt: RomanFormatter!
    
    override func setUp() {
        fmt = RomanFormatter()
    }
    
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
    
    func testConvert10() {
        let roman = fmt.format(10)
        XCTAssertEqual(roman, "X")
    }
}

RomanFormatterTests.defaultTestSuite.run()
