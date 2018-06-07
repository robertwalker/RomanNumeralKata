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
  it("should return the roman numberal III when given the arabic number 3", function() {
    var fmt = new RomanFormatter([]);
    var roman = fmt.format(3);
    expect(roman).to.equal("III");
  });
});
