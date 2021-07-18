# Benchmarking & Testing

| **Elapsed** | **Time**  | **Activity**              |
| ----------- | --------- | ------------------------- |
| 0:00        | 0:05      | Why / Objectives          |
| 0:05        | 0:20      | Overview                  |
| 0:25        | 0:30      | In Class Activity I       |
| 0:55        | 0:10      | BREAK                     |
| 1:05        | 0:30      | In Class Activity II      |
| 1:35        | 0:20      | Lab Time                  |
| 1:55        | 0:05      | Wrap Up                   |

<img src="https://www.gopherguides.com/assets/images/logos/logo.svg" height="300" style="position: absolute; right: 0; top: 55px;">

## Why You Should Know This (2 min)

Performance is an important factor in your applications! Today's lesson focuses on tools and techniques that help you **find broken, slow, or inefficient code faster than ever**. Benchmarking and testing are techniques that yield the kind of code that impresses peers and colleagues alike!

## Learning Objectives (3 min)

1. Identify and describe testing and benchmarking techniques that speed up your project.
2. Define `benchmark test` and `table test` and describe how they can be used together to improve the code quality of your project.
3. Implement benchmarking and testing via two in-class mini-tutorials.
4. Explore how to incorporate benchmarking and testing in your MakeUtility project.

## Overview/TT (20 min)

### Table-Driven Tests

#### Definition

> _(noun)_ **Table-Driven Test**<br>
> A **complete test case** with **inputs and expected results**. Sometimes, additional information such as a test name may be included to make the test output easily readable.

If you ever find yourself using copy and paste when writing a test, think about whether refactoring into a table-driven test or pulling the copied code out into a helper function might be a better option.

#### Examples

Example of a **basic table-driven test**:

```go
func TestDivision(t *testing.T) {
    tests := []struct{
        x      float64
        y      float64
        result float64
        err    error
    }{
        { x: 1.0, y: 2.0, result: 0.5, err: nil },
        { x: -1.0, y: 2.0, result: -0.5, err: nil},
        { x: 1.0, y: 0.0, result: 0.0, err: ErrZeroDivision},
    }
    for _, test := range tests {
        result, err := divide(test.x, test.y)
        assert.IsType(t, test.err, err)
        assert.Equal(t, test.result, result)
    }
}
```

Example with **named test cases**:

```go
tests := map[string]struct {
    number int
    smsErr error
    err    error
}{
    "successful":       {0132423444, nil, nil},
    "propagates error": {0132423444, sampleErr, sampleErr},
}
```

### Benchmark Tests

#### Definition

> _(noun)_ **Benchmark Test**<br>
> A test designed or used to **establish a point of comparison** for the **performance or effectiveness** of something, especially computer hardware or software.

#### Example

```go
func BenchmarkFoo(b *testing.B) {
    for i := 0; i < b.N; i++ {
        // TODO: Perform the operation we're analyzing.
    }
}
```

## In Class Activity I (30 min)

1. Create a **new GitHub repo and clone it** locally.
2. **Complete the [Introduction to Testing in Go](https://tutorialedge.net/golang/intro-testing-in-go/) mini-tutorial**.
3. **Commit and push** your code to GitHub.

## BREAK (10 min)

## In Class Activity II (30 min)

1. Using the same repository as earlier, **complete the [Introduction to Benchmarking Your Go Programs](https://tutorialedge.net/golang/benchmarking-your-go-programs/) mini-tutorial**.
2. **Commit and push** your code to GitHub.
3. **Slack the link** to the class channel to indicate that you've completed both tutorials.

### Stretch Challenges

1. What is a **golden file**? How could a developer **incorporate a golden file into their existing projects**?
2. What is **mocking**? What **data structures complement** mocking? How could a developer implement mocking  to create **more accurate test scenarios**?
3. What are **test fixtures**? How could you use Golang to **automatically load test fixtures**?
4. Should you use the `_test` package in your project? Why or why not?

## Wrap Up (5 min)

Consider how you can practically apply the techniques discussed in class today to improve the code quality and performance of your MakeUtility project!

## Additional Resources

1. **[Beautifully Simple Benchmarking in Go](https://www.soroushjp.com/2015/01/27/beautifully-simple-benchmarking-with-go/)**: Read this first, then dive deep with the next link!
2. **[Writing Table Driven Tests in Go](https://dave.cheney.net/2013/06/09/writing-table-driven-tests-in-go)**: A short introduction to the mechanics and syntax of writing a table driven test in Go.
3. **[How to Write Benchmarks in Go](https://dave.cheney.net/2013/06/30/how-to-write-benchmarks-in-go)**: Continues the series on the `testing` package linked above.
4. **[Practical Go Benchmarks](https://stackimpact.com/blog/practical-golang-benchmarks/)**: This collection of practical performance benchmarks of Go packages and algorithms aims to help developers write fast and efficient programs.
5. **[Analyzing the Performance of Go Functions with Benchmarks](https://medium.com/justforfunc/analyzing-the-performance-of-go-functions-with-benchmarks-60b8162e61c6)**: Compares the performance metrics of three different merging techniques with `n` channels in Go.
6. **[go-gophers/gophers](https://github.com/go-gophers/gophers)**: Gophers is a tool for API testing. It covers unit testing of individual components, functional testing of broader scenarios, and generation of up-to-date examples for documentation from testing scenarios.
