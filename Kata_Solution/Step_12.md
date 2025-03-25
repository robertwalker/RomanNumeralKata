# Roman Numeral Kata Solution

## Step 12: Subtractive Notation

Let's start with the number `4`, which is the first Roman numeral that requires subtractive notation.

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
@Test("expect roman to be equal in value to arabic", arguments:
        zip(
            [1, 2, 3, 4, 5, 6, 8, 10, 20, 30],
            ["I", "II", "III", "IV", "V", "VI", "VIII", "X", "XX", "XXX"]
        )
)
func convertToRoman(arabic: Int, expectedRoman: String) {
    let roman = fmt.format(arabic)
    #expect(roman == expectedRoman)
}
```

Let’s run the tests and see what they reveal. We should probably get a failure like this:

```text
convertToRoman(arabic:expectedRoman:): Expectation failed: (roman → "IIII") == (expectedRoman → "IV")
```

Although technically correct, representing `4` as `IIII` is uncommon and not allowed by our feature specification, which
specifically requires subtractive notation.

We could treat this as a special case.

```swift
func format(_ number: Int) -> String {
    var arabic = number
    var roman = ""

    // Handle the special case of 4
    if arabic == 4 {
        return "IV"
    }

    // Otherwise use the normal process
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

This isn’t going to be practical. There are a lot of values between `1` and `3999` that need to be represented using
subtractive notation, like the number `9`, which is written as `IX`.

Let’s think about this a bit more. We’re basically treating the number `5` as a special case. Why don’t we treat `4` the
same way by adding it to our arrays while preserving the descending order?

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

Let’s run all the tests to see what this new trick does:

Guess what? Our failing test is now passing, and all the other tests are still passing too.

Based on what we’ve learned, this technique might also work for the number `9`.

Let's go ahead and add `9` to our scenario and test case:

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
@Test("expect roman to be equal in value to arabic", arguments:
        zip(
            [1, 2, 3, 4, 5, 6, 8, 9, 10, 20, 30],
            ["I", "II", "III", "IV", "V", "VI", "VIII", "IX", "X", "XX", "XXX"]
        )
)
func convertToRoman(arabic: Int, expectedRoman: String) {
    let roman = fmt.format(arabic)
    #expect(roman == expectedRoman)
}
```

Let's run the tests again.

Can you guess the results of the new test case?

<details>

<summary>Reveal Answer</summary>

### We have a new test failure

We should actually get a failure similar to this:

```text
convertToRoman(arabic:expectedRoman:): Expectation failed: (roman → "VIV") == (expectedRoman → "IX")
```

The string `VIV` doesn’t represent `9` in Roman numerals, despite `5 + 4 = 9` (`V + IV = IX`).

Let’s ignore any potential patterns for now and treat `9` like `4`, adding it to our arrays in the correct position.

```swift
let arabicNumerals = [10, 9, 5, 4, 1]
let romanNumerals = ["X", "IX", "V", "IV", "I"]
```

Let's run the tests again.

Great news! Our function is now ready to handle any value between `1` and `10`.

</details>

[Go to Step 13](./Step_13.md)
