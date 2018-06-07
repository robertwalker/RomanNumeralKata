import { RomanFormatter } from "../src/RomanFormatter";

test("convert 3", () => {
  let fmt = new RomanFormatter();
  let roman = fmt.format(3);
  expect(roman).toBe("III");
});
