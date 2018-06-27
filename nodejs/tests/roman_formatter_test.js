//: Roman Numerals Kata
// I: 1
// V: 5
// X: 10
// L: 50
// C: 100
// D: 500
// M: 1000

// We are using Chai with the "expect" style
var chai = require("chai");
var expect = chai.expect;

// Import RomanFormatter class
var RomanFormatter = require("../src/roman_formatter");

describe("RomanFormatter", function() {
  it("should convert 1 to the Roman numeral I", function() {
    var fmt = new RomanFormatter([]);
    var roman = fmt.format(1);
    expect(roman).to.equal("I");
  });
});
