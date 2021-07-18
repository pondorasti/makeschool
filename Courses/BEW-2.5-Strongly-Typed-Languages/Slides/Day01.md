<img src="https://raw.githubusercontent.com/ashleymcnamara/gophers/master/RickAndMorty.png" height="400" style="background:none; border: 0 none; box-shadow: none;">

# Intro to Golang

**BEW2.5**<br>_Patterns & Practices in Strongly Typed Ecosystems_

---

<img src="https://raw.githubusercontent.com/ashleymcnamara/gophers/master/TEACHING_GOPHER.png" height="300" style="background:none; border: 0 none; box-shadow: none;">

## Objectives (5 Minutes)<br>

1. Complete course overview and **syllabus review**.
1. Learn why engineers are excited about **Golang**.
1. **Install Go locally** and write our **first application**.

---

<img src="https://raw.githubusercontent.com/ashleymcnamara/gophers/master/GOPHER_LAPTOP.png" height="300" style="background:none; border: 0 none; box-shadow: none;">

## Course Overview (25 Minutes)<br>

* We will use Go to **solve common problems** experienced **at Make School**.

* By the end of the course, you'll have a **complete suite of `makeschoolutils` that solve numerous problems found in industry**.

~~~

### Syllabus

Visit [make.sc/bew2.5](make.sc/bew2.5) for the latest syllabus.

All class materials can be found at the above shortlink.

~~~

### Textbooks

* Syntax: [Effective Go](https://golang.org/doc/effective_go.html)
* Recipes: [Go by Example](https://gobyexample.com)

~~~

### Tutorial

#### MakeFeedback

_Coming soon!_

<img src="assets/img/tutorial-mockup.svg" height="400" style="border: none; background: none;">

~~~

### Homework

**~5 hours** of homework:

1. **Gophercises**: [_Link Shortener_](https://gophercises.com/exercises/urlshort)
1. **Gophercises**: [_Quiet HN_](https://gophercises.com/exercises/quiet_hn)
1. **Gophercises**: [_Image Transform Service_](https://gophercises.com/exercises/transform) _(BONUS)_

<img src="assets/img/quiet-hn.png" height="350" style="border: none; background: none;">
<img src="assets/img/img-transform-svc.png" height="350" style="border: none; background: none;">
<img src="assets/img/shorturl.png" height="350" style="border: none; background: none;">

~~~

### Final Project

#### `makeutility`

Create your own utility and integration using Go!

~~~

### Grading Criteria

**_TO PASS, ALL SUBMITTED WORK MUST..._**

1. Be **complete**.
1. Score a **B or higher** on **[Go Report Card](https://goreportcard.com)**.
1. Have **10 or more commits** in a public GitHub repo.

~~~

### Q&A

---

<img src="https://raw.githubusercontent.com/ashleymcnamara/gophers/master/GoCommunity.png" height="240" style="background:none; border: 0 none; box-shadow: none;">

## Why Go? (5 Minutes)<br><br>

<table>
  <tr>
    <td>GoDoc</td>
    <td>Static code analysis</td>
  </tr>
  <tr>
    <td>Built-in testing and profiling framework</td>
    <td>Race condition detection</td>
  </tr>
  <tr>
    <td>Learning curve</td>
    <td>Reflection</td>
  </tr>
  <tr>
    <td>Opinionatedness</td>
    <td>Culture</td>
  </tr>
</table>

---

<img src="https://raw.githubusercontent.com/ashleymcnamara/gophers/master/VS%20CODE%20GOPHER.png" height="400" style="background:none; border: 0 none; box-shadow: none;">

## Syntax Overview (20 Minutes)<br><br>

Let's learn about the syntax of Go using [Devhints](https://devhints.io/go).

---

<img src="https://raw.githubusercontent.com/ashleymcnamara/gophers/master/GOPHER_MIC_DROP.png" height="400" style="background:none; border: 0 none; box-shadow: none;">

## BREAK<br>(10 Minutes)

---

<img src="https://raw.githubusercontent.com/ashleymcnamara/gophers/master/GO_BUILD.png" height="400" style="background:none; border: 0 none; box-shadow: none;">

## Get Started With Go<br>(25 Minutes)

~~~

### Installing Go

1. Visit the [downloads](https://golang.org/dl/) page and choose macOS.
2. Double click the downloaded `.pkg` and install.

<img src="assets/img/download.png" height="275" style="border: none; background: none;">

~~~

### Testing Your Installation

~~~

#### Set Up GOPATH

```bash
cd ~
mkdir go
cd go
```

~~~

#### Hello World

1. `mkdir -p src/hello && cd src/hello`
1. Create a file named `hello.go` and paste the following code:
    ```go
    package main

    import "fmt"

    func main() {
      fmt.Printf("hello, world\n")
    }
    ```
2. Build `hello.go`:
    ```bash
    $ cd $HOME/go/src/hello
    $ go build
    ```
3. Run it:
    ```bash
    $ ./hello
    hello, world
    ```
    If you see the `hello, world` message then your Go installation is working.

~~~

## Congrats!

**You've written, built, and ran your first Go application!**

---

<img src="https://raw.githubusercontent.com/ashleymcnamara/gophers/master/Hugging_Gophers.png" height="240" style="background:none; border: 0 none; box-shadow: none;">

## Daily Deliverable (15 Minutes)

### Personal Learning Objective

* Write **one sentence describing a goal you want to reach by the end of this course**.

* Turn it in to Dani at the **end of the class period**.

* I will be **tracking and discussing this goal** with you **throughout the course**.

---

## Final Challenge

[A Tour of Go](https://tour.golang.org/welcome/1)

---
