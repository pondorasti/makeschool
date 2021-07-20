<!-- Run this slideshow via the following command: -->
<!-- reveal-md README.md -w -->


<!-- .slide: class="header" -->

# Closures and Callbacks

## [Slides](https://make-school-courses.github.io/MOB-1.3-Dynamic-iOS-Apps/Slides/Lesson2/README.html ':ignore')

<!-- > -->

## Agenda

- Intro to course
- Learning Objectives
- Closures
- Trailing Closures
- Capturing values
- Escaping and Non escaping

<!-- > -->

## Learning objectives

1. Identify use cases of closures
1. Know the difference between escaping and non escaping closures
1. Implement closures as completion handlers
1. Use closures to pass data between View Controllers

<!-- > -->

## Initial Exercise

1. Brainstorm everything you know about closures.

<!--
2. Then write an example.
3. Post it in the slack channel.
4. React to other's example with ✔️ if you understand it and ❓if you are unsure of why it works.
-->

<!-- v -->

## What is a closure?

Self contained blocks of functionality that can be passed around and used in your code.

<aside class ="notes">
Basically blocks of code that we can assign to a variable, pass around in our code, then called so they can execute their code.
</aside>

<!-- v -->

```swift
let greeting = {
    print("Welcome back!")
}

greeting()
```

<aside class ="notes">
We define a closure and assign it to a constant. The body of the closure is between curly brackets.

Then it gets called by calling the name of the constant with ().
</aside>

<!-- v -->

```swift
let greeting:(String) -> () = { name in
    print("Welcome back, \(name)!")
}

greeting("Tahoe 🐶")
```
<aside class ="notes">
Same as previous example. The difference is that now we have one parameter of type String. We can use the parameter inside the closure by assigning a local variable "name" to the first parameter of the closure.

The keyword "in" separated the closure parameters and the body.

We can give parameters any name we want to use or leave them blank to use shorthand values.

When we call the closure, it will need a value for such parameter.
</aside>

<!-- v -->

```swift
let greeting:(String) -> () = {
    print("Welcome back, \($0)!")
}

greeting("Tahoe 🐶")
```

<!-- v -->

## Review practice

- [Closures 01 - Replit](https://replit.com/team/MOB13/Closures-01)

<!-- v -->

## Trailing closures  

We can send closures as parameters to functions. If the closure happens to be the last parameter sent, we can use **trailing closure syntax**

```Swift
func washHands(action:()->()) {
    print("Get some soap 🧼")
    action()
    print("Hands are clean. 🙌🏼")
}
```

Can be called:

```swift
washHands() {
    print("Singing for 20 seconds 🎤")
}
```

<aside class = "notes">
The closure is written outside of the function call parentheses, this is known as trailing closure. Its purpose is readability (specially for long closures), so it is recommended to use when a function accepts a closure as a final argument.
</aside>

<!-- v -->

## Capturing values

Closures have a distinct feature that makes them stand out: they can capture values from their surrounding context.

From Apple's documentation:

*A closure can capture constants and variables from the surrounding context in which it is defined. The closure can then refer to and modify the values of those constants and variables from within its body, even if the original scope that defined the constants and variables no longer exists.*

<aside class ="notes">
Variables, functions and closures have a scope. This scope determines if we can access any of them. Simply if a variable, function or closure isn't in a scope, we can access it.
</aside>

<!-- v -->

```Swift
let location = "San Francisco"
let explore = {
    print("Exploring \(location)")
}

explore()
```

<aside class = "notes">
The closure assigned to "explore" closes over the local variable "location" since it is available in the scope that the closure is defined in. We can access the constant without declaring it locally inside the closure.
</aside>

<!-- v -->

Here's another example of closures closing over variables.

```Swift
func addScore(_ points: Int) -> Int
{
    let score = 42
    let calculate = {
        return score + points
    }
    return calculate()
}

let value = addScore(11)
print(value)
```

<!-- > -->

## Trailing Closure Practice

- [Closures 02 - Replit](https://replit.com/team/MOB13/Closures-02)

<!---
func giveAdvice(action:(String, String) -> String) {
    print("When working from home...")
    print(action("Adriana", "follow a daily schedule."))
}

giveAdvice{(passenger:String, destination:String) -> String in
    return "\(passenger)'s advice is to \(destination)"
}
--->

<!-- > -->

## Self Study

<iframe src="https://youtube.com/embed/tRK0sGymo24" data-autoplay  width="700" height="500"></iframe>

<!-- > -->

<iframe src="https://youtube.com/embed/6nN2YFQQY4A" data-autoplay  width="700" height="500"></iframe>

<!-- > -->

## Escaping and non escaping closures

Closures come in two different variants - **escaping** and **non-escaping**.

When a closure is escaping it means that the closure will outlive, or leave the scope that you’ve passed it to.

Non-escaping closures are called within the function it was passed into.

<aside class ="notes">
An example of an escaping closure is a completion handler. It’s executed in the future, after a lengthy task completes, so it outlives the function it was created in.
</aside>

<!-- > -->

In an **escaping closure**, the lifecycle looks like this:

1. Passing the closure to a function as argument
1. Function performs a task
1. Return compiler back
1. The closure runs asynchronously

<aside class ="notes">
This means that the closure outlives the function (it is called after the function has returned).

By default, all closures are non escaping. This helps with memory management.
</aside>

<!-- v -->

![escaping](assets/escaping.jpg)

<!-- > -->

In a **non escaping closure**, the lifecycle looks like this:

1. Passing the closure to a function as argument
1. Function performs a task
1. Running the closure
1. Return compiler back

<aside class ="notes">
A non-escaping closure does not outlive the function from where it was called.
</aside>

<!-- v -->

![nonescaping](assets/nonescaping.jpg)

<!-- > -->

## Completion handler practice

- [Closures 03 - Replit](https://replit.com/team/MOB13/Closures-03)

<!--

## Creating an analogy

In groups of 4

Now that we know more about closures. Create an analogy that will help you remember how they work.

Think about what makes them special.<br>
Maybe differentiate between escaping and non-escaping?<br>
How they work as completion handlers?

Share with the rest of the class via slack.

-->

<!-- > -->

## Completion Handlers

Download [this working example](https://github.com/dmlebron/tutorial_closures) and look at the code to find out how closures are being used to pass data between view controllers<br>

Identify:
- **Q:** What does the app do?<br>
- **Q:** Where are closures being used?<br>

<!-- > -->

## Closures Practice using HOF

- [HOF with closures: Closures 04 - Replit](https://replit.com/team/MOB13/Closures-04)
- [Shorthand arguments: Closures 05 - Replit](https://replit.com/team/MOB13/Closures-4)

<!-- > -->

## Additional Resources
1. [Closing over - diagram and article](https://learnappmaking.com/closures-swift-how-to/#capturing)
1. [Completion Handler](https://www.agnosticdev.com/content/how-define-swift-completion-handlers)
1. [Completion Handlers - article](https://www.bobthedeveloper.io/blog/completion-handlers-in-swift-with-bob)
1. [Capture lists - article](https://www.bobthedeveloper.io/blog/swift-capture-list-in-closures)
1. [Capturing with closures - article](https://www.swiftbysundell.com/posts/capturing-objects-in-swift-closures)
1. [Completion handlers - article](https://grokswift.com/completion-handlers-in-swift/)
1. [All on closures - article with examples](https://www.programiz.com/swift-programming/closures#simple)
