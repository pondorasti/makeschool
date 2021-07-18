# 📜 Day 12: Documentation & Deployments

### 🔖 Table of Contents

1. [[**05m**] 🏆 Objectives](#05m--objectives)
2. [[**10m**] 🌤 Warm Up: Comment All the Things](#10m--warm-up-comment-all-the-things)
3. [[**15m**] 💻 Activity: Generate with Godoc](#15m--activity-generate-with-godoc)
   1. [Why Practice This](#why-practice-this)
   2. [Step By Step](#step-by-step)
   3. [Discussion Questions](#discussion-questions)
4. [[**20m**] 📖 Overview: Great Godocs](#20m--overview-great-godocs)
5. [[**10m**] 🌴 BREAK](#10m--break)
6. [[**15m**] 📖 Guide: Deploying on Heroku (APIs, Websites, Bots)](#15m--guide-deploying-on-heroku-apis-websites-bots)
   1. [Step 1: Build](#step-1-build)
   2. [Step 2: Create Heroku Instance](#step-2-create-heroku-instance)
   3. [Step 3: Create Procfile](#step-3-create-procfile)
   4. [Step 4: Declare App Dependencies](#step-4-declare-app-dependencies)
   5. [Step 5: Deploy](#step-5-deploy)
   6. [Step 6: Scale](#step-6-scale)
   7. [Step 7: Test](#step-7-test)
   8. [Step 8: 🎉 Profit](#step-8--profit)
7. [[**15m**] 📖 Guide: Deploying on Homebrew (CLIs)](#15m--guide-deploying-on-homebrew-clis)
   1. [Step 1: Installation & Setup](#step-1-installation--setup)
   2. [Step 2: Initialize](#step-2-initialize)
   3. [Step 3: Build & Upload](#step-3-build--upload)
8. [[**20m**] 💻 Activity: Deploy a Thing!](#20m--activity-deploy-a-thing)
9. [[**05m**] 🌃 Wrap Up / After Class](#05m--wrap-up--after-class)
10. [📚 Resources & Credits](#-resources--credits)
   1. [Package Publishing](#package-publishing)
   2. [Documentation](#documentation)
   3. [Deployment](#deployment)

## [**05m**] 🏆 Objectives

1. Practice and generate standards-based package documentation using Godoc.
2. Configure and release web applications, APIs, and bots written in Go on Heroku.
3. Set up and use Homebrew to release CLIs written in Go.

## [**10m**] 🌤 Warm Up: Comment All the Things

1. Make sure your MakeUtility project is linked in the [Course Tracker](https://make.sc/trackbew2.5)!
1. Open up your MakeUtility project. Add at least 5 comments on any of the following top-level public declarations:

    - Types
    - Variables
    - Constants
    - Functions
    - Packages

## [**15m**] 💻 Activity: Generate with Godoc

### Why Practice This

When you are preparing to publish a package, you should make sure that the documentation looks correct by running a local copy of godoc. Let's try it now!

### Step By Step

1. Double-check to ensure your environment is properly configured. In a standard environment, the following bash variables should be exported at the bottom of your `.bashrc` or `.zshrc` file:

```bash
export GO111MODULE=on
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$GOPATH/src
```

2. Open your terminal and change directory to `~/go/src/yourproject`. Run the following code:

     ```bash
     godoc -http=:6060 &
     ```

3. Visit http://localhost:6060/pkg in your browser. Search for the name of your package, and click the link to access your generated GoDocs.

    **Example**: In my [Gopherology](https://github.com/droxey/gopherology) project, the generated documentation for the public utils package can be found at http://localhost:6060/pkg/github.com/droxey/gopherology/utils.

### Discussion Questions

Once you've completed the activity, prepare to discuss answers to the following questions:

   - What task did running this command accomplish?
   - An ampersand (`&`) appears at the end of the command we ran.
       - What does including the `&` do?
       - What happens if you remove it?
   - Did anything change in the filesystem when we ran Godoc?
   - How does Godoc know what comments to use when generating documentation?

## [**20m**] 📖 Overview: Great Godocs

You should modify your package imports in order to properly generate GoDocs and prepare for any deployment. Here's a handy guide to accomplish this task:

The full import of your package often has something identifying its author _(particularly on hosting sites like GitHub, where `github.com/droxey/...` is the full import)_, should always have the project name, and should end with the name of the package you've developed if it is different from the project name.

For instance, the `gopherology` project provides a `utils` package, and is written by Dani Roxberry, and thus has the following import path:

```bash
import "github.com/droxey/gopherology/utils"
     ^         ^          ^     ^
     |         |          |     `-- Package name
     |         |          `-------- Project name
     |         `------------------- Author's handle
     `----------------------------- Hosting site
```

It is often a good idea to make sure the last directory path (in this case, `utils`) matches the name of the package used by the source files in the directory.

To document a **type, variable, constant, function, or package**, write a regular comment directly preceding its declaration, with no blank line in between. Godoc will show that comment as text alongside the item it documents. For example, this is the documentation for the `fmt` package's [`Fprint`](https://golang.org/pkg/fmt/#Fprint) function:

```golang
// Fprint formats using the default formats for its operands and writes to w.
// Spaces are added between operands when neither is a string.
// It returns the number of bytes written and any write error encountered.
func Fprint(w io.Writer, a ...interface{}) (n int, err error) {
```

Comments on package declarations should provide **general package documentation**. The first sentence of your package's comment is what appears in Godoc's [package list](https://golang.org/pkg/). These comments can be short, like the [`sort` package](https://golang.org/pkg/sort/)'s brief description:

```golang
// Package sort provides primitives for sorting slices and user-defined
// collections.
package sort
```

Top-level comments beginning with `BUG(who)` are recognized as known bugs.

- Known bugs are included in the "Bugs” section of the package docs.
- The "who” part should be the user name of someone who could provide more information.
- For example, this is a known issue from the [bytes package](https://golang.org/pkg/bytes/#pkg-note-BUG):

    ```golang
    // BUG(r): The rule Title uses for word boundaries does not handle Unicode punctuation properly.
    ```

## [**10m**] 🌴 BREAK

## [**15m**] 📖 Guide: Deploying on Heroku (APIs, Websites, Bots)

### Step 1: Build

```bash
go build -o bin/YOUR_PROJECT_NAME -v .
```

### Step 2: Create Heroku Instance

**2a**. Create a Heroku instance for your project:

```bash
heroku create UNIQUE_PROJECT_NAME
```

**2b**. To test that the build in Step 1 worked --- and to ensure a successful deployment on Heroku --- run the application locally via the `heroku local` command:

```bash
heroku local web
```

### Step 3: Create Procfile

In the root of your repository, add a file named `Procfile`, and add the command below on the first line:

```txt
web: bin/YOUR_PACKAGE_NAME
```

### Step 4: Declare App Dependencies

**3a**. Start by initializing your modules. This command creates a `go.mod` file. This file shares similar goals as `package-lock.json` in JavaScript or `requirements.txt` in Python. `go.mod` tells Heroku which packages to install before launching your application.

```bash
go mod init
```

⚠️ **ERRORS? READ THIS**: `go mod init` will often be able to use auxiliary data (such as `git` metadata) to automatically determine the appropriate module path, but if `go mod init` states it can not automatically determine the module path --- or, if you need to otherwise override that path, --- you can supply the module path as an optional argument to `go mod init`. For example:

```bash
go mod init github.com/username/reponame
```

🤔 Want to learn more about how the `go mod` command works? Dive into the [Defining a Module](https://github.com/golang/go/wiki/Modules#how-to-define-a-module) and [Preparing Modules for Release](https://github.com/golang/go/wiki/Modules#how-to-prepare-for-a-release) documentation!

**3b**. For each dependency in your project, run `go get PATH_TO_PACKAGE` to install and save that dependency to `go.mod`.

**3c**. You should also make sure that any unused modules have been removed from your application:

```bash
go mod tidy
```

**3d**. Then, make sure that your build is repeatable and resistant to [erosion](https://devcenter.heroku.com/articles/erosion-resistance) by vendoring any new dependencies:

```bash
go mod vendor
```

### Step 5: Deploy

Deploy by pushing to Heroku:

```bash
git push heroku master
```

### Step 6: Scale

Before testing out our deployment, we'll need to tell Heroku to launch a Dyno for our project:

```bash
heroku ps:scale web=1
```

### Step 7: Test

```bash
heroku open
```

### Step 8: 🎉 Profit

You've successfully released your website, bot, or API to Heroku!

Visit [Heroku: Getting Started With Go](https://devcenter.heroku.com/articles/getting-started-with-go?singlepage=true) to dive deep on each step of the deployment outlined above.

## [**15m**] 📖 Guide: Deploying on Homebrew (CLIs)

Let's get to know another helpful deployment tool,  [Formula Go](https://jkawamoto.github.io/fgo/). Formula Go helps you to build and upload your software written in Go; and then prepares [Homebrew](http://brew.sh/) and [Linuxbrew](http://linuxbrew.sh/) formulae for it.

Formula Go assumes your software is hosted in GitHub, and its compiled binaries are published in GitHub’s release page.

### Step 1: Installation & Setup

Formula Go can be installed via Homebrew or Linuxbrew.

**1a**. Install `fgo` and it's dependencies using the commands below:

```bash
go get github.com/laher/goxc
export GOROOT_BOOTSTRAP=/usr/local/go;
goxc -t -bc=linux,darwin

brew install ghr

brew tap jkawamoto/fgo
brew install fgo
```

**1b**. Create a [new Personal API Token on GitHub](https://github.com/settings/tokens/new) with the following scopes checked:

<img src="https://make-school-courses.github.io/BEW-2.5-Strongly-Typed-Ecosystems/Lessons/img/new-token.png" width="600">

**1c**. Copy the new token to your clipboard.

**1d**. Run the below command to configure your local `git` repository to store the token in your `git` settings:

```bash
git config github.token "PASTE_GITHUB_API_TOKEN_HERE"
```

### Step 2: Initialize

In the root of your repository, run this command to create a `homebrew` directory and generate a Homebrew formula template.

```bash
fgo init –desc="A short description of what your application does."
```

`fgo init` will check your `git` configuration to obtain information about your GitHub user name and repository name, which are required when releasing your application on Homebrew.

### Step 3: Build & Upload

```bash
export GOROOT_BOOTSTRAP=$GOROOT; fgo build VERSION_NUMBER
```

Running `fgo build` will build your application and save the binary to the `pkg` directory. Then, this command uploads the built binary files to GitHub. Finally, after uploading to GitHub, it updates a Homebrew formula in `homebrew` directory.

When debugging, you may need to build your program but not upload it. To do this, run `fgo build` without a version number. Formula Go will then build your program in the `pkg/snapshot` directory without uploading.

We can learn more about the `fgo build` command by running `fgo build --help`:

```bash
$ fgo build --help
NAME:
   fgo build - build binaries, upload them, and update the brew formula.

USAGE:
   fgo build [command options] [version]

DESCRIPTION:
   build command runs build and release targets in the Makefile to build your
software and upload the binary files to GitHub. This command takes an argument,
version, which specifies the version to be created. If it is omitted, "snapshot"
will be used and uploading will be skipped.

To run this command, a GitHub API token is required. Users have to give a token
via one of the -t/--token flag, GITHUB_TOKEN environment variable, and github.token
variable in your .gitconfig.

If -b/--body flag isn't given but your CHANGELOG.md contains a release note
associated with that version, the release note will be copied to the release
page in GitHub.

This command also updates the homebrew formula. After finishing this command,
you need to push the updated formula.

OPTIONS:
   -t TOKEN, --token TOKEN    GitHub API TOKEN for uploading binaries [$GITHUB_TOKEN]
   -b TEXT, --body TEXT       TEXT describing the contents of this release
   -p value, --process value  the number of goroutines (default: 12)
   --delete                   delete release and its git tag in advance if exists
   --draft                    create a draft (unpublished) release
   --pre                      mark this release is a prerelease
```


## [**20m**] 💻 Activity: Deploy a Thing!

1. Choose the deployment method best suited for your MakeUtility project based on what you learned about Heroku and Homebrew during today's class.
2. Spend the remainder the class deploying your MakeUtility project, a Slackbot, an Echo API, or a CLI application!
3. Be sure to choose a project that is fully complete. Alternatively, clone a Golang project repository, like my [Gopherology](https://github.com/droxey/gopherology) project, a classmates' Slackbot or CLI application, or any sample application that is similar to your MakeUtility.

## [**05m**] 🌃 Wrap Up / After Class

- Add a checkmark next to the documentation requirement in your repo's `rubric.md`.
- Commit the documentation you generated before leaving today and the update to your progress.
- Review the [syllabus](https://make.sc/bew2.5) and ensure you are on track to meet all requirements and expectations by the end of the course.
    - _Are you on track to complete 10+ commits in your MakeUtility project?_
    - _Miss a day from class? Review the lesson plan! Did you turn in all participation-based challenges listed in the syllabus?_

## 📚 Resources & Credits

### Package Publishing

- [**Documentation**: Modules](https://github.com/golang/go/wiki/Modules)
- [**Documentation**: Package Publishing](https://github.com/golang/go/wiki/PackagePublishing)

### Documentation

- [**Documentation**: Command godoc](https://godoc.org/golang.org/x/tools/cmd/godoc)
- [**Godoc**: Documenting Go Code (Blog Post)](https://blog.golang.org/godoc-documenting-go-code)

### Deployment

- [Formula Go](https://jkawamoto.github.io/fgo/)
