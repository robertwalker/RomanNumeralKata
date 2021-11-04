# Roman Numeral Kata Solution

## Step 9: Removing Code Duplication

Again hear's what we have so far:

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

What we want to do next is iterate over the array indexes. Either array would work since they both have the same number
of indexes, but let's base our iteration loop on the `arabicNumerals` array.

That would look like this:

```swift
for index in 0..<arabicNumerals.count {
    // Loop body goes here...
}
```

Next we will place one of the `while` loops inside this new `for` loop, and replace the constant array index with the
`index` value provided by the `for` loop.

That should look something like this:

```swift
func format(_ number: Int) -> String {
    var arabic = number
    var roman = ""
    
    let arabicNumerals = [10, 1]
    let romanNumerals = ["X", "I"]
    for index in 0..<arabicNumerals.count {
        while arabic >= arabicNumerals[index] {
            roman += romanNumerals[index]
            arabic -= arabicNumerals[index]
        }
    }
    while arabic >= arabicNumerals[1] {
        roman += romanNumerals[1]
        arabic -= arabicNumerals[1]
    }
    
    return roman
}
```

We no longer need the second `while` loop, so let's remove it:

```swift
func format(_ number: Int) -> String {
    var arabic = number
    var roman = ""
    
    let arabicNumerals = [10, 1]
    let romanNumerals = ["X", "I"]
    for index in 0..<arabicNumerals.count {
        while arabic >= arabicNumerals[index] {
            roman += romanNumerals[index]
            arabic -= arabicNumerals[index]
        }
    }
    
    return roman
}
```

Let's run the tests and see how we did.

Congratulations! We have refactored our code to remove the duplication.

### Notes

In Swift the `count` property provides the number of items in a collection, which is `2` in our case We then use a `for`
loop to generate array indexes starting from 0 up to 1 less than the number of items in the array.

Notice the use of Swift's range operator where `m...n` would create a range that is inclusive for both `m` and `n` and
where `m..<n` creates a range that will include `m`, but exclude `n`.
