# Roman Numeral Kata Solution

## Step 13: Handling Invalid Input

Let’s switch gears and test with invalid numbers before handling numbers above `10`.

Let’s review our feature specification again.

```gherkin
Feature: Convert Arabic numerals to Roman numerals
  Arabic numerals must be positive integers between 1 and 3999
  Roman numerals must be represented using subtractive notation
  See: <https://en.wikipedia.org/wiki/Roman_numerals#Basic_decimal_pattern>

  # --- Scenarios follow from here --- #
```

Numbers less than 1 or greater than 3999 are invalid. Roman numerals lack representation for 0 or negative numbers.
Expressing Roman numerals for 4000 or more is unsupported.

Let’s try to write a scenario for the Arabic number `0`.

```gherkin
Feature: Convert Arabic numerals to Roman numerals
  Arabic numerals must be positive integers between 1 and 3999
  Roman numerals must be represented using subtractive notation
  See: <https://en.wikipedia.org/wiki/Roman_numerals#Basic_decimal_pattern>

  Scenario: Convert 0 to "?"
    Given I have the arabic number 0
    When I convert to Roman
    Then I should see ???

  # --- Other Scenarios follow from here --- #
```

We have a problem: the feature specification lacks details about unsupported values.

As programmers, we shouldn’t define features; product domain experts should.

For this exercise, we’ll take on both roles, choosing from these options:

1. Return a value representing absence (e.g., null, None, Optional, Maybe, etc.)
2. Return the empty string (“”)
3. Throw an error or exception

Option 3 is the preferred choice to promote safe programming practices. It promptly detects and raises invalid input
errors, ensuring code integrity and reliability.

Let’s update the feature description with a scenario and test case.

```gherkin
Feature: Convert Arabic numerals to Roman numerals
  Arabic numerals must be positive integers between 1 and 3999
  Present an error message given any other values
  Roman numerals must be represented using subtractive notation
  See: <https://en.wikipedia.org/wiki/Roman_numerals#Basic_decimal_pattern>

  Scenario: Throw error when given 0
    Given I have the arabic number 0
    When I convert to Roman
    Then I should see an error message explaining that 0 is outside the range 1-3999

  # --- Other Scenarios follow from here --- #
```

This time, we can’t just add a `0` to our test data. Instead, we expect an error to be thrown, so we need a new test
case.

Here’s what our test suite looks like with the new test added:

```swift
struct RomanFormatterTests {
    let fmt = RomanFormatter()
    
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
    
    @Test("expect a range error for 0")
    func convert0ToRomanThrows() {
        #expect(throws: RomanError.numberOutOfRange) {
            fmt.format(0)
        }
    }
}
```

Adding this new test results in the following compile-time error:

```text
Cannot find 'RomanError' in scope
```

This makes sense because we haven’t yet created the `RomanError`.

So let's create one in our code under test:

```swift
enum RomanError: Error {
    case numberOutOfRange
}
```

Rerun the tests. The new test should fail with an error similar to this:

```text
Expectation failed: an error was expected but none was thrown and "I" was returned: try fmt.format(0)
```

Awesome! We’re back to red with one failing test. Let’s add some logic that throws an error when given `0`.

To try to make this test pass, we’ll add a guard statement that throws our new `RomanError.numberOutOfRange` error.

Our code should now look something like this:

```swift
enum RomanError: Error {
    case numberOutOfRange
}

struct RomanFormatter {
    func format(_ number: Int) -> String {
        var arabic = number
        var roman = ""
        
        guard arabic != 0 else {
            throw RomanError.numberOutOfRange
        }

        let arabicNumerals = [10, 9, 5, 4, 1]
        let romanNumerals = ["X", "IX", "V", "IV", "I"]
        for index in 0..<arabicNumerals.count {
            while arabic >= arabicNumerals[index] {
                roman += romanNumerals[index]
                arabic -= arabicNumerals[index]
            }
        }
        
        return roman
    }
}
```

Let’s take a quick detour into Swift language specifics. The code above will actually trigger a compile-time error.

```text
Error is not handled because the enclosing function is not declared 'throws'
```

In Swift, functions are classified into two types: throwing and non-throwing.

We’ve declared a non-throwing function, which isn’t allowed to throw. To convert it to a throwing function, we add
`throws` after the argument list and just before the return arrow.

```swift
func format(_ number: Int) throws -> String {...}
```

Okay, the compiler error is resolved, but we’re getting another one in our original parameterized test.

Here’s the error:

```text
Call can throw, but it is not marked with 'try' and the error is not handled
```

Swift requires the calling function to handle errors or explicitly propagate them to the caller. This involves preceding
a throwing function call with the `try` keyword.

To propagate thrown errors to the Swift Testing framework, add `throws` after the argument list for our failing test.

```swift
@Test("expect roman to be equal in value to arabic", arguments:
        zip(
            [1, 2, 3, 4, 5, 6, 8, 9, 10, 20, 30],
            ["I", "II", "III", "IV", "V", "VI", "VIII", "IX", "X", "XX", "XXX"]
        )
)
func convertToRoman(arabic: Int, expectedRoman: String) throws {
    let roman = try fmt.format(arabic)
    #expect(roman == expectedRoman)
}
```

Running the tests reveals another compile-time error in our test for `0` occurring within the `#expect` block:

```text
Call can throw, but it is not marked with 'try' and the error is not handled
```

Let’s fix our test for `0` by adding `try` to the function call:

```swift
@Test("expect a range error for 0")
func convert0ToRomanThrows() {
    #expect(throws: RomanError.numberOutOfRange) {
        try fmt.format(0)
    }
}
```

In this case we don't need to add `throws` to our test function because `#expect` handles the error.

Awesome! Now that we’ve fixed the compilation and testing issues, our code should pass both tests.

Next, we need to address the remaining edge cases, like negative numbers and values greater than 4000.

[Go to Step 14](./Step_14.md)
