# Roman Numeral Kata Solution

## Step 2: Adding Some Basic Logic

In Step 1, we successfully passed our first test scenario. However, a function that returns a constant value for all
inputs isn’t very useful.

Let’s add some basic logic to our function by first adding another scenario to our feature. We’ll start by adding
support for two different input values (1 and 2). This will force us to add some basic logic to our function.

First add the scenario to our feature specification:

```gherkin
Feature: Convert Arabic numerals to Roman numerals
  Arabic numerals must be positive integers between 1 and 3999
  Roman numerals must be represented using subtractive notation
  See: <https://en.wikipedia.org/wiki/Roman_numerals#Basic_decimal_pattern>

  Scenario: Convert 1 to "I"
    Given I have the arabic number 1
    When I convert to Roman
    Then I should see the string "I"

  # --- Here is our new scenario for the Arabic numeral 2 --- #
  Scenario: Convert 2 to "II"
    Given I have the arabic number 2
    When I convert to Roman
    Then I should see the string "II"
  # --------------------------------------------------------- #
```

We’ll create a new unit test for the second scenario and run it.

```swift
@Test("expect roman to be I")
func convert2() {
    let roman = fmt.format(2)
    #expect(roman == "II")
}
```

```text
convert2(): Expectation failed: (roman → "I") == "II"
```

Awesome! We’re back to one failing test, which means we’re back in the <span style="color: red;">Red</span> state of the
TDD cycle.

Let’s implement just enough logic to pass both tests. What would that look like?

<details>

<summary>Reveal Solution</summary>

### This should work

```swift
func format(_ arabic: Int) -> String {
    if arabic == 2 {
        return "II"
    }
    return "I"
}
```

</details>

Congratulations! All tests are passing. We are back to <span style="color: green;">Green</span>.

We are now ready to begin the <span style="color: #a8a800;">Refactor</span> state of the TDD cycle.

Here are some of the things to look for:

* Code duplication
* Commented out code
* Code style or formatting issues

None of these apply to our solution in this cycle

[Go to Step 3](./Step_03.md)
