# Roman Numeral Kata Solution

## Step 3: String Concatenation

At this point you are probably starting think that this is a silly approach. Why don't we just start writing a "real"
solution to this problem?

It's natural to think that, but bear with it just a bit longer. We are using this exercise to search for patterns that
will help us discover the solution, without overthinking the problem too early in development.

With that said, let's take this one step further by adding a scenario and test case for the Arabic numeral 3:

```gherkin
Feature: Convert Arabic numerals to Roman numerals
  Arabic numerals must be positive integers between 1 and 3999
  Roman numerals must be represented using subtractive notation
  See: <https://en.wikipedia.org/wiki/Roman_numerals#Basic_decimal_pattern>

  Scenario: Convert 1 to "I"
    Given I have the arabic number 1
    When I convert to Roman
    Then I should see the string "I"

  Scenario: Convert 2 to "II"
    Given I have the arabic number 2
    When I convert to Roman
    Then I should see the string "II"

  # --- Here is our new scenario for the Arabic numeral 3 --- #
  Scenario: Convert 3 to "III"
    Given I have the arabic number 3
    When I convert to Roman
    Then I should see the string "III"
  # --------------------------------------------------------- #
```

```swift
func testConvert3() {
    let roman = fmt.format(3)
    XCTAssertEqual(roman, "III")
}
```

Let's run all three tests again and make sure the first two still pass, but this new one fails.

We should see a failure that looks something like this:

```text
test failure: RomanFormatterTests.testConvert3() failed: XCTAssertEqual failed: ("I") is not equal to ("III")
```

Again let's update the implementation to get all three tests passing using the naïve approach we've used so far.

```swift
func format(_ arabic: Int) -> String {
    if arabic == 3 {
        return "III"
    }
    if arabic == 2 {
        return "II"
    }
    return "I"
}
```

Great! This gets us back to **green** again!

At this point a clear pattern is starting to emerge. As the arabic numbers in the range 1 to 3 increment, we are
appending the character "I" to the returned string.

We will begin our "refactor" phase of the TDD cycle by making this string concatenation more obvious.

```swift
func format(_ arabic: Int) -> String {
    if arabic == 3 {
        return "I" + "I" + "I"
    }
    if arabic == 2 {
        return "I" + "I"
    }
    return "I"
}
```

Rerun all unit tests again to confirm we are still **green**.

Congratulations! We now have a clear expression of one of the fundamental patterns for this algorithm.
