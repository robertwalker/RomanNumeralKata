// Roman Numerals Kata
// I: 1
// V: 5
// X: 10
// L: 50
// C: 100
// D: 500
// M: 1000

// Import RomanFormatter class
const RomanFormatter = require("../src/roman_formatter");

describe("RomanFormatter", () => {
  it("should convert 1 to the Roman numeral I", () => {
    const fmt = new RomanFormatter([]);
    const roman = fmt.format(1);
    expect(roman).toEqual("I");
  });

  it("should convert 2 to the Roman numeral II", () => {
    const fmt = new RomanFormatter([]);
    const roman = fmt.format(2);
    expect(roman).toEqual("II");
  });

  it("should convert 3 to the Roman numeral III", () => {
    const fmt = new RomanFormatter([]);
    const roman = fmt.format(3);
    expect(roman).toEqual("III");
  });
});
