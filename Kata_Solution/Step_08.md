# Roman Numeral Kata Solution

## Step 8: Collecting Values Into Arrays

Again here's where we left off from Step 7:

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

As mentioned in the previous step we have these two fixed sequences for `arabicNumeral` and `romanNumeral`.

Next we'll collect these sequences into array constants. Then access the values by their array index:

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

Great! Now the only difference between the two `while` loops is the value of the array index.

Before moving on to the next step let's run the tests again to make sure we didn't break anything.

### Notes

You may have noticed the change from `var` to `let` for our new local array variables.

In Swift `let` creates an immutable "constant" value, where as `var` creates a mutable variable. We no longer need to
change these variables so they can be defined as constants.

Swift will generate a compiler warning if a variable defined with `var` isn't modified within the scope where the
variable is defined.
