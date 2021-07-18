<!-- Run this slideshow via the following command: -->
<!-- reveal-md README.md -w -->


<!-- .slide: class="header" -->
# Optionals and Conditionals

## [Slides](https://make-school-courses.github.io/MOB-1.1-Introduction-to-Swift/Slides/02-Optionals-&-Conditionals/README.html ':ignore')

<!-- > -->

## Agenda

- Learning Objectives
- Conditionals
- Activity on Conditionals
- Break
- Optionals
- Activity on Optionals
- Wrap Up

<!-- > -->

## Learning Objectives

By the end of this lesson, students should be able to:

1. Use **conditional statements** in Swift
1. Identify and use **optionals** in Swift code
1. Understand the importance of **optional binding**
1. List & apply ways for **unwrapping** an optional value

<!-- > -->

## Initial Exercise

Homework review/general questions from last week.

<!-- > -->

## Conditionals

Swift has several constructs to handle control flow in a program.

Using **comparison operators** and the type **Boolean** we can manipulate the flow of our apps.

<!-- > -->

### Why?

When we have a program and want to tell it to go through a specific path, we **evaluate a condition** before choosing the path.

- ⏰ Alarm goes off if it's 7:00 am
- 👾 Game ends if time's up
- 📱 Enable dark mode if it's active

This is how we control what happens in our apps.

<!-- v -->

### Comparison operators


|          |                           |
|:--------:|:-------------------------:|
|   >=     | greater than or equal to  |
|   >      | greater than              |
|   <=     | less than or equal to     |
|   <      | less than                 |
|   !=     | not equal to              |
|   ==     | equal to                  |
|   &&     | and                       |
|   ||     | or                        |

<!-- v -->

### (4 < 8 && 6 > 8) || 1 < 2

<aside class="notes">
quick check: is this true or false?
</aside>

<!-- > -->

## IF Statement

The most common way to control the flow of a program.

Allows the program to execute the block **only** if the condition is true.

```swift
let color = "red"

if color == "red"{
  print("This is a primary color")
}
```

<aside class="notes">
If the condition is true, then the statement will execute the code between the braces. If the condition is false, it will skip the block of code.
</aside>

<!-- v -->

### ELSE Clause

Extending the if statement

```swift
let color = "purple"

if color == "red" || color == "green" || color == "blue" {
  print("This is a primary color")
} else {
  print("This is not a primary color")
}
```

<aside class="notes">
We can extend an if statement to have code run in case the condition is false.
</aside>

<!-- v -->

#### Question

What will print to the console?

```swift
var weight = 52

if weight <= 50 {
    print("Have a great flight.")
} else {
    print("There is a $25 fee for your luggage.")
}
```

<!-- v -->

### ELSE IF Clause

```swift
let studentCount = 35
var message = ""

if studentCount < 5 {
  message = "Class won't run"
} else if studentCount < 25{
  message = "Class will run"
} else if studentCount < 30 {
  message = "Class is packed"
} else {
  message = "We need another section"
}
print(message)
```

<aside class="notes">
Nested if statements test multiple conditions one by one until a condition is true. Only the code associated with that first true condition is executed, regardless of whether subsequent else-if conditions are true. Order matters!

Sometimes we want to check one condition after another. We use the else-if clause to nest an if statement in the else clause of a previous if statement.
The last else clause is optional. We might not always need it.
</aside>

<!-- v -->

### Small prompt

Having:

```swift
let a = 5
let b = 10

var min: Int
var max: Int
```

Write code that will save the smaller number in *min* and the greater number in *max*.

<!--
if a < b{
    min = a
    max = b
}else{
    min = b
    max = a
}
-->

<!-- v -->

### Ternary operator

The ternary operator takes a condition and returns one of two values, depending on whether the condition was true or false.

```swift
(<CONDITION>) ? <TRUE VALUE> : <FALSE VALUE>
```

<!-- v -->

### Example

```swift
let degrees = 76
let mood = degrees > 70 ? 😊 : 😔
```
<aside class="notes">
This will return 😊
</aside>

<!-- v -->

```swift
let buttonTitle = isFavorite ? "Remove" : "Save"
```

<aside class="notes">
Setting the title of a button. If you already marked something as favorite, the button should say "Remove" (from favorites), otherwise "Save".</aside>

<!-- v -->

#### Question

Rewrite the min/max if statement with the ternary operator.

<!--
min = a < b ? a : b
max = a > b ? a : b
-->

<!-- > -->


## In Class Activity

- [Conditionals - Playground](https://github.com/Make-School-Courses/MOB-1.1-Introduction-to-Swift/blob/master/Lessons/02-Optionals-%26-Conditionals/assets/conditionals-fixed.zip)

<!-- > -->

## Optionals

“One of the greatest strengths of Swift is its ability to read code and quickly understand data.

When a function may or may not return data, Swift forces you to deal properly with both possible scenarios.

Swift uses unique syntax, called optionals, to handle this sort of case.”

<aside class="notes">
Excerpt From: Apple Education. “Develop in Swift Fundamentals.” Apple Inc. - Education, 2020. Apple Books.
</aside>

<!-- > -->

![dogBox](assets/dogBox.png)

<aside class="notes">
Think of an Optional as a box that can only hold a certain type of something.

For example a DogBox that can only store a Dog.

The DogBox can only have one of two states: it's empty, or it contains a Dog.
</aside>

<!-- v -->

### Two states

![options](assets/options.png)

<aside class = "notes">
When the box is empty it has a nil value.

When the box is not empty, it has some value: a Dog.
</aside>

<!-- v -->

![notequal](assets/notequal.png)

<!-- > -->

Optionals are a special type in Swift.

An optional can represent **a value** or the **absence of a value**.

```swift
var volunteer : String = "Nadia"
var fosterDog : String = "Lentil"
```

<aside class="notes">
In the example, Nadia is someone who fosters dogs for a few weeks. there might be times when she's not fostering a dog, in that case, the value for fosterDog could be an empty string, but it's better if it's a nil value, it's less confusing for programmers.
</aside>

<!-- v -->

We need an explicit way to represent the absence of a value. This would be using **nil**. Swift gives us optionals, that can handle the possibility of a value to be **nil**.

Handling a **non-optional** - we're guaranteed to have a value

```swift
var fosterDog : String = "Lentil"
```

Handling an **optional** - we must handle the nil case

```swift
var fosterDog : String? = "Lentil"
var fosterDog : String? = nil
```

<!-- > -->

## Unwrapping Optionals

```swift
var fosterDog: String? = "Lentil"
print(fosterDog)

Optional("Lentil")
```

<aside class = "notes">
This what will happen if we print out the value of an optional. The result is an optional that contains the value Lentil.

This isn't wrong, but what we want is to get the value out of the box to print it.

</aside>

We need to **unwrap** the value. Take it our of the box.

<!-- v -->

## Force unwrapping

We can force unwrap the value using an exclamation mark.

```swift
var fosterDog: String? = "Lentil"
var unwrappedDog = fosterDog!
print("The dog's name is \(unwrappedDog)")

The dog's name is Lentil
```

<aside class="notes">
The exclamation mark after the variable name tells the compiler that we want to look inside the box and take out the value.
</aside>

<!-- v -->

What happens if we force unwrap the following?

```swift
var fosterDog: String?
print("The dog's name is \(fosterDog!)")

```
We get this:
```swift
Fatal error: Unexpectedly found nil while unwrapping an Optional value
```

<aside class="notes">
It will produce an error. Since we are trying to force taking out something of the box, when it's nil. When this happens during runtime, it will crash our app. Force unwrapping should be used sparingly.
</aside>

<!-- v -->

## Unwrapping the safe way

```swift
if fosterDog != nil {
  print("The dog's name is \(fosterDog!)")
} else {
  print("Not fostering right now.")
}
```

The if statement checks if the optional contains nil. If it's not nil then there's a value we can unwrap.

<aside class="notes">
If we use this method, we'll need to remember to check for nil every time we want to unwrap an optional. There's an easier way to do this.
</aside>

<!-- > -->

## Optional binding

Swift has a feature known as optional binding that lets you access the value inside an optional in a safe way.

```swift
if let unwrappedDog = fosterDog {
  print("The dog's name is \(unwrappedDog)")
} else {
  print("Not fostering right now.")
}
```
<aside class="notes">
Optional binding gets rid of the optional type and there's no need to use the exclamation mark to force unwrap. If the optional contains a value, this value is unwrapped and bound to the constant unwrappedDog. The if statement then executes the first block of code, where we can safely use unwrappedDog, now being a non-optional String.

If it's nil then the if statement executes the else block.

</aside>

<!-- v -->

```swift
if let fosterDog = fosterDog {
  print("The dog's name is \(fosterDog)")
} else {
  print("Not fostering right now.")
}
```

It's common practice to name the unwrapped constant or variable with the same name as the optional.

<!-- > -->

## Guard

Sometimes you we want to check a condition and only continue executing a function if the condition is true.

Swift has a guard statement that works for those situations.

```swift
func buyFood(for fosterDog: String?) {
  guard let fosterDog = fosterDog else {
    print("Not fostering dogs right now. Don't buy food")
    return
  }

  print("Don't forget to get food for \(fosterDog).")
}

buyFood(for: nil)
buyFood(for: "Lentil")
```
<aside class="notes">
The guard keyword is followed by a condition that can include both Boolean expressions and optional bindings, followed by else, then a block of code that will only execute if the condition is false. Immediately then we must return.

The happy path is what comes if the condition is true and for readability it will be on the left of the code. Also, anything checked in the guard statement’s condition must be true for the remainder of the function and we can safely use their values.
</aside>

<!-- > -->

What if we want default values for those cases where when get nil back?

```swift
var dietSelected: String?
if let diet = diet {
  print("Buying \(dietSelected)")
} else {
  print("Buying raw food")
}
```

<!-- > -->


## Nil-coalescing

If the value inside the optional is nil, we give a **default value** called nil-coalescing.

```swift
<OPTIONAL VALUE> ?? <DEFAULT VALUE>

var dietSelected: String?
var shoppingItem = dietSelected ?? "raw food"
```

<!-- > -->

### Questions

**Q1:** How would you declare a double named `height` with a value of 4.2 that can be set to `nil` at a later date?
<!--var height: Double? = 4.2-->

<!-- v -->

**Q2:** What is the purpose of the following code?

```swift
if height != nil {

}
```
<!--checks that height contains a value-->

<!-- v -->

**Q3:** which of the following code snippets uses VALID optional binding syntax?

1. `if let dogName = owner.dog { }` <!--correct-->
1. `if dogName = owner.dog { }`
1. `if let dogName = owner.dog! { }`
1. `if let dogName == owner.dog { }`

<!-- v -->

**Q4:** In your own words, what is the purpose of `guard`?
<!--to simply control flow, communicate intent, and eliminate invalid parameters early on-->

<!-- v -->

**Q5:** What will be returned at the end of the function call?

```swift
func calculateResult(a: Int?, b: Int?, c: Int?) -> Int {
    guard let aValue = a else { return 0 }
    guard let bValue = b else ( return aValue }
    guard let cValue = c else {return bValue }

    return aValue + bValue + cValue
}

calculateResult(a: 4, b: 8, c: nil)
```

<!--returns 8, as it hits the return statement in the cValue guard-->

<!-- > -->

## Implicitly Unwrapped Optional

```swift
var title : String

var title: String?

var title: String!

```

<!-- > -->

## In Class Activity

- [Lab 2](https://github.com/Make-School-Labs/swift-lab-2)

<!-- > -->

## After Class

- Find out how you can unwrap several values at the same time to avoid something called **pyramid of doom**.
- Complete Lab 2 and upload to Gradescope.
- Read the [Apple Documentation - optionals section](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html) and write down questions from things that are unclear.

<!-- > -->

## Additional Resources

- [Article on Optionals](https://hackernoon.com/swift-optionals-explained-simply-e109a4297298)
- [Explaining the guard statement](https://thatthinginswift.com/guard-statement-swift/)
- [Apple Docs](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html)
