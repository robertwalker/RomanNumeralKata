# Roman Numeral Kata Solution

## Step 9: Removing Code Duplication

Here’s what we have so far:

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

Let’s move forward by iterating over the indices of the array. Since both arrays have the same number of elements, we
can choose either one. But let’s stick with the `arabicNumerals` array for now.

That would look like this:

```swift
for index in 0..<arabicNumerals.count {
    // Loop body goes here...
}
```

Alright, here’s the next step. We’ll move one of the while loops inside this new `for` loop. And guess what? We’ll
replace the constant array index with the index value that the `for` loop gives us.

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

The redundant second `while` loop can now be eliminated.

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

## Notes

In Swift, the `count` property provides the count of items in a collection. We use a `for` loop to generate array
indexes from 0 to one less than the array’s count.

Swift’s half-open range operator `m..<n` excludes `n`, while the closed range operator `m…n` includes `n`.

[Go to Step 10](./Step_10.md)
