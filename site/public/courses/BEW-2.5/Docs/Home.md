# Go Wiki

Welcome to the Go wiki, a collection of information about the [Go Programming Language](https://golang.org/).

[Awesome Go](http://awesome-go.com/) is another great resource for Go programmers, curated by the Go community.


## Table of Contents

1. [Table of Contents](#table-of-contents)
2. [Getting Started With Go](#getting-started-with-go)
3. [Working With Go](#working-with-go)
4. [Learning More About Go](#learning-more-about-go)
5. [Using the Go Toolchain](#using-the-go-toolchain)
6. [Go Programming Wikis](#go-programming-wikis)
7. [Online Services that work with Go](#online-services-that-work-with-go)
8. [Troubleshooting Go Programs in Production](#troubleshooting-go-programs-in-production)

## Getting Started With Go

  - [The Go Tour](http://tour.golang.org) is the best place to start.
  - [Effective Go](https://golang.org/doc/effective_go.html) will help you learn how to write idiomatic Go code.
  - [Go standard library documentation](https://golang.org/pkg/) to familiarize yourself with the standard library.
  - [Use the Go Playground](http://play.golang.org) to test out Go programs in your browser.
  - Still not convinced? Check out this list of [Go Users](Docs/GoUsers) and a few of their [Success stories](Docs/SuccessStories). We've also assembled a long list of reasons [why you should give Go a try](Docs/whygo).
  - Read about the companies which have [switched from other languages to Go](https://github.com/golang/go/wiki/FromXToGo).

## Working With Go

Ready to write some Go code of your own? Here are a few links to help you  get started.

  - Install and Setup your Environment
    - Start here: [Official Installation Documentation](https://golang.org/doc/install)
    - If you prefer to install from source, [read this first](https://golang.org/doc/install/source).
      - [InstallFromSource](Docs/InstallFromSource) - Additional tips on source installs.
    - Windows user? [Install and configure Go, Git and Atom for Windows](https://github.com/abourget/getting-started-with-golang)
    - Mac user? [How I start - Go](https://howistart.org/posts/go/1) - A step-by-step guide to installing Go and building your first web service.
    - Having installation problems? [InstallTroubleShooting](InstallTroubleShooting)
    - Make sure you have your [$GOPATH environment variable set correctly](https://golang.org/doc/install/source#gopath)
      - If you need additional tips on using [$GOPATH, go here](Docs/GOPATH).
    - [MultipleGoRoots](Docs/MultipleGoRoots) - More advanced information on working with multiple go installations and the `$GOROOT` variable.
  - [Go IDEs and Editors](Docs/IDEsAndTextEditorPlugins) - Information on how to use your favorite editor with Go.
  - [Tools for working with Go code](Docs/CodeTools) - Formatting, linting, vetting, refactoring, navigation and visualization.
  - Finding Go Libraries and Packages
    - Start here: [Go open source projects](Docs/Projects).
    - Search for Go packages: [godoc.org](http://godoc.org)
    - Visualization of the [Go open source package graph](https://anvaka.github.io/pm/#/galaxy/gosearch?l=1)
  - [Modules](Docs/Modules) - documentation on the dependency management system built into the Go command, added in 1.11.
  - [Managing your dependencies](Docs/PackageManagementTools) - An overview of the tools you can use to manage third-party packages (vendoring).
  - Publishing Go Packages as Open Source
    - Getting ready to publish your package? [Start here.](Docs/PackagePublishing)
    - [The Go Checklist](https://github.com/matttproud/gochecklist) - A comprehensive guide for publishing a project.
    - [How to layout your GitHub repo](Docs/GitHubCodeLayout) to make it easy to for other Go programmers to use with the `go get` command.
    - [Go Package, Go](https://johnsto.co.uk/blog/go-package-go) - A few recommendations for making Go packages easy to use.

## Learning More About Go

Once you have an overview of the language, here are resources you can use to learn more.

  - [Learning Go](Docs/Learn) - A collection of resources for learning Go - beginner to advanced.
    - [Best Practices for a New Go Developer](https://medium.com/@IndianGuru/best-practices-for-a-new-go-developer-8660384302fc) - Insights from Go community members.
    - [Server programming](Docs/LearnServerProgramming) - Building web, mobile, and API servers.
    - [More on concurrency](Docs/LearnConcurrency)
    - [More on error handling](Docs/LearnErrorHandling)
    - [More on testing](Docs/LearnTesting)
    - [More on mobile - Android and iOS](Docs/Mobile)
  - [Books](Docs/Books) - A list of Go books that have been published (ebook, paper)
  - [Blogs](Docs/Blogs) - Blogs about Go
    - [Podcasts](Docs/Podcasts) - Podcasts and episodes featuring Go
  - Videos, Talks and Presentations
    - [GopherVids](http://gophervids.appspot.com/) is a searchable index of videos about Go.
    - [GoTalks](Docs/GoTalks) - A collection of talks from Go conferences and meetups.
    - [Screencasts](Docs/Screencasts)
  - [Articles](Docs/Articles) - A collection of articles to help you learn more about Go.
  - [Training](Docs/Training) - Free and commercial, online and classroom training for Go.
  - [University Courses](Docs/Courses) - A list of CS programs and classes using Go.
  - [Resources for non-English speakers](Docs/NonEnglish)

## Using the Go Toolchain

  - Start with the standard documentation for the `go` command [available here](https://golang.org/cmd/go/)
  - Start here for to learn about [vendoring](https://golang.org/cmd/go/#hdr-Vendor_Directories).
  - See also [PackageManagementTools](Docs/PackageManagementTools) for package management tools.
  - [Cross Compilation](https://rakyll.org/cross-compilation/)
  - Shared libraries and Go (buildmode)
    - [Go Shared Libraries](https://github.com/jbuberel/buildmodeshared) - Examples for creating and using shared libraries from Go and Python.
    - [Sharing Go Packages with C](http://blog.ralch.com/tutorial/golang-sharing-libraries/) - by [@ralch](https://twitter.com/ralch).
    - [Calling Go libraries from Python](https://blog.filippo.io/building-python-modules-with-go-1-5/) - by Filippo Valsorda
    - [Calling Go libraries from Ruby](http://c7.se/go-and-ruby-ffi/) - by Peter Hellberg
    - [Calling Go libraries from Swift](https://rakyll.org/swift/) - by Jaana Burcu Dogan
    - [Build a Ruby Gem with a Go native extension](http://blog.paracode.com/2015/08/28/ruby-and-go-sitting-in-a-tree) - by @jondot
    - [gohttplib](https://github.com/shazow/gohttplib) - An experiment in using Go 1.5 buildmode=c-shared.
  - See the wikis below for additional details:
    - [GoGetTools](Docs/GoGetTools)
    - [GoGetProxyConfig](GoGetProxyConfig)
    - [cgo](Docs/cgo)
    - [CompilerOptimizations](Docs/CompilerOptimizations)
    - [GccgoCrossCompilation](Docs/GccgoCrossCompilation)
    - [GcToolchainTricks](Docs/GcToolchainTricks)
    - [GoGenerateTools](Docs/GoGenerateTools)
    - [Go Tooling Essentials](https://rakyll.org/go-tool-flags/) - by Jaana Burcu Dogan

## Go Programming Wikis

  - [Why Go doesn't Support Generics: A Summary of Go Generics Discussions](https://docs.google.com/document/d/1vrAy9gMpMoS3uaVphB32uVXX4pi-HnNjkMEgyAHX4N4/preview) - Start here before you join the debate.
  - Concurrency
    - [Timeouts](Docs/Timeouts) - Abandon async calls that take too long
    - [LockOSThread](Docs/LockOSThread)
    - [MutexOrChannel](Docs/MutexOrChannel) - When to use one vs the other
    - [RaceDetector](Docs/RaceDetector) - How to detect and fix race conditions
  - Working with Databases
    - [database/sql](http://go-database-sql.org/) - Online tutorial for working with the database/sql package.
    - [TUGTBDDAwG](https://vividcortex.com/resources/building-database-driven-apps-with-go/) - Guide to building data driven apps.
    - [SQLDrivers](Docs/QLDrivers)
    - [SQLInterface](Docs/SQLInterface)
  - From other languages
    - [Go for Java Programmers](http://yourbasic.org/golang/go-java-tutorial/)
    - [Go for C++ Programmers](Docs/GoForCPPProgrammers)
  - Strings
    - [GoStrings](Docs/GoStrings)
    - [String Matching](http://blog.gopheracademy.com/advent-2014/string-matching/)
  - [Comments](Docs/Comments)
  - [CommonMistakes](Docs/CommonMistakes)
  - [Errors](Docs/Errors)
  - [GcToolchainTricks](Docs/GcToolchainTricks)
  - [Hashing](Docs/Hashing)
  - [HttpFetch](Docs/HttpFetch)
  - [HttpStaticFiles](Docs/HttpStaticFiles)
  - [InterfaceSlice](Docs/InterfaceSlice)
  - [Iota](Docs/Iota)
  - [MethodSets](Docs/MethodSets)
  - [PanicAndRecover](Docs/PanicAndRecover)
  - [Range](Docs/Range)
  - [RateLimiting](Docs/RateLimiting)
  - [Rationales](Docs/Rationales)
  - [SendingMail](Docs/SendingMail)
  - [SignalHandling](Docs/SignalHandling)
  - [SimultaneousAssignment](Docs/SimultaneousAssignment)
  - [SliceTricks](Docs/SliceTricks)
  - [Switch](Docs/Switch)
  - [TableDrivenTests](Docs/TableDrivenTests)


## Online Services that work with Go

If you're looking for services that support Go, here's a list to get you started.

  - Cloud Computing - Go is well supported on most cloud service providers.
    - [Amazon Web Services](https://github.com/aws/aws-sdk-go)
    - [Digital Ocean](https://github.com/digitalocean/godo)
    - [Google Cloud Platform for Go](https://cloud.google.com/go)
    - [Heroku](https://github.com/heroku/heroku-buildpack-go)
    - [OpenStack](https://github.com/openstack/golang-client)
  - [Continuous Integration and Continuous Deployment](Docs/HostedContinuousIntegration) - Go is well supported by most CI/CD frameworks
  - Monitoring/Logging
    - [DeferPanic](http://deferpanic.com) - Dedicated Go application performance monitoring.
    - [OpsDash](https://www.opsdash.com/) - Go-based cluster monitoring platform.
  - Package and Dependency Management
    - [Gopkg.in](http://labix.org/gopkg.in) is a source for stable Go libraries, provided by Gustavo Niemeyer.

## Troubleshooting Go Programs in Production

  - Understand the performance of your Go apps using the [pprof package](http://blog.golang.org/profiling-go-programs)
