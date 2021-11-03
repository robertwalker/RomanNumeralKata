# Roman Numeral Kata Solution

## Step 2: Adding Some Basic Logic

In Step 1 we successfully got our first test scenario passing. However, it's not very useful to have a function that
returns a constant value for all inputs.

Let's add some basic logic to our function by first adding another scenario to our feature. We'll start by adding
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

Next we will create a new unit unit test for this second scenario and run it.

```swift
func testConvert2() {
    let roman = fmt.format(2)
    XCTAssertEqual(roman, "II")
}
```

```text
test failure: RomanFormatterTests.testConvert2() failed: XCTAssertEqual failed: ("I") is not equal to ("II")
```

Great! We're back to one (and only one) failing test, bringing us back to the **red** state of the TDD cycle.

Let's implement just enough logic to get both tests passing. What would that look like?

This should work:

```swift
func format(_ arabic: Int) -> String {
    if arabic == 2 {
        return "II"
    }
    return "I"
}
```

Congratulations! All tests are passing again. We are back to **Green**.

To complete the Red-Green-Refactor cycle we should look for any "cleanup" work that we need to do before moving to the
next step.

We are now ready to begin the **refactor** state of the TDD cycle.

Here are some of the things to look for:

* Code duplication
* Commented out code
* Code style or formatting issues

In this case there isn't anything we need to change.
