# Roman Numeral Kata Solution

## Step 14: Handling More Edge Cases

For negative numbers, we want to reject any number less than or equal to 0. Since testing every negative number is
impossible, we’ll use -1 as a test case and ensure our implementation throws an error for values less than or equal to
`0`. We’ll also use 4000 to represent all values greater than `3,999`.

Let’s add these edge cases to our feature.

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

  Scenario: Throw error when given a negative number
    Given I have the arabic number -1
    When I convert to Roman
    Then I should see an error message explaining that any negative number is outside the range 1-3999

  Scenario: Throw error when given a number greater than 3999
    Given I have the arabic number 4000
    When I convert to Roman
    Then I should see an error message explaining that numbers above 3999 are outside the range 1-3999

  # --- Other Scenarios follow from here --- #
```

Add a test case for negative numbers:

```swift
@Test("expect a range error for negative numbers")
func convertNegative1ToRomanThrows() {
    #expect(throws: RomanError.numberOutOfRange) {
        try fmt.format(-1)
    }
}
```

We should see this test failure:

```text
convertNegative1ToRomanThrows(): Expectation failed: an error was expected but none was thrown and "" was returned:
try fmt.format(-1)
```

Let’s modify our `guard` statement slightly.

```swift
guard arabic >= 1 else {
    throw RomanError.numberOutOfRange
}
```

Let’s add our test for numbers greater than 3999.

```swift
@Test("expect a range error for numbers greater than 3999")
func convert4000ToRomanThrows() {
    #expect(throws: RomanError.numberOutOfRange) {
        try fmt.format(4000)
    }
}
```

We should see this test failure similar to this:

```text
convert4000ToRomanThrows(): Expectation failed: an error was expected but none was thrown and
"XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX..." was returned: try fmt.format(4000)
```

We add an upper bound condition to our `guard` statement to fix this.

```swift
guard arabic >= 1, arabic <= 3999 else {
    throw RomanError.numberOutOfRange
}
```

We’ve successfully transitioned back to the "Green" phase.

Next, we'll start another "Refactor" phase.

We will review our implementation, looking for any duplication or cleanup that may be needed.

We find a small duplication in the `arabic` number validation logic. The only difference is the value being checked:
`0` and `3999`.

```swift
guard arabic >= 1, arabic <= 3999 else {...}
```

To address this, we can use Swift’s `Range` type:

```swift
guard (1...3999).contains(arabic) else {
    throw RomanError.numberOutOfRange
}
```

This implementation removes duplication in the conditional checks, while improving code clarity.

We can verify our tests pass and remove test suite duplication.

These tests differ only in the number being tested:

```swift
@Test("expect a range error for 0")
func convert0ToRomanThrows() {
    #expect(throws: RomanError.numberOutOfRange) {
        try fmt.format(0)
    }
}

@Test("expect a range error for negative numbers")
func convertNegative1ToRomanThrows() {
    #expect(throws: RomanError.numberOutOfRange) {
        try fmt.format(-1)
    }
}

@Test("expect a range error for numbers greater than 3999")
func convert4000ToRomanThrows() {
    #expect(throws: RomanError.numberOutOfRange) {
        try fmt.format(4000)
    }
}
```

We can replace these tests with a single parameterized test:

```swift
@Test("expect a range error for numbers less than 1 or greater than 3999",
      arguments: [-1, 0, 4000])
func outOfRangeNumberThrowsError(arabic: Int) {
    #expect(throws: RomanError.numberOutOfRange) {
        try fmt.format(arabic)
    }
}
```

Now, we’ll put all our knowledge to the test and finish the function for all valid inputs.

## Notes

In statically typed languages like Swift, this suffices for testing invalid input values. However, this isn’t the case
for all languages.

For instance, in Python, we could pass values of non-integer types.

```python
fmt = RomanFormatter()
roman = fmt.format("foo")
```

This applies to JavaScript, Ruby, and other dynamically typed programming languages.

What if we tried writing a test for this in Swift?

```swift
@Test(#"expect an error to be thrown for "foo"#)
func convertSomeStringToRomanThrows() {
    #expect(throws: RomanError.numberOutOfRange) {
        try fmt.format("foo")
    }
}
```

We’d see this compiler error in the test case:

```text
Cannot convert value of type 'String' to expected argument type 'Int'
```

We can’t write a unit test for this variable type because it won’t compile.

This language feature eliminates the need to test for potential bugs that could exist in dynamically typed code.

Check out the `solution` branch to see examples in Node JS or Python for handling invalid data types.

[Go to Step 15](./Step_15.md)
