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

enum InvalidArgumentError: Error {
    case outOfRange
}

class RomanFormatter {
    private let arabicNumbers = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
    private let romanNumerals = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
    
    func format(_ arabic: Int) throws -> String {
        guard arabic > 0 && arabic < 4000 else {
            throw InvalidArgumentError.outOfRange
        }
        
        var roman = ""
        var current = arabic
        for i in 0..<arabicNumbers.count {
            while current >= arabicNumbers[i] {
                roman += romanNumerals[i]
                current -= arabicNumbers[i]
            }
        }
        return roman
    }
}

class RomanFormatterTests: XCTestCase {
    let fmt = RomanFormatter()
    
    func testConvert1() {
        let roman = try! fmt.format(1)
        XCTAssertEqual(roman, "I")
    }
    
    func testConvert2() {
        let roman = try! fmt.format(2)
        XCTAssertEqual(roman, "II")
    }
    
    func testConvert3() {
        let roman = fmt.format(3)
        XCTAssertEqual(roman, "III")
    }
    
    func testConvert4() {
        let roman = try! fmt.format(4)
        XCTAssertEqual(roman, "IV")
    }
    
    func testConvert5() {
        let roman = try! fmt.format(5)
        XCTAssertEqual(roman, "V")
    }
    
    func testConvert6() {
        let roman = try! fmt.format(6)
        XCTAssertEqual(roman, "VI")
    }
    
    func testConvert7() {
        let roman = try! fmt.format(7)
        XCTAssertEqual(roman, "VII")
    }
    
    func testConvert8() {
        let roman = try! fmt.format(8)
        XCTAssertEqual(roman, "VIII")
    }
    
    func testConvert9() {
        let roman = try! fmt.format(9)
        XCTAssertEqual(roman, "IX")
    }
    
    func testConvert10() {
        let roman = try! fmt.format(10)
        XCTAssertEqual(roman, "X")
    }
    
    func testConvert11() {
        let roman = try! fmt.format(11)
        XCTAssertEqual(roman, "XI")
    }
    
    func testConvert19() {
        let roman = try! fmt.format(19)
        XCTAssertEqual(roman, "XIX")
    }
    
    func testConvert20() {
        let roman = try! fmt.format(20)
        XCTAssertEqual(roman, "XX")
    }
    
    func testConvert27() {
        let roman = try! fmt.format(27)
        XCTAssertEqual(roman, "XXVII")
    }
    
    func testConvert30() {
        let roman = try! fmt.format(30)
        XCTAssertEqual(roman, "XXX")
    }
    
    func testConvert40() {
        let roman = try! fmt.format(40)
        XCTAssertEqual(roman, "XL")
    }
    
    func testConvert44() {
        let roman = try! fmt.format(44)
        XCTAssertEqual(roman, "XLIV")
    }
    
    func testConvert49() {
        let roman = try! fmt.format(49)
        XCTAssertEqual(roman, "XLIX")
    }
    
    func testConvert50() {
        let roman = try! fmt.format(50)
        XCTAssertEqual(roman, "L")
    }
    
    func testConvert90() {
        let roman = try! fmt.format(90)
        XCTAssertEqual(roman, "XC")
    }
    
    func testConvert100() {
        let roman = try! fmt.format(100)
        XCTAssertEqual(roman, "C")
    }
    
    func testConvert200() {
        let roman = try! fmt.format(200)
        XCTAssertEqual(roman, "CC")
    }
    
    func testConvert400() {
        let roman = try! fmt.format(400)
        XCTAssertEqual(roman, "CD")
    }
    
    func testConvert499() {
        let roman = try! fmt.format(499)
        XCTAssertEqual(roman, "CDXCIX")
    }
    
    func textConvert500() {
        let roman = try! fmt.format(500)
        XCTAssertEqual(roman, "D")
    }
    
    func testConvert900() {
        let roman = try! fmt.format(900)
        XCTAssertEqual(roman, "CM")
    }
    
    func testConvert999() {
        let roman = try! fmt.format(999)
        XCTAssertEqual(roman, "CMXCIX")
    }
    
    func testConvert1000() {
        let roman = try! fmt.format(1000)
        XCTAssertEqual(roman, "M")
    }
    
    func testConvert1234() {
        let roman = try! fmt.format(1234)
        XCTAssertEqual(roman, "MCCXXXIV")
    }
    
    func testConvert1666() {
        let roman = try! fmt.format(1666)
        XCTAssertEqual(roman, "MDCLXVI")
    }
    
    func testConvet1999() {
        let roman = try! fmt.format(1999)
        XCTAssertEqual(roman, "MCMXCIX")
    }
    
    func testConvert2000() {
        let roman = try! fmt.format(2000)
        XCTAssertEqual(roman, "MM")
    }
    
    func testConvert2018() {
        let roman = try! fmt.format(2018)
        XCTAssertEqual(roman, "MMXVIII")
    }
    
    func testConvert2019() {
        let roman = try! fmt.format(2019)
        XCTAssertEqual(roman, "MMXIX")
    }
    
    func testConvert3999() {
        let roman = try! fmt.format(3999)
        XCTAssertEqual(roman, "MMMCMXCIX")
    }
    
    // MARK: - Tests expecting errors
    
    func testNegativeNumber() {
        XCTAssertThrowsError(try fmt.format(-1))
    }
    
    func testConvert0() {
        XCTAssertThrowsError(try fmt.format(0))
    }
    
    func testConvert4000() {
        XCTAssertThrowsError(try fmt.format(4000))
    }
}

RomanFormatterTests.defaultTestSuite.run()
