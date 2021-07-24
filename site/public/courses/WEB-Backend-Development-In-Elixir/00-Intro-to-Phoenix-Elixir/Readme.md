# Intro to Phoenix & Elixir

We will be building a backend API in Phoenix, the web framework that allows us to handle network requests. But first we must learn a little bit of Elixir, the language that we will be writing our backend API with.

## Vocabulary

- Virtual machine(BEAM)
- Erlang
- Compile
- Pure functions
- Phoenix

## Objectives

1. Understand the basics of functional programming
2. Setup Elixir, Phoenix and Postgres
3. Learn how to execute code using the Elixir REPL


## History of Elixir and Functional Programming

Elixir comes from a background of computer languages that emphasize functional programming, a type of programming that relies on the purity of functions, using value types instead of reference types.

Swift is a multi-paradim language. It has both value type and reference types. But the Swift standard library itself is writting with mostly value types (Structs, Protocols and Enums).

Functional programming can be immensly useful and has been proven to help problems at gigantic scale, especially with distributed systems.

Elixir was built in 2011 by Jose Valim. He wanted to build a language and framework that was easy to use without any of the performance hits.

Elixir is built on the Erlang Virtual Machine.

## Functional Programming

In Elixir & Erlang, there are no reference types(classes) only value types. Functions are pass-by-value, and the only way to simulate state is by recursion.

## Installing Elixir and Phoenix

To install Elixir and phoenix, lets first install Homebrew, a package and dependency manager for macOS.

1. #### Install Homebrew
Head to http://www.homebrew.us to and follow the instructions to install homebrew on your machine.

2. #### Install Elixir, Phoenix and Postgres
We are going to install Elixir, the language, Phoenix the web framework and Postgres, a relational database

    ##### Formula
    Run
    ```
    brew install elixir
    brew install phoenix
    brew install postgresql
    ```
    
    Make sure all the packages are installed successfully


## Interactive Sessions with the Elixir REPL

REPL stands for Read, Evaluate, Print, Loop. Swift and other languages have a REPL. It allows you to run a program without having to restart the program after each evaluation.

We are going to explore basic Elixir syntax with the Elixir REPL, *iex*

## Using the Elixir REPL

