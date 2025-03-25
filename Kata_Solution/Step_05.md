# Roman Numeral Kata Solution

## Step 5: Finding More Instances of a Pattern

Writing a unit test for every number between 1 and 3,999 isn’t practical. Let’s review our feature description for a
better approach.

```gherkin
Feature: Convert Arabic numerals to Roman numerals
  Arabic numerals must be positive integers between 1 and 3999
  Roman numerals must be represented using subtractive notation
  See: <https://en.wikipedia.org/wiki/Roman_numerals#Basic_decimal_pattern>
```

Notice that the feature specifies that our function must use “subtractive notation” format. For example, `4` can be
represented as `IIII` in Arabic numerals, but the specification requires `4` to be represented as `IV` in
“subtractive notation”.

The number `4` does not follow the same pattern as the numbers between 1 and 3.

Let’s find a range of numbers that follow our pattern. The number `5` (`V`) doesn’t work because it doesn’t follow the
pattern. The next number is `6` (`VI`), but it doesn’t work either because it mixes different characters.

What is the next higher integer that would satisfy the pattern?

<details>

<summary>Reveal Solution</summary>

The sequence `[10, 20, 30]` follows our pattern where we use the Roman numeral `X` instead of `I`. In Roman numerals,
this sequence would be `[X, XX, XXX]`.

Let's start by adding a new scenario and unit test for the Arabic number `10`.

```gherkin
  Scenario: Convert 10 to "X"
    Given I have the arabic number 10
    When I convert to Roman
    Then I should see the string "X"
```

Include `10` (`"X"`) in the source data for our parameterized test:

```swift
@Test("expect roman to be equal in value to arabic", arguments:
        zip([1, 2, 3, 10], ["I", "II", "III", "X"])
)
func convertToRoman(arabic: Int, expectedRoman: String) {
    let roman = fmt.format(arabic)
    #expect(roman == expectedRoman)
}
```

This new test should fail with something similar to this:

```text
convertToRoman(arabic:expectedRoman:): Expectation failed: (roman → "IIIIIIIIII") == (expectedRoman → "X")
```

</details>

Okay! Now we’re beginning to see some intriguing test results. The Roman numeral for `10` should be `X`, not ten `I`s.

Since we haven’t yet determined the pattern for handling the sequence `[10, 20, 30]`. Let’s revert to our initial
approach by employing a conditional specific to the number `10` that will resolve our failing test.

<details>

<summary>Reveal Solution</summary>

### Here’s a solution that might work

```swift
func format(_ arabic: Int) -> String {
    var roman = ""
    
    if arabic == 10 {
        return "X"
    }
    for _ in 0..<arabic {
        roman += "I"
    }
    
    return roman
}
```

Congratulations! All tests should be passing again.

</details>

[Go to Step 6](./Step_06.md)
