# Go Modules

Go 1.11 introduced support for modules, as a way to define a collection of related Go packages. This support has continued to evolve throughout 1.12 and 1.13.

A module is defined using the `go.mod` file.

A minimal file looks like this:

```
module my-module
```

This command will do two things:

- Define the directory containing that file as a Go module
- Establish the module’s path

Typically, the `go.mod` file will include dependencies, like this:

```
module my-module

require (
        github.com/pkg/errors v0.8.1
)
```

The `go.mod` file can include a go directive, which establishes the expected language version, like this:

```
module my-module

go 1.13
```

This directive is not required, but if it’s not specified, the version of the compiler being used is assumed.

If you use `go mod init` to create the `go.mod` file, the directive will be added, and it will have the same version of the go tool that you are currently using.

The documentation says that it “determines which language features are available when compiling the module”. That terse wording is what caught me by surprise.

Consider a simple example:

```golang
package main

import "fmt"

func main() {
        fmt.Printf("The answer is %d\n", 42)
}
```

That builds and runs fine with any version of Go, but since I used go 1.13 to create the go.mod file, it looks like this:

```
module version-1

go 1.13
```

Running the program with Go 1.13, you get the expected output:

```bash
$ go version
go version go1.13 linux/amd64
```

```bash
$ go run .
The answer is 42
```

What would you expect to happen if you try to build this with go 1.12?

```bash
$ go version
go version go1.12.9 linux/amd64
```

```bash
$ go run .
The answer is 42
```

In the much more complex context where I ran into this, I was fully expecting the line to mean fail unless built using go 1.13 or later. This is how the directive used to behave with 1.11 through 1.11.3. It was changed in 1.11.4 to be compatible with the same change introduced in 1.12.

Reading the quoted documentation again, note that it says the `go` directive “determines which language features are available when compiling the module”. It talks about features, not about the version of the compiler.

Consider this change to understand what that means:

```golang
package main

import "fmt"

func main() {
        fmt.Printf("The answer is %d\n", 0b101010)
}
```

The code still works fine with Go 1.13.

With 1.12:

```bash
$ go version
go version go1.12.9 linux/amd64
```

```bash
$ go run .
# version-2
./version.go:6:36: syntax error: unexpected b101010, expecting comma or )
note: module requires Go 1.13
The compiler produces an error, because it doesn’t know about the new syntax, and it outputs a note about requiring Go 1.13. It doesn’t “know” which version is required, it’s simply stating the information stored in the go.mod file.

If the go.mod file is changed to specify Go 1.12, the error remains but the note goes away:
```

```bash
$ go version
go version go1.12.9 linux/amd64
```

```bash
$ go run .
# version-3
./version.go:6:36: syntax error: unexpected b101010, expecting comma or )
And using Go 1.13:
```

```bash
$ go version
go version go1.13 linux/amd64
```

```bash
$ go run .
# version-3
./version.go:6:35: binary literals only supported as of -lang=go1.13
```

What happened:

- The go directive in `go.mod` specifies which language features are available to the code. This does not include compiler flags (e.g. `-trimpath`).
- Building with an older version is possible as long as the code does not use features introduced with the newer version.
- Building with an older version will produce a syntax error if the code uses newer features, and a hint is provided as to the version that is required based on the contents of `go.mod`.
- Building with a compiler version that does support the features in the code with a go.mod file specifying an older version will not produce a syntax error but it will cause an error indicating the specific version required to build the code.

## Credits

[go.mod's go directive](https://blog.ksub.org/bytes/2019/09/15/go.mods-go-directive/): Excellent post by Marcelo Bytes, written 09/15/2019.
