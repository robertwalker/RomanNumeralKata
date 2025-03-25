# Roman Numeral Kata Solution

## Step 1: Getting to Green

In the previous step we started with a failing test due to a compile time error. We were also given a commented out
block of code to help get us started.

```swift
//struct RomanFormatter {
//    func format(_ arabic: Int) -> String {
//        return ""
//    }
//}
```

Let's fix that by removing the comment (`//`) markers from all the lines.

Tip: In Xcode (and most other code editors) selecting lines and pressing `Command-/` will toggle comment markers.

The code should now look like this:

```swift
struct RomanFormatter {
    func format(_ arabic: Int) -> String {
        return ""
    }
}
```

Next we need to run the tests to check our progress.

```text
convert1(): Expectation failed: (roman → "") == "I"
```

We fixed the compile-time error, but the test still fails because we haven’t implemented the expected behavior.

Let’s think about how we can start building a solution that follows the three principles of TDD. Which of those
principles should guide our next step?

1. You are not allowed to write any production code unless it is to make a failing unit test pass.
2. You are not allowed to write any more of a unit test than is sufficient to fail; and compilation errors are
failures.
3. You are not allowed to write any more production code than is sufficient to pass the one failing unit test.

<details>

<summary>Reveal Solution</summary>

### What About This

Let’s stick to the feature’s instructions and not add anything extra. We will just return the string literal “I”?

```swift
struct RomanFormatter {
    func format(_ arabic: Int) -> String {
        return "I"
    }
}
```

Is this our definitive solution for converting Arabic numerals to Roman numerals? Of course not. Nevertheless, the
implementation adheres to the three principles of Test-Driven Development (TDD).

* We started with one failing test.
* The test doesn't make any assumptions beyond what the scenario specifies.
* The implementation doesn't do any more than necessary to pass the one failing test.
* There is nothing to refactor or clean up.

**Congratulations!** We have completed our first Red-Green-Refactor cycle.

</details>

[Go to Step 2](./Step_02.md)
