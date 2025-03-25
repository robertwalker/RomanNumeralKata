# Roman Numeral Kata Solution

## Step 8: Collecting Values Into Arrays

Here’s where we left off from Step 7:

```swift
func format(_ number: Int) -> String {
    var arabic = number
    var roman = ""
    
    var arabicNumeral = 10
    var romanNumeral = "X"
    while arabic >= 10 {
        roman += romanNumeral
        arabic -= arabicNumeral
    }
    arabicNumeral = 1
    romanNumeral = "I"
    while arabic >= 1 {
        roman += romanNumeral
        arabic -= arabicNumeral
    }
    
    return roman
}
```

We have two fixed sequences for `arabicNumeral` and `romanNumeral`.

We’ll collect these sequences into array constants and access their values by array index.

```swift
func format(_ number: Int) -> String {
    var arabic = number
    var roman = ""
    
    let arabicNumerals = [10, 1]
    let romanNumerals = ["X", "I"]
    while arabic >= arabicNumerals[0] {
        roman += romanNumerals[0]
        arabic -= arabicNumerals[0]
    }
    while arabic >= arabicNumerals[1] {
        roman += romanNumerals[1]
        arabic -= arabicNumerals[1]
    }
    
    return roman
}
```

Awesome! The only difference between the two while loops is the value of the array index.

Before we move on to the next step, let’s run the tests again to make sure we didn’t break anything.

## Notes

You might have noticed the switch from `var` to `let` for our new local array variables.

In Swift, `let` creates a fixed value that can’t be changed, while `var` lets you modify it. Since we don’t need to
change these variables, we can define them as constants.

Swift will give you a warning if you define a variable with `var` and don’t change it within the scope where it’s
defined.

[Go to Step 9](./Step_09.md)
