# Roman Numeral Kata Solution

## Step 13: Handling Invalid Input

So far we have been testing only valid input values. Before we move on to handling numbers above 10 let's switch gears
and take a look at testing with some invalid numbers.

Let's again review our feature specification:

```gherkin
Feature: Convert Arabic numerals to Roman numerals
  Arabic numerals must be positive integers between 1 and 3999
  Roman numerals must be represented using subtractive notation
  See: <https://en.wikipedia.org/wiki/Roman_numerals#Basic_decimal_pattern>

  # --- Scenarios follow from here --- #
```

We know from this that numbers less than 1 or greater than 3999 are considered invalid. Roman numerals have no
representation of the Arabic number `0` nor any negative numbers. There are ways to express Roman numerals of `4000` or
greater, but that is expressly unsupported by this feature.

What this feature specification doesn't tell us is what to do with these invalid input values.

Let's first try to write a scenario for the Arabic number `0`:

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

We have a problem. The feature specification doesn't explain what to expect when given a value outside of the supported
range.

As a programmer, it should not be our responsibility to define features. Those should normally be provided by product
domain experts.

For this exercise we will take on the role of both programmer and domain expert. We will make the executive decision
choosing from a few different options:

1. Return a value representing the absence of a value (e.g. null, None, Optional, Maybe, etc.)
2. Return the empty string ("")
3. Throw an error or exception

Either of these options are valid solutions. However, in order to promote safe programming techniques; I have decided on
option 3. Throw an error when given any invalid input.

Let's update our feature description, then add our scenario and test case:

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

```swift
func testConvert0() {
    XCTAssertThrowsError(fmt.format(0))
}
```

This test should fail with an error that looks something like this:

```text
test failure: RomanFormatterTests.testConvert0() failed: XCTAssertThrowsError failed: did not throw an error
```

Okay, great! We're back to **red** with one failing test. Let's add some logic that throws an error when given `0`:

In Swift we first need to define an error that we can throw. That would look something like this:

```swift
enum NumericRangeError: Error {
    case inputOutOfBounds
}
```

Next we'll add a guard statement that throws our new error message.

Our code should now look something like this:

```swift
enum NumericRangeError: Error {
    case inputOutOfBounds
}

struct RomanFormatter {
    func format(_ number: Int) -> String {
        var arabic = number
        var roman = ""
        
        guard arabic != 0 else {
            throw NumericRangeError.inputOutOfBounds
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

We need to take a short, language specific, detour here. The above code will actually generate a compile-time error:

```text
Error is not handled because the enclosing function is not declared 'throws'
```

In Swift there are these two distinct types of functions:

1. Throwing functions
2. Non-throwing functions

We have declared a non-throwing function. Non-throwing functions are guaranteed not to throw, hence the name.

We need to update our function signature by changing it to a throwing function. We do this by adding `throws` just after
the argument list like this:

```swift
func format(_ number: Int) throws -> String {...}
```

Okay, that cleared up our compiler error, but now we're getting a bunch of new compiler errors inside our test suite
that look something like this:

```text
Call can throw, but it is not marked with 'try' and the error is not handled
```

Unlike most other languages that can throw errors or exceptions, Swift requires the calling function to either handle
the error, or explicitly propagate the error to the caller. This also requires preceding the call to a throwing function
with the `try` keyword.

Let's fix our test for `0` by adding the `try` keyword like this:

```swift
func testConvert0() {
    XCTAssertThrowsError(try fmt.format(0))
}
```

For our other tests we just want to propagate any thrown errors to the caller of the test functions, which is the
XCTest framework itself. We also must precede the calls to our `format()` function with the `try` keyword.

We'll do this for all our remaining test case functions. They should now look like the following example:

```swift
func testConvert1() throws {
    let roman = try fmt.format(1)
    XCTAssertEqual(roman, "I")
}
```

Okay Great! We should now be able to compile our code and run all of the tests again. They should all pass now.

Next we need to take care of the other known edge cases, such as negative numbers and numbers 4000 or greater.

In the case of negative numbers we actually just want to reject any numbers less than or equal to `0`. Since it's
impossible to test every negative number let's just write a test using `-1` and make sure our implementation will throw
for any value less than, or equal to `0`. We will also use `4000` to represent all values greater than 3,999.

Let's add these edge cases to our feature to reflect this expected behavior:

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

Then add our test case for negative numbers:

```swift
func testConvertNegativeNumbers() {
    XCTAssertThrowsError(try fmt.format(-1))
}
```

We should see this test failure:

```text
test failure: RomanFormatterTests.testConvertNegativeNumbers()
failed: XCTAssertThrowsError failed: did not throw an error
```

Let's fix this with a small modification to our `guard` statement:

```swift
guard arabic >= 1 else {
    throw NumericRangeError.numberOutOfBounds
}
```

Now let's add our test for numbers greater than `3999`:

```swift
func testConvertNumbersGreaterThan3999() {
    XCTAssertThrowsError(try fmt.format(4000))
}
```

We should see this test failure is back again:

```text
test failure: RomanFormatterTests.testConvertNumbersGreaterThan3999()
failed: XCTAssertThrowsError failed: did not throw an error
```

Again we modify our `guard` statement to fix this:

```swift
guard arabic >= 1, arabic <= 3999 else {
    throw NumericRangeError.numberOutOfBounds
}
```

Great! We're back to **green** again.

Now that we're back to our refactor phase, we ask ourselves if there is there anything we can improve about this
implementation?

Looking closely we can see that there is a bit of duplication where we are having to perform two separate checks of the
`arabic` number where the only difference is the value being checked (`0` and `4000`).

We can improve this using Swift's `Range` type. Here's what that would look like:

```swift
guard (1...3999).contains(arabic) else {
    throw NumericRangeError.numberOutOfBounds
}
```

This implementation removes the duplicate conditional checks, while also improving the code's clarity.

We can now run all of our tests to verify that they still pass.

### Notes

When using the Swift language (or other statically typed languages) this is all the testing we need for invalid input
values. However, this is not the case for all programming languages.

For example in Python we could potentially pass in values that are not of an integer type:

```python
fmt = RomanFormatter()
roman = fmt.format("foo")
```

This holds true for Javascript, Ruby and any other dynamically typed programming language.

So what would happen if we did try to write a test for this in Swift?

```swift
func testConvertSomeString() {
    XCTAssertThrowsError(try fmt.format("foo"))
}
```

We would see this compiler error in the test case?

```text
Cannot convert value of type 'String' to expected argument type 'Int'
```

We actually can't even write the unit test that would check the variable type since the test itself will not compile.

This language feature eliminates entire categories of potential bugs that may exist in dynamically typed programming
languages. For examples of how to deal with this in dynamically typed language see the solution for any of the affected
languages.
