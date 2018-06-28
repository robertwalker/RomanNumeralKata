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

enum InvalidArgument: Error {
    case outOfRange
}

class RomanFormatter {
    func format(_ number: Int) throws -> String {
        var arabic = number
        var roman = ""
        
        guard arabic > 0 && arabic < 4000 else {
            throw InvalidArgument.outOfRange
        }
        
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
    
    func testConvert1() throws {
        let roman = try fmt.format(1)
        XCTAssertEqual(roman, "I")
    }
    
    func testConvert2() throws {
        let roman = try fmt.format(2)
        XCTAssertEqual(roman, "II")
    }
    
    func testConvert3() throws {
        let roman = try fmt.format(3)
        XCTAssertEqual(roman, "III")
    }
    
    func testConvert4() throws {
        let roman = try fmt.format(4)
        XCTAssertEqual(roman, "IV")
    }
    
    func testConvert5() throws {
        let roman = try fmt.format(5)
        XCTAssertEqual(roman, "V")
    }
    
    func testConvert10() throws {
        let roman = try fmt.format(10)
        XCTAssertEqual(roman, "X")
    }
    
    func testConvert20() throws {
        let roman = try fmt.format(20)
        XCTAssertEqual(roman, "XX")
    }
    
    func testConvert27() throws {
        let roman = try fmt.format(27)
        XCTAssertEqual(roman, "XXVII")
    }
    
    func testConvert30() throws {
        let roman = try fmt.format(30)
        XCTAssertEqual(roman, "XXX")
    }
    
    func testConvert50() throws {
        let roman = try fmt.format(50)
        XCTAssertEqual(roman, "L")
    }
    
    // MARK: Failure tests
    
    func testConvertNegative() {
        XCTAssertThrowsError(try fmt.format(-1))
    }
    
    func testConvertZero() {
        XCTAssertThrowsError(try fmt.format(0))
    }
    
    func testConvert4000() {
        XCTAssertThrowsError(try fmt.format(4000))
    }
}

RomanFormatterTests.defaultTestSuite.run()
