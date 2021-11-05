# Roman Numeral Kata Solution

## Step 10: Handling Variation from the Pattern

Now that we've handled values that follow the pattern that we have established let's begin to look at some values that
deviate from this pattern.

Let's start with the Arabic number `5`. First let's add a new scenario and test:

```gherkin
Feature: Convert Arabic numerals to Roman numerals
  Arabic numerals must be positive integers between 1 and 3999
  Roman numerals must be represented using subtractive notation
  See: <https://en.wikipedia.org/wiki/Roman_numerals#Basic_decimal_pattern>

  # --- Other scenarios --- #

  Scenario: Convert 5 to "V"
    Given I have the arabic number 5
    When I convert to Roman
    Then I should see the string "V"
```

```swift
func testConvert5() {
    let roman = fmt.format(5)
    XCTAssertEqual(roman, "V")
}
```

This should generate a test failure that looks something like this:

```text
test failure: RomanFormatterTests.testConvert5() failed: XCTAssertEqual failed: ("IIIII") is not equal to ("V")
```

The Roman numeral `V` does not work like either `I` nor `X` since `V` is never repeated. However, we still want the
number 5 to be represented by the new Roman digit `V`. So let's take care of that issue first by adding it to our
arrays, making sure we place it in the correct sequence between 10 and 1:

```swift
func format(_ number: Int) -> String {
    var arabic = number
    var roman = ""
    
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

Let's run our tests again to see how far that gets us.

Hey! That actually passed the one new failing test, and all other tests are still passing as well.

Congratulations! We are back to **green** and there's nothing to clean up or refactor.
