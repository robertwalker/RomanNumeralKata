# Roman Numeral Kata Solution

## Step 16: Using Language Specific Features

Let’s clean up our solution by using Swift’s tuple type.

Instead of maintaining two separate arrays of numerals, we can use a single `Array` of tuples.

Tuples associate values into pairs, triples, etc.

Here’s an example of a tuple in Swift:

```swift
let tuple: (Int, String) = (10, "X")
```

Swift supports type inference, so the type annotation isn’t needed here.

```swift
let tuple = (10, "X")
```


How can tuples improve code readability?

<details>

<summary>Reveal Solution</summary>

### Here's what I came up with

```swift
enum RomanError: Error {
    case numberOutOfRange
}

fileprivate let numerals = [(1000, "M"), (900, "CM"), (500, "D"),
                (400, "CD"), (100, "C"), (90, "XC"),
                (50, "L"), (40, "XL"), (10, "X"),
                (9, "IX"), (5, "V"), (4, "IV"), (1, "I")
]

struct RomanFormatter {
    func format(_ number: Int) throws -> String {
        var arabic = number
        var roman = ""
        
        guard (1...3999).contains(arabic) else {
            throw RomanError.numberOutOfRange
        }

        for (arabicNumeral, romanNumeral) in numerals {
            while arabic >= arabicNumeral {
                roman += romanNumeral
                arabic -= arabicNumeral
            }
        }
        
        return roman
    }
}
```

Note: We also moved the constants to the top level of the file where `RomanFormatter` is implemented.

### An Alternate Solution

There’s a slightly different solution using the global `zip()` function. You might’ve noticed this in our test suite.

Here’s how we could use `zip()` to create a `numerals` array:

```swift
fileprivate let numerals = zip(
    [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1],
    ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
)
```

Note: We make the constant `fileprivate` to restrict access to it to this file’s code.

The `zip()` function pairs elements from two sequences. It’s like a zipper. The result can be iterated with a `for`
loop.

```swift
let array = zip([1, 2, 3], ["one", "two", "three"])

for (a, b) in array {
    print("\(a): \(b)")
}
// => (1, one)
// => (2, two)
// => (3, three)
```

Using the `zip()` function might be easier to read than the raw array of tuples, but it’s subjective.

#### Here's what that alternate solution would look like:

```swift
enum RomanError: Error {
    case numberOutOfRange
}

fileprivate let numerals = zip(
    [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1],
    ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
)

struct RomanFormatter {
    func format(_ number: Int) throws -> String {
        var arabic = number
        var roman = ""
        
        guard (1...3999).contains(arabic) else {
            throw RomanError.numberOutOfRange
        }
        
        for (arabicNumeral, romanNumeral) in numerals {
            while arabic >= arabicNumeral {
                roman += romanNumeral
                arabic -= arabicNumeral
            }
        }
        
        return roman
    }
}
```

</details>
