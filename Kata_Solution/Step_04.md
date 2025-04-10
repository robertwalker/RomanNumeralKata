# Roman Numeral Kata Solution

## Step 4: Refactor Using a Loop

In Step 3, we began the "Refactor" phase of the TDD cycle.

Now, we have a better idea of a basic pattern for our function.

Let's review our implementation so far:

```swift
func format(_ arabic: Int) -> String {
    if arabic == 3 {
        return "I" + "I" + "I"
    }
    if arabic == 2 {
        return "I" + "I"
    }
    return "I"
}
```

Each Arabic numeral from 1 to 3 appends an “I” character to represent the Roman numeral.

Can we use a loop to represent this pattern? Let’s see what we can find.

<details>

<summary>Reveal Solution</summary>

### A `for` loop should work

```swift
func format(_ arabic: Int) -> String {
    var roman = ""
    
    for _ in 0..<arabic {
        roman += "I"
    }
    
    return roman
}
```

</details>

Let’s rerun all three tests to see how we did. They should all still pass.

### Refactoring Tests

You may have noticed a repeating pattern in the three test functions we’ve created.

```swift
struct RomanFormatterTests {
    let fmt = RomanFormatter()
    
    @Test("expect roman to be I")
    func convert1() {
        let roman = fmt.format(1)
        #expect(roman == "I")
    }
    
    @Test("expect roman to be II")
    func convert2() {
        let roman = fmt.format(2)
        #expect(roman == "II")
    }
    
    @Test("expect roman to be III")
    func convert3() {
        let roman = fmt.format(3)
        #expect(roman == "III")
    }
}
```

How can we remove duplication from these test functions?

<details>

<summary>Reveal Solution</summary>

### Parameterized Tests

Most testing frameworks offer a mechanism to provide variable input into a test case.

In Swift that could look something like:

```swift
struct RomanFormatterTests {
    let fmt = RomanFormatter()
    
    @Test("expect roman to be equal in value to arabic", arguments:
            zip([1, 2, 3], ["I", "II", "III"])
    )
    func convertToRoman(arabic: Int, expectedRoman: String) {
        let roman = fmt.format(arabic)
        #expect(roman == expectedRoman)
    }
}
```

Congratulations on completing your first "Refactor" phase of the TDD cycle!

</details>

[Go to Step 5](./Step_05.md)
