import { RomanFormatter } from "../src/RomanFormatter";

let fmt;

beforeEach(() => {
  fmt = new RomanFormatter();
});

describe("RomanFormatter", () => {
  test("convert 1", () => {
    let roman = fmt.format(1);
    expect(roman).toBe("I");
  });
});
