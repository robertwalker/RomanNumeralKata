# Roman Numeral Kata Solution

## Step 4: Refactor Using a Loop

We now have a clearer picture of one of the fundamental patterns for our function.

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

It's clear that each subsequent Arabic numeral in the range 1 to 3 adds the "I" character to represent the Roman
numeral.

We should be able to abstract that pattern into some sort of a loop.

A `for` loop should work:

```swift
func format(_ arabic: Int) -> String {
    var roman = ""
    
    for _ in 0..<arabic {
        roman += "I"
    }
    
    return roman
}
```

Let's run all three of our tests again to see how we did? This time they should all still pass.

Congratulation on completing your first "refactor" phase of the TDD cycle!
