# Roman Numeral Kata Solution

## Step 5: Finding More Instances of a Pattern

At this point it should be obvious that we're not going to want to write a unit test for every number between 1 and
3,999 as defined by our feature specification. Let's review the description of our feature more closely:

```gherkin
Feature: Convert Arabic numerals to Roman numerals
  Arabic numerals must be positive integers between 1 and 3999
  Roman numerals must be represented using subtractive notation
  See: <https://en.wikipedia.org/wiki/Roman_numerals#Basic_decimal_pattern>
```

Notice that the feature specifies that our function must use the "subtractive notation" format. For example; it is
technically correct for the Arabic numeral `4` to be represented by the Roman numeral `IIII`. However, the
specification requires the number `4` to be represented using the "subtractive notation" as `IV`.

The number `4` does not follow the same pattern as the numbers between 1 and 3.

Let's see if we can find a range of numbers that do follow our established pattern. We could consider the number `5`,
which is represented by the Roman numeral `V`. However, this isn't a good candidate because it doesn't follow our
established pattern. The next number in sequence is `6` and is represented by the Roman numeral `VI`. Still not a great
candidate because we haven't yet established a pattern for handling a mix of different characters in our Roman numerals.

The numeric sequence of `[10, 20, 30]` does conform to our established pattern using the Roman numeral `X` in place of
`I`. This sequence in Roman numerals would be `[X, XX, XXX]`.

Let's start by adding a new scenario and unit test for the Arabic number `10`.

```gherkin
  Scenario: Convert 10 to "X"
    Given I have the arabic number 10
    When I convert to Roman
    Then I should see the string "X"
```

```swift
func testConvert10() {
    let roman = fmt.format(10)
    XCTAssertEqual(roman, "X")
}
```

This new test should fail with something similar to this:

```text
test failure: RomanFormatterTests.testConvert10() failed: XCTAssertEqual failed: ("IIIIIIIIII") is not equal to ("X")
```

Okay! Now we're starting to get some interesting test results. The Roman numeral for `10` should be `X` not 10 `I`s.

Since we haven't yet established the pattern for dealing with the sequence of `[10, 20, 30]`. Let's go back to our naïve
approach by using a conditional specific to the number `10` that will satisfy our failing test.

This should do the trick:

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
