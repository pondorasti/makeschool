# Delve into Debugging in Go

## Minute by Minute

| **Elapsed** | **Time**  | **Activity**              |
| ----------- | --------- | ------------------------- |
| 0:00        | 0:05      | Objectives                |
| 0:05        | 0:15      | Initial Exercise          |
| 0:20        | 0:20      | Overview                  |
| 0:40        | 0:60      | In Class Activity I       |
| 1:05        | 0:10      | BREAK                     |
| 1:15        | 0:45      | In Class Activity II      |
| TOTAL       | 2:00      |                           |

## Why You Should Know This (2 min)

Debugging tools and techniques are language-agnostic skills that last a lifetime!

## Learning Objectives (3 min)

1. Define what a debugger is, and why developers would use one.
2. Identify and describe the processes Delve uses to debug Golang programs.
3. Implement a integration with Delve into your editor of choice.

## Initial Exercise (15 min)

- CLI Demo - Vincenzo

## Overview/TT I (20 min)

> **Debugger** _(noun)_:
>
> Even the most experienced software programmers usually don't get it right on their first try. Certain errors, often called bugs, can occur in programs, causing them to not function as the programmer expected. Sometimes these errors are easy to fix, while some bugs are very difficult to trace. This is especially true for large programs that consist of several thousand lines of code.
>
> Fortunately, there are programs called debuggers that help software developers find and eliminate bugs while they are writing programs. A debugger tells the programmer what types of errors it finds and often marks the exact lines of code where the bugs are found. Debuggers also allow programmers to run a program step by step so that they can determine exactly when and why a program crashes. Advanced debuggers provide detailed information about threads and memory being used by the program during each step of execution. You could say a powerful debugger program is like OFF! with 100% DEET.
>
> Source: [link](https://techterms.com/definition/debugger)

- Go over the [Delve Getting Started Guide](https://github.com/go-delve/delve/blob/master/Documentation/cli/getting_started.md).

## BREAK (10 min)

## In Class Activity I (60 min)

1. Make sure `$GOPATH` is set in your `bash` or `zsh` configuration: [follow these instructions](https://github.com/golang/go/wiki/SettingGOPATH#bash)
2. Add `export PATH="$GOPATH/bin:$PATH"` to your `~/.zshrc` or `~/.bashrc`
3. Run `source ~/.zshrc` or `source ~/.bashrc` to reload your current shell instance and load the new `PATH` setting.
4. Install Delve
    1. `cd ~/go`
    2. `go get -u github.com/go-delve/delve/cmd/dlv`
5. Follow this [Delve tutorial](https://www.jamessturtevant.com/posts/Using-the-Go-Delve-Debugger-from-the-command-line/) to learn how to debug on the command line.
6. Use this [Editor Integration Guide](https://github.com/go-delve/delve/blob/master/Documentation/EditorIntegration.md) to integrate Delve debugging into your editor of choice.

## In Class Activity II

Continue to work on your [MakeUtility](https://make.sc/makeutility) project. It's due next week, and is a big part of your final grade!

## Additional Resources

- **[Delve Usage Documentation](https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv.md)**
- **[Delve Usage Demo Video](https://www.melvinvivas.com/debugging-go-applications-using-delve/)**
