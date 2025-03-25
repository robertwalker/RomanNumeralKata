# Roman Numeral Kata Solution

## Step 11: Roman Numerals with a Mix of Digits

Let’s see if we can handle Roman numerals with different digit values using the existing function.

We could convert the Arabic number `4`, but it requires supporting “subtractive notation” as represented by the Roman
numeral `IV`. It has the desired characters but reversed scalar values (`I < V`). Let’s search for a better candidate.
The Arabic number `6`, represented by `VI`, works perfectly.

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
@Test("expect roman to be equal in value to arabic", arguments:
        zip(
            [1, 2, 3, 5, 6, 10, 20, 30],
            ["I", "II", "III", "V", "VI", "X", "XX", "XXX"]
        )
)
func convertToRoman(arabic: Int, expectedRoman: String) {
    let roman = fmt.format(arabic)
    #expect(roman == expectedRoman)
}
```

Alright, let’s run the tests and see what we need to do next.

Hmm, that test passed without any code changes. It seems like our design is working out pretty well so far.

Let’s try another value. We still want to exclude values that use “subtractive notation,” so `9` isn’t a good choice
because it’s represented as `IX`. So let’s go with `8`.

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
@Test("expect roman to be equal in value to arabic", arguments:
        zip(
            [1, 2, 3, 5, 6, 8, 10, 20, 30],
            ["I", "II", "III", "V", "VI", "VIII", "X", "XX", "XXX"]
        )
)
func convertToRoman(arabic: Int, expectedRoman: String) {
    let roman = fmt.format(arabic)
    #expect(roman == expectedRoman)
}
```

Great news! Our function should be able to handle all values between `1` and `10`, except for those that need
subtractive notation.

We also know we can handle `20` and `30`, but we’ll tackle the other numbers above `10` later.

Now, let’s tackle those tricky values that need subtractive notation. We’ll get to them in the next step.

[Go to Step 12](./Step_12.md)
