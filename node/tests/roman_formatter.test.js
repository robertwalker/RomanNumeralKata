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

const testData = [
  [1, "I"],
  [2, "II"],
  [3, "III"],
  [4, "IV"],
  [5, "V"],
  [6, "VI"],
  [8, "VIII"],
  [9, "IX"],
  [10, "X"],
  [20, "XX"],
  [30, "XXX"],
  [40, "XL"],
  [50, "L"],
  [90, "XC"],
  [100, "C"],
  [300, "CCC"],
  [400, "CD"],
  [500, "D"],
  [900, "CM"],
  [1000, "M"],
  [3000, "MMM"],
];

describe("RomanFormatter", () => {
  it.each(testData)(
    "should convert %p to the Roman numeral %p",
    (arabic, expectedRoman) => {
      const fmt = new RomanFormatter([]);
      const roman = fmt.format(arabic);
      expect(roman).toEqual(expectedRoman);
    }
  );
});
