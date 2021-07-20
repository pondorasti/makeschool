
## In Class Activity I

<!-- So far, we have learned that:
- Functors are structures with `map` functions.
- Applicative Functors are Functors with `apply` functions
- Monads are Functors with `flatMap` (and `compactMap`) functions -->

**Exercise 1:** The output for the following code snippet is `[Optional(1), Optional(2), nil, nil, Optional(5)]`, which is not the desired output.

**TODO:** Rework this code so that it only prints the string equivalents of the the integers as `[1, 2, 5]`

```Swift
let possibleNumbers = ["1", "2", "three", "///4///", "5"]
let mapped: [Int?] = possibleNumbers.map { str in Int(str) }

print(mapped)
```

<!-- SOLUTION to Exercise 1:
let compactMapped: [Int] = possibleNumbers.compactMap { str in Int(str) }
// [1, 2, 5]
-->

**Exercise 2:** Using the `reduce` function, complete the code below so that the output is `6.667`

__*Remember:*__ The function `reduce` takes two arguments, an initial value and a closure.

For initial value, use: `0.0` </br>
Closure expression: `{ $0 + ($1 / Double(values.count)) }`

```Swift
let values = [7.0, 3.0, 10.0]
let avg:Double = // TODO: reduce values array to the average of all its elements

print(avg)
```
<!-- SOLUTION to Exercise 2:
let values = [7.0, 3.0, 10.0]
let avg:Double = values.reduce(0.0) { $0 + ($1 / Double(values.count)) }
print(avg)
// Output: 6.667
-->

**Exercise 3:** For the `values` array below, return only the even numbers in a new array. The output of that new `even` array should be `[14, 22]`

```Swift
let values = [11, 13, 14, 17, 21, 33, 22]
  // TODO: return only even numbers here

print(even)
// Output: [14, 22]
```
<!-- SOLUTION to Exercise 3:
let values = [11, 13, 14, 17, 21, 33, 22]
let even = values.filter { (someInt) -> Bool in
    someInt % 2 == 0
}
print(even)
// Output: [14, 22]
-->


**Exercise 4:** You’re working with 4 groups of giraffes, and want to create one single group of giraffes that are taller than a certain height.

**TODO:** Complete by findining all the integers in the `giraffes` (nested) array that are greater than 10 and return them in one single, flat (non-nested) array:

```Swift
let giraffes = [[5, 6, 9], [11, 2, 13, 20], [1, 13, 7, 8, 2]]
let tallest = giraffes.flatMap({ // TODO: Insert closure syntax here })

print(tallest) // [11, 13, 20, 13]
```
<!-- SOLUTION to Exercise 4:
let giraffes = [[5, 6, 9], [11, 2, 13, 20], [1, 13, 7, 8, 2]]
let tallest = giraffes.flatMap({ $0.filter({ $0 > 10 }) })

print(tallest) // [11, 13, 20, 13]
```

*from:* </br>
https://learnappmaking.com/map-reduce-filter-swift-programming/#filter


<!-- 1) a few examples for recognition
2) coding exercises for reduce, filter, compactMap...and combining map and filter -->
