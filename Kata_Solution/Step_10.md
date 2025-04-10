# Roman Numeral Kata Solution

## Step 10: Handling Variation from the Pattern

Now that we’ve handled values that follow our established pattern, let’s examine values that deviate from it.

Let’s begin with the Arabic number `5`. First, let’s add a new scenario and test it.

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
@Test("expect roman to be equal in value to arabic", arguments:
        zip([1, 2, 3, 5, 10, 20, 30], ["I", "II", "III", "V", "X", "XX", "XXX"])
)
func convertToRoman(arabic: Int, expectedRoman: String) {
    let roman = fmt.format(arabic)
    #expect(roman == expectedRoman)
}
```

This should generate a test failure that looks something like this:

```text
convertToRoman(arabic:expectedRoman:): Expectation failed: (roman → "IIIII") == (expectedRoman → "V")
```

The Roman numeral `V` doesn’t work like `I` or `X` because it’s never repeated. However, we still want `V` to represent
5. So let’s insert it into our arrays, ensuring it’s placed between 10 and 1.

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

Let’s give our tests another go to see how far we can get.

Guess what? That new failing test actually passed! And all the other tests are still passing too.

We’re back to the "Green" phase. and there’s nothing to clean up or refactor.

[Go to Step 11](./Step_11.md)
