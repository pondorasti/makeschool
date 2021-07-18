# 📜 Day 3: Project #1 - Static Site Generator

### 🕑Agenda

1. [[**05m**] 🏆 Objectives](#05m--objectives)
2. [[**10m**] 💻 Warm Up: Explore SSGs](#10m--warm-up-explore-ssgs)
3. [[**10m**] 📖 Overview: Static Sites & Generators](#10m--overview-static-sites--generators)
4. [[**10m**] 📖 Starting a New Project](#10m--starting-a-new-project)
5. [[**05m**] 📖 Building, Running, & Installing](#05m--building-running--installing)
6. [[**10m**] 📖 CLIs & Standard Input/Output (I/O)](#10m--clis--standard-inputoutput-io)
7. [[**15m**] 🌴 BREAK](#15m--break)
8. [[**10m**] 📖 Reading & Writing to the Filesystem](#10m--reading--writing-to-the-filesystem)
9. [[**10m**] 📖 Working with Templates](#10m--working-with-templates)
10. [[**65m**] 💻 Activity: Complete MVP](#65m--activity-complete-mvp)
11. [[**15m**] 📖 Project Checkin](#15m--project-checkin)
12. [📚 Resources & Credits](#-resources--credits)

## [**05m**] 🏆 Objectives

1. Define what a _Static Site Generator_ is, and what it's best-fit use cases are.
1. Demonstrate setting up a Golang project in an IDE.
1. Explore packages in the standard library that read and write to the command line, enable file access, and custom templating.
1. Apply the syntax rules from the tutorial in a real world project.


## [**10m**] 💻 Warm Up: Explore SSGs

First, write down as many differences you can think of between static sites and dynamic sites.

Then, use [staticgen.com](https://www.staticgen.com/) to research the following questions. If you have extra time, discuss your answers with your peers.

1. What problem(s) can a static site generator solve?
2. As a developer, what could you use a static site generator for?

## [**10m**] 📖 Overview: Static Sites & Generators

### Static vs. Dynamic Websites

Four key differences from dynamic sites:

- No server-side language
- No database
- Composed of only HTML, CSS, and JavaScript
- Site files are delivered to the end user exactly as they are on the server

### Static Site Generators (SSGs)

- Intermediary between static and dynamic sites
- Run a command to turn text files into HTML pages
- Commit the generated, static HTML pages to GitHub
- Serve the HTML from GitHub Pages

### Use Cases

- Blogs
- Portfolios
- Marketing Websites
- Course Websites _(like this one!)_
- Research Journals
- Daily Development Logs

### Advantages of SSGs

- Speed
- Security
- Content can be version controlled
- Don't have to deal with a server
- Can handle lots of sudden internet traffic

### Disadvantages of SSGs

- No real-time content
- No user input
- No administrative user interface

_David Walsh blogs more about the specifics in [An Introduction to Static Site Generators](https://davidwalsh.name/introduction-static-site-generators). Be sure to read over this before you start your project!_

## [**10m**] 📖 Starting a New Project

Follow the [Getting Started](https://github.com/Make-School-Labs/makesite#getting-started) section of the project `README`.

## [**05m**] 📖 Building, Running, & Installing

Execute the following in command in your project's root directory:

To build your program, run:

```bash
go build
```

To run the latest build:

```bash
./makesite
```

To install it for use system wide, run:

```bash
go install
```


## [**10m**] 📖 CLIs & Standard Input/Output (I/O)

### Writing to Standard Out (stdout)

- `fmt.Print()`
- `fmt.Println()`
- `fmt.Sprintf()`

### Reading from Standard In (stdin)

- `flag` package offers a standard library for parsing command line input.
- Defined using `flag.String()`, `Bool()`, `Int()`, etc.
- Syntax: `-example`, `-example=text`, `-example text`.
- Both `-` and `--` may be used for flags.

#### Example

```golang
examplePtr := flag.String("example", "defaultValue", " Help text.")
```

`examplePtr` will reference the value for either `-example` or `--example`.

The initial value at `*examplePtr` is `defaultValue`.

Calling `flag.Parse()` will parse the command line input and write the value following `-example` or `--example` to `*examplePtr`.

## [**15m**] 🌴 BREAK

## [**10m**] 📖 Reading & Writing to the Filesystem

### Reading a File

```golang
package main

import (
      "fmt"
      "io/ioutil"
)

func main() {
        fileContents, err := ioutil.ReadFile("first-post.txt")
        if err != nil {
            // A common use of `panic` is to abort if a function returns an error
            // value that we don’t know how to (or want to) handle. This example
            // panics if we get an unexpected error when creating a new file.
            panic(err)
        }
        fmt.Print(string(fileContents))
}
```

### Writing a File

```golang
package main

import (
      "fmt"
      "io/ioutil"
)

func main() {
        bytesToWrite := []byte("hello\ngo\n")
        err := ioutil.WriteFile("new-file.txt", bytesToWrite, 0644)
        if err != nil {
            panic(err)
        }
}
```

## [**10m**] 📖 Working with Templates

### Storing the Data

```golang
type entry struct {
  Name string
  Done bool
}

type ToDo struct {
  User string
  List []entry
}
```

### Creating a Template

```html
<!DOCTYPE html>
<html>
  <head>
    <title>Go To-Do list</title>
  </head>
  <body>
    <p>
      To-Do list for user: {{ .User }}
    </p>
    <table>
        <tr>
          <td>Task</td>
          <td>Done</td>
      </tr>
        {{ with .List }}
          {{ range . }}
            <tr>
                  <td>{{ .Name }}</td>
                  <td>{{ if .Done }}Yes{{ else }}No{{ end }}</td>
            </tr>
          {{ end }}
        {{ end }}
    </table>
  </body>
</html>
```

### Writing a Template to Standard Out (stdout)

```golang
package main

import (
        "html/template"
        "os"
)

type entry struct {
        Name string
        Done bool
}

type ToDo struct {
        User string
        List []entry
}

func main() {
        t := template.Must(template.New("template.tmpl").ParseFiles("new.html"))
        err = t.Execute(os.Stdout, todos)
        if err != nil {
          panic(err)
        }
}
```

## [**65m**] 💻 Activity: Complete MVP

Complete the MVP as described in the [requirements](https://github.com/make-school-labs/makesite) in the order they appear. If you finish early, move on to the stretch challenges.

Return 15 minutes before the end of class for your project status update.

## [**15m**] 📖 Project Checkin

Students will check in with the instructor on the status of their MVP.

_This is a great time to ask questions or get unblocked so you can make progress before our next class!_

## 📚 Resources & Credits

- [**Static Site Generators: Modern Tools for Static Website Development**](https://www.oreilly.com/web-platform/free/files/static-site-generators.pdf) - A free eBook all about modern-day static website development, and the backend tools required.
- [**David Walsh: An Introduction to Static Site Generators**](https://davidwalsh.name/introduction-static-site-generators) - A detailed look at the features, advantages, and disadvantages of static site generators.
- [**Go By Example**: Reading Files](https://gobyexample.com/reading-files)
- [**Go By Example**: Writing Files](https://gobyexample.com/writing-files)
- [**Go By Example**: Panic](https://gobyexample.com/panic)
- [**GopherAcademy**: Using Go Templates](https://blog.gopheracademy.com/advent-2017/using-go-templates/)
- [**rapid7.com**: Building a Simple CLI Tool with Golang](https://blog.rapid7.com/2016/08/04/build-a-simple-cli-tool-with-golang/)
