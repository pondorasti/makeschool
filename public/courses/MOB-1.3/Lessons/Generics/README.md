<!-- Run this slideshow via the following command: -->
<!-- reveal-md README.md -w -->


<!-- .slide: class="header" -->

# Generics

## [Slides](https://make-school-courses.github.io/MOB-1.3-Dynamic-iOS-Apps/Slides/Generics/README.html ':ignore')

<!-- > -->

## Agenda

- Define and use Generics
- Identify Generics in the networking layer
- Lab time

<!-- > -->

## Generics

Generic code = flexible & reusable functions and types that can work with **any type**, based on defined requirements.

Generics are one of the most powrful features of Swift and a lot of the standard library is built with generic code.

<!-- > -->

We've been using generic code since long time ago, think about arrays. 🤔

```swift
@frozen struct Array<Element>
```

The `Array` type is generic – it doesn’t declare any specific data type.

![array](assets/array.jpg)

<!-- > -->

## Generics in action 😎

[Replit demo](https://replit.com/join/oeloewdx-adrianagonzale2)

<!--
func printValues<Element>(fromCollection collection:[Element]){
  for element in collection{
    print(element)
  }
}

let n = [1,2,3,4]
printValues(fromCollection: n)

let m = ["a", "e", "i", "o", "u"]
printValues(fromCollection: m)
-->

<!-- > -->

## Exploring Generics

You can create your own generics. Follow [this replit](https://replit.com/team/MOB13/Generics) to learn how and then complete the challenges.

Start with the README.md file.

<!-- > -->

## 🧐 Reflection Question - 5 min

Why implement **Generics** when we already know about **Inheritance**?

Think about this question and when you are ready, share your answer in the chat.

<!-- > -->

## Generics in the Networking Layer

[Handling the Response](https://www.makeschool.com/mediabook/oa/tutorials/moviefy-app-004/Handling-Response/)

[Making calls](https://www.makeschool.com/mediabook/oa/tutorials/moviefy-app-004/make-the-call/)

<!-- > -->
