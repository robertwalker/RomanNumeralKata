# Roman Numeral Kata Solution

## Step 0: Starting from Red

There are three principals of Test Driven Development (TDD) that help us understand the basic discipline.

1. You are not allowed to write any production code unless it is to make a failing unit test pass.
2. You are not allowed to write any more of a unit test than is sufficient to fail; and compilation errors are
failures.
3. You are not allowed to write any more production code than is sufficient to pass the one failing unit test.

Solutions to this Kata are implemented in all languages mentioned in the [README](../README.md), but this document
focuses on the Swift solution.

### Gherkin Features

The starter kit provides the beginnings of a feature specification and can be found inside the `features` folder.

This demo will use a format called "Gherkin" which was originally created for the [Cucumber](https://cucumber.io), but
has been generalized for use in other Behavior Driven Development (BDD) style testing frameworks.

Here is our feature specification:

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

Read the feature's description carefully to understand the details of the code that we will be writing.

### Example Unit Test

This starter kit also provides a template for our test suite and the first unit test based on the scenario in the
feature specification.

```swift
import Testing
@testable import RomanKata

struct RomanFormatterTests {
    let fmt = RomanFormatter()
    
    @Test("expect roman to be I")
    func convert1() {
        let roman = fmt.format(1)
        #expect(roman == "I")
    }
}
```

### The Red, Green, Refactor Cycle

Upon opening the Swift package in Xcode, we should encounter a compile-time error within our test case. It is important
to note that compiler errors are also considered to be failing tests.

The error looks something like this:

```text
Cannot find 'RomanFormatter' in scope
```

This error makes sense give that we haven't created the `RomanFormatter` type yet, and Swift is a compiled language
hence the compile-time error.

We are now in the <span style="color: red;">Red</span> state of the TDD cycle.

This starter kit includes a sample implementation file for each supported programming language. Please note that the
sample code in the file is commented out.

```swift
//struct RomanFormatter {
//    func format(_ arabic: Int) -> String {
//        return ""
//    }
//}
```

Next we will work on getting to the <span style="color: green;">Green</span> state of the TDD cycle by adding an
implementation that will satisfy the first scenario of the feature specification.

[Go to Step 1](./Step_01.md)
