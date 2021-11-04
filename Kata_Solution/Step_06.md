# Roman Numeral Kata Solution

## Step 6: An Emerging Pattern

Now it's finally time to start putting those brain cells to work. Since the pattern for the sequence `[10, 20, 30]` is
slightly different than the established pattern for `[1, 2, 3]` we need a slightly different approach.

Let's begin by adding a new scenario and test for the `arabic` numeral `20`.

```gherkin
  Scenario: Convert 20 to "XX"
    Given I have the arabic number 20
    When I convert to Roman
    Then I should see the string "XX"
```

```swift
func testConvert20() {
    let roman = fmt.format(20)
    XCTAssertEqual(roman, "XX")
}
```

This test should fail with an error something like:

```text
test failure: RomanFormatterTests.testConvert20()
failed: XCTAssertEqual failed: ("IIIIIIIIIIIIIIIIIIII") is not equal to ("XX")
```

At this point we could go through the whole process we used to discover the original pattern, but we should now have
enough knowledge to skip ahead a bit.

Let's start with this:

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

That gets us back to green, however, that looks strikingly similar to our original pattern that we already established.

The sequence `[10, 20, 30]` is similar to the sequence `[1, 2, 3]` but on the 10's column. How can we take advantage of
that?

We could try to create another `for` loop where the index increments by 10 each iteration. We can't really use a Swift
`range` of `Int` values, like we did for the `[1, 2, 3]` sequence, since that includes all integers in the range.

However, we could instead replace the `for` loop with a `while` loop and control the index value ourselves for each
iteration of the loop.

Here's what that would look like:

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

Now when we pass in the Arabic number `20` then that gets passed into this `while` loop.

Let's break that down:

1. The `arabic` variable has the value `20` when entering the loop
2. The `roman` value is assigned the value `X`
3. We subtract `10` from `arabic`, and assign it the resulting value `10`
4. We continue to the next iteration of the `while` loop where the condition is still true (`10 >= 10`)
5. The `roman` value is assigned the value `XX`
6. We subtract `10` from `arabic`, and assign it the resulting value `0`
7. The loop condition is now `0 >= 10` which is false, so we exit the `while` loop

Great! That gets us back to **green**. Now it's time for some refactoring.

Notice that our original `for` loop could also be refactored using a `while` loop. Let's apply that change:

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

Let's run our tests again to make sure we didn't break anything. Great! We are still **green**.

If we understand our pattern correctly, then this code should also pass for the Arabic numeral `30`.

Let's add that scenario and test to prove that out:

```gherkin
  Scenario: Convert 30 to "XXX"
    Given I have the arabic number 30
    When I convert to Roman
    Then I should see the string "XXX"
```

```swift
func testConvert30() {
    let roman = fmt.format(30)
    XCTAssertEqual(roman, "XXX")
}
```

Excellent! The new test passes proving our hypothesis is correct up to this point.

However, We are left with two `while` loops that are practically identical, except for the values that they work with.

Let's resolve this code duplication issue in our next step. Time to refactor our code.

### Notes

If you have a keen eye, you may have noticed that we are making a mutable copy of the input argument. This may seem
odd to those coming from other programming languages. Swift function arguments are immutable by default making them safe
from causing external side-effects.

If we tried to mutate the previous code's `arabic` argument we would get this compile time error:

```text
Left side of mutating operator isn't mutable: 'arabic' is a 'let' constant
```

Remember from the "Three Laws of TDD" that compile time errors are also considered to be test failures.

While it is good practice to avoid mutating passed-in arguments in any programming language, Swift makes this practice
explicit.
