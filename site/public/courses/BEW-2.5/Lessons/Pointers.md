<!-- Run this slideshow via the following command: reveal-md README.md -w -->
<!-- .slide: data-background="./../Slides/images/header.svg" data-background-repeat="none" data-background-size="40% 40%" data-background-position="center 10%" class="header" -->
# Pointers

<!-- omit in toc -->
## ⏱ Agenda

1. [[**20m**] ☀️ **Warm Up**: Deep Thoughts on Variables](#%5B%2a%2a20m%2a%2a%5D-%E2%98%80%EF%B8%8F-%2a%2awarm-up%2a%2a%3A-deep-thoughts-on-variables)
1. [[**30m**] 💬 **TT**: Pointers](#%5B%2a%2a30m%2a%2a%5D-%F0%9F%92%AC-%2a%2att%2a%2a%3A-pointers)
   1. [How RAM Works (Whiteboard)](#how-ram-works-%28whiteboard%29)
   1. [Pointer Definition](#pointer-definition)
   1. [Pointers Analogy: URLs](#pointers-analogy%3A-urls)
   1. [When To Use Pointers](#when-to-use-pointers)
   1. [Pointers in Golang](#pointers-in-golang)
      1. [Operators: `*` and `&`](#operators%3A-%60%2a%60-and-%60%26%60)
      1. [Declaring and Initializing Pointers](#declaring-and-initializing-pointers)
      1. [Rewriting the Warmup Using Pointers](#rewriting-the-warmup-using-pointers)
1. [[**10m**] 🌴 **BREAK**](#%5B%2a%2a10m%2a%2a%5D-%F0%9F%8C%B4-%2a%2abreak%2a%2a)
1. [[**30m**] 💻 **Activity**: Pointer Drills](#%5B%2a%2a30m%2a%2a%5D-%F0%9F%92%BB-%2a%2aactivity%2a%2a%3A-pointer-drills)
<!-- > -->

<!-- omit in toc -->
<!-- ## 🏆 Objectives

| Level         | Verbs                                                                                              |
| ------------- | -------------------------------------------------------------------------------------------------- |
| 6: Create     | design, formulate, build, invent, create, compose, generate, derive, modify, develop               |
| 5: Evaluate   | choose, support, relate, determine, defend, compare, contrast, justify, support, convince, select  |
| 4: Analyze    | classify, break down, categorize, analyze, diagram, illustrate, criticize, simplify, associate     |
| 3: Apply      | calculate, predict, apply, solve, illustrate, use, demonstrate, determine, model, perform, present |
| 2: Understand | describe, explain, paraphrase, restate, summarize, contrast, interpret, discuss                    |
| 1: Remember   | list, recite, outline, define, name, match, quote, recall, identify, label, recognize              | --> |

<!-- > -->

## [**20m**] ☀️ **Warm Up**: Deep Thoughts on Variables

1. What is a variable?
2. What part(s) of a variable are stored?
3. Where are these things stored in the computer?
4. Predict the output of the code snippet below. **Justify your answer.**

```go
func zero(x int) {
  x = 0
}

func main() {
  x := 5
  zero(x)
  fmt.Println(x)
}
```

## [**30m**] 💬 **TT**: Pointers

> **We use pointers because it's easier to give someone an address to your home than to give a copy of your home to everyone.**<br>–  [Rishi Dua](https://stackoverflow.com/users/1866159/rishi-dua)  _Oct 4 '13 at 14:51_

### How RAM Works (Whiteboard)

- Imagine a sequence of boxes, placed one after another in a line.
- Each box is labeled with a unique number, which increments sequentially; this is the address of the box, its memory location.
- Each box can fit only one value.
- That value can be an integer, or a string, or an instance of a `struct` with 100 defined fields.
- If you know the memory address of a box, you can go to that box and see what's inside.
- You can place a new value in that box; anything that was inside the box vanishes and is replaced by the new value.

### Pointer Definition

- Pointers are a way of getting an indirect reference to another variable.
- Variables hold _values_. Pointers hold the _address_ where the variable's values are stored in memory.
- Pointers allow us to access or modify the original value of a variable from anywhere in the program.

### Pointers Analogy: URLs

Pointers exist all over the place in the real world.

A great example are links on any web page!

A link on any page points to another page on the internet. When you copy the link and paste it into another web page, both links will point to the same, original web page. If the webmaster modifies that web page, the links will yield the new, updated page.

### When To Use Pointers

- Pointers are important in many data structures whose design requires the ability to link or chain one "node" to another efficiently. You would not "choose" a pointer over say a normal data type like float, they simply have different purposes.
- Pointers are useful where you require high performance and/or compact memory footprint.

### Pointers in Golang

#### Operators: `*` and `&`

- Pointers are declared using an asterisk (`*`) followed by the type of the stored value.
- An asterisk is also used to _dereference_ pointer values. Dereferencing a pointer returns the value stored at the address the pointer is holding.
- The `&`  operator finds the address of a variable.

#### Declaring and Initializing Pointers

Pointers can be declared for addresses with primitive types, as well as structs, slices, maps, functions, and even other pointers!


```go
package main

import "fmt"

func main() {
    var x int = 5748

    // declare pointer
    var p *int

    // initialize pointer
    p = &x

   // displaying the result
    fmt.Println("Value stored in x = ", x)
    fmt.Println("Address of x = ", &x)
    fmt.Println("Value stored in variable p = ", p)
```

QUESTION: Comment out the line where the pointer is initialized, then run the program again. What is the value stored in `p`?

#### Rewriting the Warmup Using Pointers

When we call any function with an argument in Golang, that argument is copied to the function. The `zero` function cannot modify the original `x` variable declared in the `main` function, so `x` still equals `5`.

**What if we wanted to modify the original variable?**

We could use a pointer!

```go
func zero(xPtr *int) {
  *xPtr = 0
}
func main() {
  x := 5
  zero(&x)
  fmt.Println(x) // x is 0
}
```
<!-- > -->




## [**10m**] 🌴 **BREAK**

## [**45m**] 💻 **Activity**: Pointer Drills

Visit Gradescope and begin working on `Drill 3: Pointers`.

<!-- > -->

<!-- omit in toc -->
## 📚 Resources & Credits

- [Pointers in Golang - GeeksforGeeks](https://www.geeksforgeeks.org/pointers-in-golang/)
- [An Introduction to Programming in Go / Pointers](https://www.golang-book.com/books/intro/8)
