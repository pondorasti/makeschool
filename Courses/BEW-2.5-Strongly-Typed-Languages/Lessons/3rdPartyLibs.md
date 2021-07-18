# 📜 Day 5: Fast Functionality Via 3rd Party Libraries

<!-- omit in toc -->
## ⏱ Agenda

- [[**30m**] ☀️ Warm Up](#30m-️-warm-up)
- [[**15m**] 💻 Activity: Review, Reflect, Resubmit](#15m--activity-review-reflect-resubmit)
- [[**10m**] 🌴 Break](#10m--break)
- [[**20m**] 📖 Overview: Intro to Using 3rd Party Libs](#20m--overview-intro-to-using-3rd-party-libs)
  - [How Go Packages & Modules Work](#how-go-packages--modules-work)
  - [How Do I Know Where This Stuff Is?](#how-do-i-know-where-this-stuff-is)
  - [Creating a Module](#creating-a-module)
  - [Adding 3rd Party Dependencies](#adding-3rd-party-dependencies)
  - [Configuring .gitignore](#configuring-gitignore)
  - [How to Find Other People's Modules](#how-to-find-other-peoples-modules)
- [[**25m**] 💻 Activity: Add Modules Support to Your SSG](#25m--activity-add-modules-support-to-your-ssg)
- [📚 Resources & Credits](#-resources--credits)


## 🏆 Objectives

|   Level   | Verbs |
| --------- | ----- |
| 6: Create | design, formulate, build, invent, create, compose, generate, derive, modify, develop |
| 5: Evaluate | choose, support, relate, determine, defend, compare, contrast, justify, support, convince, select |
| 4: Analyze | classify, break down, categorize, analyze, diagram, illustrate, criticize, simplify, associate |
| 3: Apply | calculate, predict, apply, solve, illustrate, use, demonstrate, determine, model, perform, present |
| 2: Understand | describe, explain, paraphrase, restate, summarize, contrast, interpret, discuss |
| 1: Remember | list, recite, outline, define, name, match, quote, recall, identify, label, recognize |

## [**30m**] ☀️ Warm Up

Complete [Structs & While Loops](WarmUps.md#30m-️-warm-up-2-structs--while-loops) warmup.

## [**15m**] 💻 Activity: Review, Reflect, Resubmit

It's time to breakout into teams of 3 and review each other's solutions.

When you enter the breakout room, be sure to share your screen with each other to pair program / get help.

If you fix your solution, you can resubmit it for grading by the end of the class period!

## [**10m**] 🌴 Break

## [**20m**] 📖 Overview: Intro to Using 3rd Party Libs

### How Go Packages & Modules Work

**Workspace**: A directory on your system where Go looks for source code files, manages dependency packages and build distribution binary files. Whenever a Go program encounters an import statement, it looks for the package in the Go's standard library's `src` directory, located in `$GOROOT`.

**Package**: A directory inside your Go workspace containing one or more Go source files, or other Go packages. Every Go source file belongs to a package. To declare a source file to be part of a package, we use the following syntax:

```golang
package <package_name>
```

**Module**: A collection of Go packages stored in a file tree with a go. mod file at its root. The `go.mod` file defines the module's module path, which is also the import path used for the root directory, and its dependency requirements, which are the other modules needed for a successful build.

### How Do I Know Where This Stuff Is?

Run `go env` on your system now.

Find the following environment variables and write down their values:

-  `GOROOT`
-  `GO111MODULE`
-  `GOPATH`

### Creating a Module

 To initialize our project to use modules:

```bash
go mod init github.com/GITHUB_USERNAME/GITHUB_REPO_NAME
```

**NOTE**: The GitHub repository does not have to exist yet. **Discuss why**.

### Adding 3rd Party Dependencies

```bash
go mod download <package_url>
```

### Configuring .gitignore

- It's common to add the `vendor/` directory to your `.gitignore` file. [gitignore.io](http://gitignore.io/api/go)'s base `.gitignore` file for Golang is as follows:

```txt
# Created by https://www.gitignore.io/api/go
# Edit at https://www.gitignore.io/?templates=go

### Go ###
# Binaries for programs and plugins
*.exe
*.exe~
*.dll
*.so
*.dylib

# Test binary, built with `go test -c`
*.test

# Output of the go coverage tool, specifically when used with LiteIDE
*.out

# Dependency directories (remove the comment below to include it)
# vendor/

### Go Patch ###
/vendor/
/Godeps/

# End of https://www.gitignore.io/api/go
```

### How to Find Other People's Modules

- https://pkg.go.dev provides:
  - Centralized information for Go packages and modules published on index.golang.org.
  - Essential learning resources
  - Critical use cases & case studies
- https://github.com/topics/go: GitHub Topics for Golang
- https://search.gocenter.io: Quickly searchable index of packages
- https://twitter.com/RealGophersShip: Twitter bot that highlights Golang package releases.

## [**25m**] 💻 Activity: Add Modules Support to Your SSG

Complete the first requirement in the [v1.2 Checklist](https://github.com/Make-School-Labs/makesite#v12) by adding Go Modules support to your project. Use [this tutorial](https://tutorialedge.net/golang/go-modules-tutorial/) as a guide.

## 📚 Resources & Credits

- https://go.dev/about
- https://blog.golang.org/using-go-modules
- https://www.callicoder.com/golang-packages/
- https://medium.com/rungo/working-in-go-workspace-3b0576e0534a
