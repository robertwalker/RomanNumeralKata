# Roman Numeral Kata Solution

## Step 1: Getting to Green

First let's review the three laws of Test Driven Development (TDD).

1. You are not allowed to write any production code unless it is to make a failing unit test pass.
2. You are not allowed to write any more of a unit test than is sufficient to fail; and compilation failures are
failures.
3. You are not allowed to write any more production code than is sufficient to pass the one failing unit test.

Note: Solutions to this Kata are implemented in all supported languages, however this document will focus on the Swift
solution.

After opening the Swift package in Xcode we should be presented with a compile time error inside out test case.
Remember that compiler errors are also considered to be failing test.

The error looks something like this:

```text
Cannot find 'RomanFormatter' in scope
```

This starter kit includes a sample implementation file for each supported programming language. Notice the sample code
in the file is commented out.

```swift
//struct RomanFormatter {
//    func format(_ arabic: Int) -> String {
//        return ""
//    }
//}
```

Let's fix that by removing the comment (`//`) markers from all the lines.

Tip: In Xcode (and most code editors) pressing `command-/` will toggle comments on any selected lines.

You should end up with something like this:

```swift
struct RomanFormatter {
    func format(_ arabic: Int) -> String {
        return ""
    }
}
```

Next we need to run the tests to check our progress.

```text
failure: RomanFormatterTests.testConvert1() failed: XCTAssertEqual failed: ("") is not equal to ("I")
```

Great! We have resolved the compile time error, and our test is executing.

The test is still failing, but now it is failing for the right reason. We haven't yet implemented the expected behavior.

The starter kit provides the beginnings of a feature specification and can be found inside the `features` directory.

It should like like this:

```gherkin
Feature: Convert Arabic numerals to Roman numerals
  Arabic numerals must be positive integers between 1 and 3999
  Roman numerals must be represented using subtractive notation
  See: <https://en.wikipedia.org/wiki/Roman_numerals#Basic_decimal_pattern>

  Scenario: Convert 1 to "I"
    Given I have the arabic number 1
    When I convert to Roman
    Then I should see the string "I"
```

This specification provides an overview of the `RomanFormatter` and defines our first test scenario.

Thinking back on the three laws of TDD; what would be the simplest implementation that would make our test pass?

This should do the trick:

```swift
struct RomanFormatter {
    func format(_ arabic: Int) -> String {
        return "I"
    }
}
```

Is this our final solution to convert Arabic numerals to Roman numerals? Of course not. However, the implementation does
satisfy the three laws of TDD:

* We started with a failing unit test.
* The test doesn't make any assumption beyond what the scenario specifies.
* The implementation doesn't do any more than necessary to pass the one failing test, and there's nothing to refactor
or clean up.

Congratulations! We have completed our first Red-Green-Refactor cycle.
