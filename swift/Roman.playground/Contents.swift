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
        
        var arabicNumerals = [50, 10, 5, 4, 1]
        var romanNumberals = ["L", "X", "V", "IV", "I"]
        for index in 0..<arabicNumerals.count {
            while arabic >= arabicNumerals[index] {
                roman += romanNumberals[index]
                arabic -= arabicNumerals[index]
            }
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
    
    func testConvert4() {
        let roman = fmt.format(4)
        XCTAssertEqual(roman, "IV")
    }
    
    func testConvert5() {
        let roman = fmt.format(5)
        XCTAssertEqual(roman, "V")
    }
    
    func testConvert10() {
        let roman = fmt.format(10)
        XCTAssertEqual(roman, "X")
    }
    
    func testConvert20() {
        let roman = fmt.format(20)
        XCTAssertEqual(roman, "XX")
    }
    
    func testConvert27() {
        let roman = fmt.format(27)
        XCTAssertEqual(roman, "XXVII")
    }
    
    func testConvert30() {
        let roman = fmt.format(30)
        XCTAssertEqual(roman, "XXX")
    }
    
    func testConvert50() {
        let roman = fmt.format(50)
        XCTAssertEqual(roman, "L")
    }
}

RomanFormatterTests.defaultTestSuite.run()
