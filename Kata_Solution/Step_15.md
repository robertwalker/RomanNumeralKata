# Roman Numeral Kata Solution

## Step 15: Completing the Kata

So far we have discoverd these three patterns:

1. Some digits repeat up to 3 times
2. Some digits never repeat
3. Some numbers are represented using "subtractive notation"

Recall this list of Roman numeral digits:

```text
I: 1
V: 5
X: 10
L: 50
C: 100
D: 500
M: 1000
```

The "repeating" pattern applies to  `I`, `X`, `C` and `M`:

`III = 3`
`XXX = 30`
`CCC = 300`
`MMM = 3000`

The "never repeating" pattern applies to `V`, `L` and `D`:

`V = 5`
`L = 50`
`D = 500`

The "subtractive notation" pattern applies as follows:

* `4 = IV` (1 less than `V`)
* `9 = IX` (1 less than `X`)
* `40 = XL` (10 less than `L`)
* `90 = XC` (10 less than `C`)
* `400 = CD` (100 less than `D`)
* `900 = CM` (100 less than `M`)

Add scenarios for the above to our feature.

```gherkin
Feature: Convert Arabic numerals to Roman numerals
  Arabic numerals must be positive integers between 1 and 3999
  Present an error message given any other values
  Roman numerals must be represented using subtractive notation
  See: <https://en.wikipedia.org/wiki/Roman_numerals#Basic_decimal_pattern>

  # --- Other scenarios --- #

  Scenario: Convert 40 to "XL"
    Given I have the arabic number 40
    When I convert to Roman
    Then I should see the string "XL"

  Scenario: Convert 50 to "L"
    Given I have the arabic number 50
    When I convert to Roman
    Then I should see the string "L"

  Scenario: Convert 90 to "XC"
    Given I have the arabic number 90
    When I convert to Roman
    Then I should see the string "XC"

  Scenario: Convert 100 to "C"
    Given I have the arabic number 100
    When I convert to Roman
    Then I should see the string "C"

  Scenario: Convert 300 to "CCC"
    Given I have the arabic number 300
    When I convert to Roman
    Then I should see the string "CCC"

  Scenario: Convert 400 to "CD"
    Given I have the arabic number 400
    When I convert to Roman
    Then I should see the string "CD"

  Scenario: Convert 500 to "D"
    Given I have the arabic number 500
    When I convert to Roman
    Then I should see the string "D"

  Scenario: Convert 900 to "CM"
    Given I have the arabic number 900
    When I convert to Roman
    Then I should see the string "CM"

  Scenario: Convert 1000 to "M"
    Given I have the arabic number 1000
    When I convert to Roman
    Then I should see the string "M"

  Scenario: Convert 3000 to "MMM"
    Given I have the arabic number 3000
    When I convert to Roman
    Then I should see the string "MMM"
```

Will our current design hold up against numbers `10` and above?

Let's find out by applying our three expected patterns starting with repeating digits.

The number (`100`, `C`) is the next one that conforms to the repeating digits pattern. Same applies to (`200`, `CC`)
and (`300`, `CCC`)

Let's add `100` to represent the lower bounds of that pattern to our parameterized test:

```swift
@Test("expect roman to be equal in value to arabic", arguments:
        zip(
            [1, 2, 3, 4, 5, 6, 8, 9, 10, 20, 30, 100],
            ["I", "II", "III", "IV", "V", "VI", "VIII", "IX", "X", "XX", "XXX", "C"]
        )
)
func convertToRoman(arabic: Int, expectedRoman: String) throws {
    let roman = try fmt.format(arabic)
    #expect(roman == expectedRoman)
}
```

We should see an error something like:

```text
convertToRoman(arabic:expectedRoman:): Expectation failed: (roman → "XXXXXXXXXX") == (expectedRoman → "C")
```

Let’s add `100` and `C` to our numeral arrays to fix that.

```swift
let arabicNumerals = [100, 10, 9, 5, 4, 1]
let romanNumerals = ["C", "X", "IX", "V", "IV", "I"]
```

Alright, let’s run the tests again.

Awesome! That means we’re back to <span style="color: green;">Green</span>.

Next we'll add `300` to represent the upper bounds of the repeating pattern:

```swift
@Test("expect roman to be equal in value to arabic", arguments:
        zip(
            [1, 2, 3, 4, 5, 6, 8, 9, 10, 20, 30, 100, 300],
            ["I", "II", "III", "IV", "V", "VI", "VIII", "IX", "X", "XX", "XXX", "C", "CCC"]
        )
)
func convertToRoman(arabic: Int, expectedRoman: String) throws {
    let roman = try fmt.format(arabic)
    #expect(roman == expectedRoman)
}
```

Alright, let’s run the tests again. We should still be <span style="color: green;">Green</span>.

Now, let’s focus on the ‘never repeating’ pattern for ‘L’ representing `50`:

```swift
@Test("expect roman to be equal in value to arabic", arguments:
        zip(
            [1, 2, 3, 4, 5, 6, 8, 9, 10, 20, 30, 50, 100, 300],
            ["I", "II", "III", "IV", "V", "VI", "VIII", "IX", "X", "XX", "XXX", "L", "C", "CCC"]
        )
)
func convertToRoman(arabic: Int, expectedRoman: String) throws {
    let roman = try fmt.format(arabic)
    #expect(roman == expectedRoman)
}
```

We should see an error similar to this:

```text
convertToRoman(arabic:expectedRoman:): Expectation failed: (roman → "XXXXX") == (expectedRoman → "L")
```

Let’s add `50` and `L` to our numeral arrays to fix that:

```swift
let arabicNumerals = [100, 50, 10, 9, 5, 4, 1]
let romanNumerals = ["C", "L", "X", "IX", "V", "IV", "I"]
```

Awesome! We’re back to <span style="color: green;">Green</span>.

Now, let’s tackle the subtractive notation pattern for ’40’:

```swift
@Test("expect roman to be equal in value to arabic", arguments:
        zip(
            [1, 2, 3, 4, 5, 6, 8, 9, 10, 20, 30, 40, 50, 100, 300],
            ["I", "II", "III", "IV", "V", "VI", "VIII", "IX", "X", "XX", "XXX", "XL", "L", "C", "CCC"]
        )
)
func convertToRoman(arabic: Int, expectedRoman: String) throws {
    let roman = try fmt.format(arabic)
    #expect(roman == expectedRoman)
}
```

We should see an error similar to this:

```text
convertToRoman(arabic:expectedRoman:): Expectation failed: (roman → "XXXX") == (expectedRoman → "XL")
```

Let’s add `40` and `XL` to our numeral arrays to fix that.

```swift
let arabicNumerals = [100, 50, 40, 10, 9, 5, 4, 1]
let romanNumerals = ["C", "L", "XL", "X", "IX", "V", "IV", "I"]
```

And for `90`:

```swift
@Test("expect roman to be equal in value to arabic", arguments:
        zip(
            [1, 2, 3, 4, 5, 6, 8, 9, 10, 20, 30, 40, 50, 90, 100, 300],
            ["I", "II", "III", "IV", "V", "VI", "VIII", "IX", "X", "XX", "XXX", "XL", "L", "XC", "C", "CCC"]
        )
)
func convertToRoman(arabic: Int, expectedRoman: String) throws {
    let roman = try fmt.format(arabic)
    #expect(roman == expectedRoman)
}
```

```text
convertToRoman(arabic:expectedRoman:): Expectation failed: (roman → "LXL") == (expectedRoman → "XC")
```

Let’s add `90` and `XC` to our numeral arrays to fix that.

```swift
let arabicNumerals = [100, 90, 50, 40, 10, 9, 5, 4, 1]
let romanNumerals = ["C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
```

Awesome! Our design is looking great!

Let’s wrap this up by applying the same patterns to the remaining numbers between `301` and `3999`.

```swift
@Test("expect roman to be equal in value to arabic", arguments:
        zip(
            [1, 2, 3, 4, 5, 6, 8, 9, 10, 20, 30, 40, 50,
              90, 100, 300, 400, 500, 900, 1000, 3000],
            ["I", "II", "III", "IV", "V", "VI", "VIII", "IX", "X", "XX", "XXX", "XL", "L",
              "XC", "C", "CCC", "CD", "D", "CM", "M", "MMM"]
        )
)
func convertToRoman(arabic: Int, expectedRoman: String) throws {
    let roman = try fmt.format(arabic)
    #expect(roman == expectedRoman)
}
```

```swift
let arabicNumerals = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
let romanNumerals = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
```

Congratulation! This completes the Roman Numeral Kata.

Here's our complete test suite:

```swift
import Testing
@testable import RomanKata

struct RomanFormatterTests {
    let fmt = RomanFormatter()
    
    @Test("expect roman to be equal in value to arabic", arguments:
            zip(
                [1, 2, 3, 4, 5, 6, 8, 9, 10, 20, 30, 40, 50,
                 90, 100, 300, 400, 500, 900, 1000, 3000],
                ["I", "II", "III", "IV", "V", "VI", "VIII", "IX", "X", "XX", "XXX", "XL", "L",
                 "XC", "C", "CCC", "CD", "D", "CM", "M", "MMM"]
            )
    )
    func convertToRoman(arabic: Int, expectedRoman: String) throws {
        let roman = try fmt.format(arabic)
        #expect(roman == expectedRoman)
    }
    
    @Test("expect a range error for numbers less than 1 or greater than 3999",
          arguments: [-1, 0, 4000])
    func outOfRangeNumberThrowsError(arabic: Int) {
        #expect(throws: RomanError.numberOutOfRange) {
            try fmt.format(arabic)
        }
    }
}
```

And, here's our fully working solution:

```swift
enum RomanError: Error {
    case numberOutOfRange
}

struct RomanFormatter {
    func format(_ number: Int) throws -> String {
        var arabic = number
        var roman = ""
        
        guard (1...3999).contains(arabic) else {
            throw RomanError.numberOutOfRange
        }

        let arabicNumerals = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
        let romanNumerals = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
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

Your homework is to try to find any additional edge cases that we might have missed with the existing test suite. For
example try some other edge cases like `3999` or `99` and any other numbers you might find interesting to test.

## One More Thing

I tried to keep this demo from using additional language specific features. For example Swift and Python both support a
language feature called Tuples.

We'll explore using tuples in the next and final step

[Go to Step 16](./Step_16.md)
