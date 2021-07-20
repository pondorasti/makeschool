<!-- Run this slideshow via the following command: -->
<!-- reveal-md README.md -w -->

<!-- .slide: class="header" -->
# Closures

## [Slides](https://make-school-courses.github.io/MOB-1.1-Introduction-to-Swift/Slides/13-Closures/README.html ':ignore')

<!-- > -->

## Why you should know this

You probably have already used closures by now without noticing 😯

Closures are a powerful way of writing code that performs and looks better.

They are also present in many programming languages so knowing how they work will help you recognize them when working in other type of projects.

<!-- > -->

## Learning Objectives

1. Describe how closures work and how to use them
1. Declaring and calling closures
1. Apply the **closure syntax** and **shorthand argument** names

<!-- > -->

## Intro

![gifts](assets/package.png)

<aside class="notes">
Let's say I need to send a gift to a friend. I wrap it in a box and take it to the post office.

After 5 days, it finally arrives to its destination.

My friend can now open the package and reveal their gift.

I'm not there to physically give them the present, but the contents remain in the package until it gets opened and ready to use.

This is the same concept as closures. Let's see how.
</aside>

<!-- > -->

## What is a Closure?

Apple's definition:<br>

**"Closures are self-contained blocks of functionality that can be passed around and used in your code."**

In essence, a closure is a block of code that you can assign to a variable or constant. Then pass it around in your code and execute its content later somewhere else

<!-- > -->

### Back to the gift

**The actual content of the gift** - block of code, something we are going to use later

**The wrapped package** - the block of code now assigned to a variable

**The package gets passed around by the delivery truck** - code being passed around

**the package being opened and used** - Executing the block of code.

<!-- > -->

#### Example: closure with statements

```swift
var brunch = {
    print("Coffee and bagels")
}
```

<aside class="notes">
Everything inside the braces `{}` is the closure. And it is assigned to a variable (could be to a constant too).

**Q:** What is the type of the closure? <br>
We can add it in the declaration.
</aside>

<!-- > -->

```Swift
var brunch: () -> () = {
    print("Coffee and bagels")
}

brunch()
```

<!-- > -->

## Syntax

![syntax](assets/closureSyntax.png)

<!-- > -->


#### Example: closure with parameters

```Swift
let brunchOption:(String) -> () = { option in
    print(option)
}
brunchOption("Mimosas and croissants")
```

**Q:** What is the type of the closure?

<aside class="notes">
We can use the value passed inside the statements of the closure by placing a parameter name `option` followed by the `in` keyword.

The `in` keyword separates the parameter name with the body of the closure.

When calling the closure, since it accepts a String, we pass the string in that moment.
</aside>

<!-- > -->

#### Example: closure that returns a value

```Swift
let brunchOptionLocation:(String) -> (String) = { option in
    let message = option + " @ Castro St."
    return message
}
let result = brunchOptionLocation("Pancakes and smoothies")
print(result)
```

**Q:** What is the meaning of `(String) -> (String)`?<br>
**Q:** How are we using `option`? <br>
**Q:** How do we return and show the output?

<!-- > -->

#### Example: passing a closure as a function parameter

```Swift
func getBrunch(optionClosure:()->()) {
    print("Going for brunch.")
}

getBrunch(optionClosure: {
    print("Anything edible")
})
```
**Q:** What is the output?<br>
**Q:** Why is the closure statement is not executed?<br>

<!-- > -->

### Function vs Closure

Closures are very similar to functions. In fact, functions are a special type of closures. They have a name and are declared with the keyword `func` whereas closures are nameless.

Take the following function and turn it into a closure. Note each step you make in the transformation. Include how you would call it.

```Swift
func add(number1: Int, number2: Int) -> Int {
 return number1 + number2
}
```

<aside class="notes">
Once everyone is done, do the transformation in a big whiteboard for everyone to see and share their insights.
</aside>

<!-- > -->

## Capturing values

```swift
func cook() -> (String) -> Void {
    return {
        print("I'm going to cook \($0)")
    }
}

let result = cook()
result("pizza")

```

<!-- > -->

```swift

func cook() -> (String) -> Void {
    var counter = 1
    return {
        print("\(counter). I'm going to cook \($0)")
        counter += 1
    }
}

let result = cook()
result("pizza")
result("pasta")
result("cake")

```

<!-- > -->

## Optimizing with closures

Swift’s closure expressions have a clean, clear style, with optimizations including:

- Inferring parameters
- Implicit returns from single-expression closures
- Shorthand argument names

<!-- v -->

We'll use the sort method as an example.

`sorted(by:)` sorts an array of values of a known type, based on the output of a sorting closure that we provide.

Once it completes the sorting process, the `sorted(by:)` method returns a new array of the same type and size as the old one, with its elements in the correct sorted order.

The original array is not modified.

<!-- v -->

`let names = ["Andrea", "Chris", "Marie", "Beth", "Tom"]`

The `sorted(by:)` method accepts a closure that takes two arguments of the same type as the array’s contents, and returns a `Bool` value to say whether the first value should appear before or after the second value once the values are sorted. The sorting closure needs to return true if the first value should appear before the second value, and false otherwise.

<!-- v -->

First approach, using a function and passing it as a parameter.

```swift
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by: backward)
```

<!-- v -->

*For characters in strings, “greater than” means “appears later in the alphabet than”. This means that the letter "B" is “greater than” the letter "A".*

<!-- v -->

Second approach, using a closure expression syntax.
```swift
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})
```

<!-- v -->

Since the body of the closure is short, we can write in in one line.
```swift
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in return s1 > s2 } )
```

<!-- v -->

Also, because the sorting closure is passed as an argument to a method, Swift can **infer the types of its parameters and the type of the value it returns**.

```swift
reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 } )
```

<!-- v -->

Swift automatically provides **shorthand argument names** to inline closures, which can be used to refer to the values of the closure’s arguments by the names `$0`, `$1`, `$2`, and so on.
```swift
reversedNames = names.sorted(by: { $0 > $1 } )
```

<!-- > -->

## Challenges

Complete [these](https://github.com/Make-School-Courses/MOB-1.1-Introduction-to-Swift/blob/master/Lessons/13-Closures/assignments/challenges.md) challenges on closures.

<!-- > -->

## Wrap Up

- Complete challenges
- Read the content listed below if you need more clarity on closures.
- Go over [this playground](https://github.com/Make-School-Courses/MOB-1.1-Introduction-to-Swift/blob/master/Lessons/13-Closures/assignments/Closures.playground.zip) if you feel like wanting more practice with closures.

<!-- > -->

## Additional Resources

1. [Closures in Swift - an article](https://medium.com/the-andela-way/closures-in-swift-8aef8abc9474)
1. [From function to closure - article](https://medium.com/ios-os-x-development/introduction-to-closures-in-swift-3-1d46dfaf8a20)
1. [Apple's documentation on closures](https://docs.swift.org/swift-book/LanguageGuide/Closures.html)
1. [Closures explained & exercises](https://www.weheartswift.com/closures/)
1. [Capturing values](https://www.hackingwithswift.com/sixty/6/11/capturing-values)
