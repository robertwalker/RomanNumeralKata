# Roman Numeral Kata Solution

## Step 7: Extracting Variables

Let's review our code up to this point:

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

The two `while` loops are essentially the same. The only difference being the values that they work with.

Let's first extract those values out to local variables:

```swift
func format(_ number: Int) -> String {
    var arabic = number
    var roman = ""
    
    var arabicNumeral = 10
    var romanNumeral = "X"
    while arabic >= arabicNumeral {
        roman += romanNumeral
        arabic -= arabicNumeral
    }
    arabicNumeral = 1
    romanNumeral = "I"
    while arabic >= arabicNumeral {
        roman += romanNumeral
        arabic -= arabicNumeral
    }
    
    return roman
}
```

Let's run the tests again to make sure we didn't break anything.

The code duplication is even more apparent with this change. We now see that we have a fixed number of values for
`arabicNumeral`, which are `10` and `1`. We have something similar with `romanNumeral`, which is `X` and `I`.

We will resolve this in the next step.
