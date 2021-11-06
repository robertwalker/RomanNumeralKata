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
    
    func testConvertNegativeNumbers() {
        XCTAssertThrowsError(try fmt.format(-1))
    }
    
    func testConvert0() {
        XCTAssertThrowsError(try fmt.format(0))
    }
    
    func testConvertNumbersGreaterThan3999() {
        XCTAssertThrowsError(try fmt.format(4000))
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
    
    func testConvert6() throws {
        let roman = try fmt.format(6)
        XCTAssertEqual(roman, "VI")
    }
    
    func testConvert8() throws {
        let roman = try fmt.format(8)
        XCTAssertEqual(roman, "VIII")
    }
    
    func testConvert9() throws {
        let roman = try fmt.format(9)
        XCTAssertEqual(roman, "IX")
    }
    
    func testConvert10() throws {
        let roman = try fmt.format(10)
        XCTAssertEqual(roman, "X")
    }
    
    func testConvert20() throws {
        let roman = try fmt.format(20)
        XCTAssertEqual(roman, "XX")
    }
    
    func testConvert30() throws {
        let roman = try fmt.format(30)
        XCTAssertEqual(roman, "XXX")
    }
}
