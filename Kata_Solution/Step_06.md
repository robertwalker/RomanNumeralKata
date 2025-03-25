# Roman Numeral Kata Solution

## Step 6: An Emerging Pattern

It’s time to put those brain cells to work! The pattern for the sequence `[10, 20, 30]` is a bit different from the
established pattern for `[1, 2, 3]`, so we need a different approach.

Let’s start by adding a new scenario and testing for the `arabic` numeral `20`.

```gherkin
  Scenario: Convert 20 to "XX"
    Given I have the arabic number 20
    When I convert to Roman
    Then I should see the string "XX"
```

Include `20` (`"XX"`) in the source data for our parameterized test:

```swift
@Test("expect roman to be equal in value to arabic", arguments:
        zip([1, 2, 3, 10, 20], ["I", "II", "III", "X", "XX"])
)
func convertToRoman(arabic: Int, expectedRoman: String) {
    let roman = fmt.format(arabic)
    #expect(roman == expectedRoman)
}
```

This test should fail with an error like:

```text
convertToRoman(arabic:expectedRoman:): Expectation failed: (roman → "IIIIIIIIIIIIIIIIIIII") == (expectedRoman → "XX")
```

We could go through the whole process we used to find the original pattern, but we should now have enough knowledge to
skip ahead a bit. Any thoughts on how you would approach this?

Let’s start with this:

```swift
func format(_ arabic: Int) -> String {
    var roman = ""
    
    if arabic == 20 {
        return "X" + "X"
    }
    if arabic == 10 {
        return "X"
    }
    for _ in 0..<arabic {
        roman += "I"
    }
    
    return roman
}
```

So, we’re back to <span style="color: green;">green</span>, but it looks a lot like our original pattern.

The sequence `[10, 20, 30]` is similar to `[1, 2, 3]`, but on the 10’s column. How can we use that knowledge?

We could use a `for` loop with an increment of 10, but we can’t use a `range` of `Int` values like `[1, 2, 3]` because
it includes all integers in the range.

Alternatively, we can replace the `for` loop with a `while` loop and control the indexing manually.

<details>

<summary>Reveal Solution</summary>

### Here’s what that would look like

```swift
func format(_ number: Int) -> String {
    var arabic = number
    var roman = ""
    
    while arabic >= 10 {
        roman += "X"
        arabic -= 10
    }
    for _ in 0..<arabic {
        roman += "I"
    }
    
    return roman
}
```

When we pass the Arabic number `20` into the `while` loop, it executes the following steps:

1. The `arabic` variable holds `20`.
2. The `roman` variable is initialized to `X`.
3. `arabic` is decremented by `10` and assigned the result `10`.
4. The loop continues as long as `10 >= 10`.
5. `roman` is assigned `XX`.
6. `arabic` is decremented by `10` and assigned `0`.
7. The loop terminates since the conditional expression `0 >= 10` is false.

</details>

Next, let’s refactor the original `for` loop using a `while` loop.

<details>

<summary>Reveal Solution</summary>

```swift
func format(_ number: Int) -> String {
    var arabic = number
    var roman = ""
    
    while arabic >= 10 {
        roman += "X"
        arabic -= 10
    }
    while arabic >= 1 {
        roman += "I"
        arabic -= 1
    }
    
    return roman
}
```

</details>

Let’s rerun our tests to ensure no changes broke anything. We’re still <span style="color: green;">green</span>.

If our expected pattern is correct, this code should also pass for the Arabic numeral `30`.

Let’s add that test case.

```gherkin
  Scenario: Convert 30 to "XXX"
    Given I have the arabic number 30
    When I convert to Roman
    Then I should see the string "XXX"
```

Include `30` (`"XXX"`) in the source data for our parameterized test:

```swift
@Test("expect roman to be equal in value to arabic", arguments:
        zip([1, 2, 3, 10, 20, 30], ["I", "II", "III", "X", "XX", "XXX"])
)
func convertToRoman(arabic: Int, expectedRoman: String) {
    let roman = fmt.format(arabic)
    #expect(roman == expectedRoman)
}
```

Excellent! The new test passes, proving our hypothesis is correct up to this point.

However, we are left with two `while` loops that are practically identical, except for the values that they work with.

Let's resolve this code duplication issue in our next step. Time to <span style="color: #a8a800;">refactor</span> our
code.

## Notes

Swift function arguments are immutable, preventing external side effects. Mutating the `arabic` argument in the previous
code would cause a compile-time error.

We create a mutable copy of the `arabic` input argument by changing its name to `number` and using `var` to create a new
mutable `arabic` variable.

Here is the error we would have seen:

```text
Left side of mutating operator isn't mutable: 'arabic' is a 'let' constant
```

[Go to Step 7](./Step_07.md)
