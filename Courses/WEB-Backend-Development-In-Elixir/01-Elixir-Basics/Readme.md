# Elixir Basics


## Vocabulary

- Struct
- Arity
- Immutable
- Pass-by-value

## Objectives

1. Learn to write functions in Elixir
2. Play with primitive datastructures in Elixir like Structs


## Functions

In functional programming languages, the basic unit of composition is the function.
Elixir functions are denoted by the ```def``` keyword. 

Functions are first class citizens in Elixir. They are defined by arity(number of parameters).

```elixir
def respond_to(caller)

def respond_to(caller, receiver)
```

In the above, respond_to has two varaints, respond_to/1 and respond_to/2

## Structs

Struct is a datastructure in Elixir that holds key - value pairs, similar to a dictionary in Swift.
They allow us to store and manipulate information.

*Note*

**Struct is the closest thing to OOP and reference types as you'll get in Elixir. There are no reference types(classes etc), every variable is immutable and functions are pass by value.**



## Operators

### Pipe Operator ( ```|>``` )

Often times when programming, we pass argruements to functions from previous computations from other fuctions or by just calling on a function. An example of this in Swift is

```swift
func doSomething(one: Int)-> Double {
    return pow(one, 2)
}

func useSomething(pow: Double) -> Double {
    return pow - 1 
}

// Calling doSomething
useSomething(doSomething(5))
```

Elixir trys to make passing in single argruements a little easier with the pipe operator.
The pipe operator (|>) takes the return value from a function, and passes that to the arguement of the recieving function.

```elixir
def parseUser(user)
    user.first_name <> " " <> user.last_name

def calculateAge(user)
```

## Challenges
 