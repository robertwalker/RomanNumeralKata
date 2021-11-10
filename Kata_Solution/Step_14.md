# Roman Numeral Kata Solution

## Step 14: Completing the Kata

So far we have discoverd a few different patterns:

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

Will our current design hold up against numbers beyond 10?

Let's find out by applying our three expected patterns starting with the first one.

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

  Scenario: Convert 3000 to "MMM"
    Given I have the arabic number 3000
    When I convert to Roman
    Then I should see the string "MMM"
```

Then start adding unit tests for each of the new scenarios. Let's start with `300`:

```swift
func testConvert300() throws {
    let roman = try fmt.format(300)
    XCTAssertEqual(roman, "CCC")
}
```

We should see an error something like:

```text
test failure: RomanFormatterTests.testConvert300() failed:
XCTAssertEqual failed: ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX") is not equal to ("CCC")
```

That's definitely not what we want to see, so let's fix that by adding `100` as `C` to our arrays:

```swift
let arabicNumerals = [100, 10, 9, 5, 4, 1]
let romanNumerals = ["C", "X", "IX", "V", "IV", "I"]
```

And we'll run the tests again.

Great! That gets us back to **green** again.

Let's next take care of the "never repeating" pattern for `L` representing (`50`):

```swift
func testConvert50() throws {
    let roman = try fmt.format(50)
    XCTAssertEqual(roman, "L")
}
```

```text
test failure: RomanFormatterTests.testConvert50() failed: XCTAssertEqual failed: ("XXXXX") is not equal to ("L")
```

```swift
let arabicNumerals = [100, 50, 10, 9, 5, 4, 1]
let romanNumerals = ["C", "L", "X", "IX", "V", "IV", "I"]
```

Great! We should be back to **green** again.

Next we'll take care of the "subtractive notation" pattern for `40` and `90`:

```swift
func testConvert40() throws {
    let roman = try fmt.format(40)
    XCTAssertEqual(roman, "XL")
}
```

```text
test failure: RomanFormatterTests.testConvert40() failed: XCTAssertEqual failed: ("XXXX") is not equal to ("XL")
```

```swift
let arabicNumerals = [100, 50, 40, 10, 9, 5, 4, 1]
let romanNumerals = ["C", "L", "XL", "X", "IX", "V", "IV", "I"]
```

```swift
func testConvert90() throws {
    let roman = try fmt.format(90)
    XCTAssertEqual(roman, "XC")
}
```

```text
test failure: RomanFormatterTests.testConvert90() failed: XCTAssertEqual failed: ("LXXXX") is not equal to ("XC")
```

```swift
let arabicNumerals = [100, 90, 50, 40, 10, 9, 5, 4, 1]
let romanNumerals = ["C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
```

Great! It looks like our design is holding up nicely!

Let's finish this out by applying the same patterns to the remaining numbers between 301 and 3999:

```swift
func testConvert400() throws {
    let roman = try fmt.format(400)
    XCTAssertEqual(roman, "CD")
}

func testConvert500() throws {
    let roman = try fmt.format(500)
    XCTAssertEqual(roman, "D")
}

func testConvert900() throws {
    let roman = try fmt.format(900)
    XCTAssertEqual(roman, "CM")
}

func testConvert3000() throws {
    let roman = try fmt.format(3000)
    XCTAssertEqual(roman, "MMM")
}
```

```swift
let arabicNumerals = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
let romanNumerals = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
```

Congratulation! This completes the Roman Numeral Kata.

Here's our final solution:

```swift
enum NumericRangeError: Error {
    case numberOutOfBounds
}

struct RomanFormatter {
    func format(_ number: Int) throws -> String {
        var arabic = number
        var roman = ""
        
        guard (1...3999).contains(arabic) else {
            throw NumericRangeError.numberOutOfBounds
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
