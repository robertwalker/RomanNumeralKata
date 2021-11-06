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
  it("should throw an error given a negative number", () => {
    const fmt = new RomanFormatter([]);
    expect(() => {
      fmt.format(-1);
    }).toThrow();
  });

  it("should throw an error given 0", () => {
    const fmt = new RomanFormatter([]);
    expect(() => {
      fmt.format(0);
    }).toThrow();
  });

  it("should throw an error given a number greater than 3999", () => {
    const fmt = new RomanFormatter([]);
    expect(() => {
      fmt.format(4000);
    }).toThrow();
  });

  it("should throw an error given a non-numeric value", () => {
    const fmt = new RomanFormatter([]);
    expect(() => {
      fmt.format("foo");
    }).toThrow();
  });

  it("should throw an error given a non-integer value", () => {
    const fmt = new RomanFormatter([]);
    expect(() => {
      fmt.format(1.1);
    }).toThrow();
  });

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

  it("should convert 4 to the Roman numeral IV", () => {
    const fmt = new RomanFormatter([]);
    const roman = fmt.format(4);
    expect(roman).toEqual("IV");
  });

  it("should convert 5 to the Roman numeral V", () => {
    const fmt = new RomanFormatter([]);
    const roman = fmt.format(5);
    expect(roman).toEqual("V");
  });

  it("should convert 6 to the Roman numeral VI", () => {
    const fmt = new RomanFormatter([]);
    const roman = fmt.format(6);
    expect(roman).toEqual("VI");
  });

  it("should convert 8 to the Roman numeral VIII", () => {
    const fmt = new RomanFormatter([]);
    const roman = fmt.format(8);
    expect(roman).toEqual("VIII");
  });

  it("should convert 9 to the Roman numeral IX", () => {
    const fmt = new RomanFormatter([]);
    const roman = fmt.format(9);
    expect(roman).toEqual("IX");
  });

  it("should convert 10 to the Roman numeral X", () => {
    const fmt = new RomanFormatter([]);
    const roman = fmt.format(10);
    expect(roman).toEqual("X");
  });

  it("should convert 20 to the Roman numeral XX", () => {
    const fmt = new RomanFormatter([]);
    const roman = fmt.format(20);
    expect(roman).toEqual("XX");
  });

  it("should convert 30 to the Roman numeral XXX", () => {
    const fmt = new RomanFormatter([]);
    const roman = fmt.format(30);
    expect(roman).toEqual("XXX");
  });
});
