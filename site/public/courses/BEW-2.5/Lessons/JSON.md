# 📜 Day 6: Working with JSON

### ⏱ Lesson Plan

- [[**20m**] 💬 Review Web Scraper Worksheet](#20m--review-web-scraper-worksheet)
- [[**05m**] 🏆 Objectives](#05m--objectives)
- [[**30m**] 📖 Overview: Serialization](#30m--overview-serialization)
  - [What is Serialization?](#what-is-serialization)
  - [An Analogy](#an-analogy)
  - [New Packages](#new-packages)
  - [Basic Data Types](#basic-data-types)
  - [Slices & Maps](#slices--maps)
  - [Structs](#structs)
- [[**15m**] 🌴 Break](#15m--break)
- [[**50m**] 🧪 Lab Time / Q + A](#50m--lab-time--q--a)
- [📚 Resources & Credits](#-resources--credits)

## [**20m**] 💬 Review Web Scraper Worksheet

Break into groups of 4 and get feedback on your worksheets.

## [**05m**] 🏆 Objectives

1. Encode and decode `struct`s into JSON.

## [**30m**] 📖 Overview: Serialization

In our Web Scraper project, one of the requirements is to encode the `struct` that stores our data into JSON, then save it to a file.

We already know how to save to a file using functions found in the `os` package. We'll learn how to do the rest today!

### What is Serialization?

According to [Wikipedia](https://en.wikipedia.org/wiki/Serialization):

> The process of **translating data structures or object state into a format that can be stored** (for example, in a file or memory buffer) **or transmitted** (for example, across a network connection link) and **reconstructed later** (possibly in a different computer environment).

We will have to _serialize_ our `struct` into JSON format in order to store our web scraping results.

### An Analogy

**SCENARIO**: You've got an idea and you want to describe it to your friend. Unfortunately, you're at home. Your friend is somewhere else. You decide to write an email, describing your idea, and send it to your friend.

---

See what happened here? *Real life is just like coding!*

**You serialized the stuff in your head into an email**, something that can be **transmitted, stored, rendered and finally read** by your friend.

When **your friend reads your email**, they in turn **de-serialize the message content** in order to understand your idea in their own minds!

### New Packages

We'll need to `import` the `"encoding/json"` package in order to get started.

### Basic Data Types

First, let's look at what happens when we marshal basic data types into JSON:

```golang
package main

import (
    "encoding/json"
    "fmt"
)

func main() {
            aBoolValue, _ := json.Marshal(true)
            fmt.Println(string(aBoolValue))

            anIntValue, _ := json.Marshal(1)
            fmt.Println(string(anIntValue))

            aFloatValue, _ := json.Marshal(2.34)
            fmt.Println(string(aFloatValue))

            aStringValue, _ := json.Marshal("BEW 2.5")
            fmt.Println(string(aStringValue))
}
```

What do you think the output will be for each `Println` statement? Write down your answers.

### Slices & Maps

```golang
        fruitSlice := []string{"apple", "peach", "pear"}
        fruitJSON, _ := json.Marshal(fruitSlice)
        fmt.Println(string(fruitJSON))

        totalFruitsMap := map[string]int{"apple": 5, "lettuce": 7}
        totalFruitsJSON, _ := json.Marshal(totalFruitsMap)
        fmt.Println(string(totalFruitsJSON))
```

What do you think the output will be for each `Println` statement? Write down your answers.

### Structs

Use tags on struct field declarations to customize the encoded key names output in your JSON. Here's an example:

```golang
type FruitList struct {
        Page   int      `json:"page"`
        Fruits []string `json:"fruits"`
}

fruitList := &FruitList{
  Page:   1,
  Fruits: []string{"apple", "peach", "pear"}}
fruitJSON, _ := json.Marshal(fruitList)
fmt.Println(string(fruitJSON))
```

What do you think will be output in this case? Write down your answer.
What do you think will change if the `json:` struct field declaration were to be removed?

## [**15m**] 🌴 Break

## [**50m**] 🧪 Lab Time / Q + A

- *SSG v1.1 & 1.2*
- *Web Scraper Project*

## 📚 Resources & Credits

- [**GoByExample**: JSON](https://gobyexample.com/json)
- [**Quora**: Why do we serialize data?](https://quora.com/Why-do-we-serialize-data)
