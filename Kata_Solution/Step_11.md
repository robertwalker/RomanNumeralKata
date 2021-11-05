# Roman Numeral Kata Solution

## Step 11: Roman Numerals with a Mix of Digits

Not all Roman Numerals are composed of the same digit values. Let's see if we can handle that with the existing
function.

We could try converting the Arabic number `4`, but that would require supporting the "subtractive notation" as it would
be represented by the Roman numeral `IV`. It has a mix of characters like we want, but the scalar values are reversed
(i.e. `I < V`). So let's search for a better candidate. The Arabic number `6` should work, which is represented by the
Roman numeral `VI`. Perfect, just what we're looking for.

Let's add our scenario and test for that:

```gherkin
Feature: Convert Arabic numerals to Roman numerals
  Arabic numerals must be positive integers between 1 and 3999
  Roman numerals must be represented using subtractive notation
  See: <https://en.wikipedia.org/wiki/Roman_numerals#Basic_decimal_pattern>

  # --- Other scenarios --- #

  Scenario: Convert 6 to "VI"
    Given I have the arabic number 6
    When I convert to Roman
    Then I should see the string "VI"
```

```swift
func testConvert6() {
    let roman = fmt.format(6)
    XCTAssertEqual(roman, "VI")
}
```

Let's run the tests to find out what we need to do next.

Hum. That test passed without requiring any code changes. Looks like our design is working out pretty well so far.

Let's go ahead and try another value. We still want to exclude values requiring "subtractive notation" so `9` is not a
good chose as it's represented as `IX`. So let go with `8`:

```gherkin
Feature: Convert Arabic numerals to Roman numerals
  Arabic numerals must be positive integers between 1 and 3999
  Roman numerals must be represented using subtractive notation
  See: <https://en.wikipedia.org/wiki/Roman_numerals#Basic_decimal_pattern>

  # --- Other scenarios --- #

  Scenario: Convert 6 to "VI"
    Given I have the arabic number 6
    When I convert to Roman
    Then I should see the string "VI"

  Scenario: Convert 8 to "VIII"
    Given I have the arabic number 8
    When I convert to Roman
    Then I should see the string "VIII"
```

```swift
func testConvert8() {
    let roman = fmt.format(8)
    XCTAssertEqual(roman, "VIII")
}
```

Congratulations! Our function should be able to handle all values between 1 and 10, excluding the values that require
subtractive notation. We also know we can handle the values 20 and 30, but we'll get to the numbers above 10 in a bit.

Next we want to deal with those pesky values that require subtractive notation. We'll look at those in the next step.
