import Foundation

func add(a: Int, b: Int) -> Int {
  return a+b
}

func multiply(a: Int, b: Int) -> Int {
  return a*b
}

func calculate(a: Int, b: Int, myFunction: (Int, Int) -> Int) -> Int {
  let result = myFunction(a, b)
  return result
}

// call calculate and pass in the functions by name
calculate(a: 3, b: 5, myFunction: multiply)
calculate(a: 3, b: 5, myFunction: add)

// call calculate and pass in the add function as a closure
calculate(a: 3, b: 5, myFunction: { (a: Int, b: Int) -> Int in
  return a+b
})

// call calculate and pass in the add function as a closure using "trailing closure syntax",
// i.e. extracting the last argument from the argument list
calculate(a: 3, b: 5) { (a: Int, b: Int) -> Int in
  return a+b
}

// call calculate and pass in the add function as a closure using "trailing closure syntax",
// and omitting type information of the closure
calculate(a: 3, b: 5) { a, b in
  return a+b
}

// call calculate and pass in the add function as a closure using "trailing closure syntax",
// omitting type information of the closure and removing argument names (while still referring)
// to the arguments in order ($0, $1, ...)
calculate(a: 3, b: 5) {
  $0 + $1
}

