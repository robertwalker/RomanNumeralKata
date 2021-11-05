# Roman Numeral Kata Solution

## Step 12: Subtractive Notation

Let's start with the number `4`, which is the first number that requires subtractive notation.

Here's our scenario and test:

```gherkin
Feature: Convert Arabic numerals to Roman numerals
  Arabic numerals must be positive integers between 1 and 3999
  Roman numerals must be represented using subtractive notation
  See: <https://en.wikipedia.org/wiki/Roman_numerals#Basic_decimal_pattern>

  # --- Other scenarios --- #

  Scenario: Convert 4 to "IV"
    Given I have the arabic number 4
    When I convert to Roman
    Then I should see the string "IV"

  # --- Other scenarios --- #  
```

```swift
func testConvert4() {
    let roman = fmt.format(4)
    XCTAssertEqual(roman, "IV")
}
```

Let's run the tests and see what this tells us. We should get a failure similar to this:

```text
test failure: RomanFormatterTests.testConvert4() failed: XCTAssertEqual failed: ("IIII") is not equal to ("IV")
```

Although it is technically correct to represent `4` as `IIII` that is not as common, nor is it allowed by our feature
specification, which requires the use of subtractive notation.

We could use a naïve approach and treat this as a special case:

```swift
func format(_ number: Int) -> String {
    var arabic = number
    var roman = ""

    // Handle the special case of 4
    if arabic == 4 {
        return "IV"
    }
    // Otherwise using the normal process

    let arabicNumerals = [10, 5, 1]
    let romanNumerals = ["X", "V", "I"]
    for index in 0..<arabicNumerals.count {
        while arabic >= arabicNumerals[index] {
            roman += romanNumerals[index]
            arabic -= arabicNumerals[index]
        }
    }
    
    return roman
}
```

This is not going to be a viable solution. There is a relatively large set of values requiring subtractive notation
between `1` and `3999`, such as the number `9`, which is represented as `IX` along with many others.

When thinking about this a bit more we realize that we are essentially treating the number `5` as a special case. Why
not try to treat `4` the same way by adding it into our arrays, keeping the descending order sequence:

```swift
let arabicNumerals = [10, 5, 4, 1]
let romanNumerals = ["X", "V", "IV", "I"]
```

So now our function looks like this:

```swift
func format(_ number: Int) -> String {
    var arabic = number
    var roman = ""
    
    let arabicNumerals = [10, 5, 4, 1]
    let romanNumerals = ["X", "V", "IV", "I"]
    for index in 0..<arabicNumerals.count {
        while arabic >= arabicNumerals[index] {
            roman += romanNumerals[index]
            arabic -= arabicNumerals[index]
        }
    }
    
    return roman
}
```

Let's run all the tests to see what this does:

Congratulations! Our previously failing test is now passing, and all other tests are still passing as well.

Based on what we know, this technique should also work for the number `9`.

Let's go ahead and add our scenario and test for that:

```gherkin
Feature: Convert Arabic numerals to Roman numerals
  Arabic numerals must be positive integers between 1 and 3999
  Roman numerals must be represented using subtractive notation
  See: <https://en.wikipedia.org/wiki/Roman_numerals#Basic_decimal_pattern>

  # --- Other scenarios --- #

  Scenario: Convert 4 to "IV"
    Given I have the arabic number 4
    When I convert to Roman
    Then I should see the string "IV"

  Scenario: Convert 9 to "IX"
    Given I have the arabic number 9
    When I convert to Roman
    Then I should see the string "IX"

  # --- Other scenarios --- #  
```

```swift
func testConvert9() {
    let roman = fmt.format(9)
    XCTAssertEqual(roman, "IX")
}
```

Let's run the tests again. We should get a failure similar to this:

```text
test failure: RomanFormatterTests.testConvert9() failed: XCTAssertEqual failed: ("VIV") is not equal to ("IX")
```

Hum, this is interesting. This `VIV` is not how `9` is represented in Roman numerals even though: `5 + 4 = 9`
(i. e. `V + IV = IX`).

You may be seeing another pattern emerging from our current design, but let's put that aside for now and treat `9` like
we did `4` by adding it into our arrays in the correct position:

```swift
let arabicNumerals = [10, 9, 5, 4, 1]
let romanNumerals = ["X", "IX", "V", "IV", "I"]
```

Let's run the tests again.

Congratulations! Our function should now be able to handle all values between 1 and 10.
