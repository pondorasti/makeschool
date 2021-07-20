
## In Class Activity

### Individually or In a team create a playground or Repl.it to work on the following:

#### Resources:
- [map documentation](https://developer.apple.com/documentation/swift/array/3017522-map)
- [filter documentation](https://developer.apple.com/documentation/swift/sequence/3018365-filter)
- [reduce documentation](https://developer.apple.com/documentation/swift/array/2298686-reduce)

1. Here is an imperative version of a function called `doubleIt` that takes an array of numbers and returns a new array after doubling every item in the initial array:

```swift
func doubleIt(inputArray: Array<Int>) {

    var results = [Int]()

    for num in inputArray {
        results.append(num * 2)
    }
    print(results)
}

doubleIt(inputArray: [1,2,3]) // [2,4,6]
```

Code the declarative (FP) version of `doubleIt`so that it achieves the same result as the code above by using the `map` function instead of the `for loop`

<!--
```swift
func doubleIt(inputArray: Array<Int>) {

    // TODO: Use map here...
    let results = ??
    print(results)
}

doubleIt(inputArray: [1,2,3]) // [2,4,6]
```
-->

2. Suppose we have an array containing strings representing the contents of a directory:

`let exampleFiles = ["README.md", "HelloWorld.swift", "FlappyBird.swift"]`

Now suppose we want an array of all the .swift files. This is easy to compute with a simple loop. Use the HOF `filter`.

3. Define a function that sums all the integers in an array. Use `reduce`

4. Suppose we have the following struct, consisting of a city’s name and population (measured in thousands of inhabitants):

```swift
struct City {
  let name: String
  let population: Int
}

extension City {
  func scalingPopulation() -> City {
    return City(name: name, population: population * 1000)
  }
}
```
We can define several example cities:

```swift

let paris = City(name: "Paris", population: 2241)
let madrid = City(name: "Madrid", population: 3165)
let amsterdam = City(name: "Amsterdam", population: 827)
let berlin = City(name: "Berlin", population: 3562)

let cities = [paris, madrid, amsterdam, berlin]
```

Print a list of cities with at least one million inhabitants, together with their total populations.


*From: Chris Eidhof. “Functional Swift.” Apple Books*
