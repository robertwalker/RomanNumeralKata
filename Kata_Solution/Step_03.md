# Roman Numeral Kata Solution

## Step 3: String Concatenation

You might be thinking this approach is silly. Why don’t we write a "real" solution?

It's natural to think that, but bear with it just a bit longer. We are using this exercise to search for patterns that
will help us discover the solution, without overthinking the problem too early in development.

Alright, let’s take this to the next level! How about we add a scenario and test case for the Arabic numeral 3?

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
@Test("expect roman to be III")
func convert3() {
    let roman = fmt.format(3)
    #expect(roman == "III")
}
```

Let’s rerun all three tests and ensure the first two pass, but the new one fails.

We should see a failure resembling this:

```text
convert3(): Expectation failed: (roman → "I") == "III"
```

Let’s update the implementation to make all three tests pass using our current approach.

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

Awesome! This gets us back to the "Green" phase.

Can you find a pattern in the above code?

<details>

<summary>Reveal Solution</summary>

### Did you find this one?

A pattern emerges: As the Arabic number increments, we append “I” to the Roman numeral string.

As we begin the "Refactor" phase of our TDD cycle, we can predict the final solution will involve string concatenation
of some sort.

Let’s make that more obvious in our code before we move to the next step.

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

Let’s give the unit tests another spin to make sure we’re still in the "Green" phase.

Congratulations! We now have a clear example of a fundamental pattern for this algorithm.

</details>

[Go to Step 4](./Step_04.md)
