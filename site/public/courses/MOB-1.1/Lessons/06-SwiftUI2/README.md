# Exploring SwiftUI Pt.2

## [Slides](https://make-school-courses.github.io/MOB-1.1-Introduction-to-Swift/Slides/06-SwiftUI2/README.html ':ignore')

<!-- > -->

## Suggested accounts to follow 😬

- [Paul Hudson](https://www.youtube.com/channel/UCmJi5RdDLgzvkl3Ly0DRMlQ)
- [Sean Allen](https://www.youtube.com/channel/UCbTw29mcP12YlTt1EpUaVJw)
- [Lets Build That App](https://www.youtube.com/channel/UCuP2vJ6kRutQBfRmdcI92mA)
- [Code With Chris](https://www.youtube.com/user/CodeWithChris)
- [Swiftly Shivali](https://www.youtube.com/c/SwiftlyShivali/videos)
- [Mayuko](https://www.youtube.com/c/hellomayuko)

<!-- > -->

## Learning Objectives

By the end of this lesson, students should be able to:

- Refactor code to get separation of concerns
- Create views efficiently using Swift's constructs
- Understand the **@State** property wrapper
- Understand the **@Binding** property wrapper

<!-- > -->

## Refactoring Demo

Making our code more efficient and organized.

<!-- > -->

## Structs & Immutability

- Structs are immutable
- We use them all over the place with Swift.
- They are fixed values, rarely we will be changing them. (Think about Integers)

<!-- > -->

```swift
struct ContentView: View {
    var isAuthenticated = false
    var body: some View {
        Button(action: {
            self.isAuthenticated.toggle()
        }, label: {
            Text("auth is: \(isAuthenticated)")
        })
    }
}
```

<!-- > -->

## Property wrappers

**Allow us to add extra functionality to existing types**

Today we won't go deep on these, but during lab time definitely check out this resource:

[Property Wrappers - video](https://www.youtube.com/watch?v=lxdSiq8drXQ)

<!-- > -->

## @State

`@State` is a property wrapper that tells Swift that we will be changing the value of the property as our program runs.

When a `@State` property changes, SwiftUI automatically knows that it should reload the views to reflect the new state.

<!-- > -->

```swift
struct ContentView: View {
    @State var isAuthenticated = false
    var body: some View {
        Button(action: {
            self.isAuthenticated.toggle()
        }, label: {
            Text("auth is: \(isAuthenticated.description)")
        })
    }
}
```

<!-- > -->

What if the user updates the value of the property? How can we tell Swift to make the updates in the view?

Bind the property to the view and bind the view back to the property.

**Two-way binding**

Data flows in both ways to stay in sync.

<!-- > -->

```swift
struct ContentView: View {
    @State var isAuthenticated = false
    @State var password = ""
    var body: some View {
        VStack{
            Button(action: {
                self.isAuthenticated.toggle()
            }, label: {
                Text("auth is: \(isAuthenticated.description)")
            })
            TextField("Enter your password", text: $password)
                .multilineTextAlignment(.center)
            Text("You entered:\(password)")
        }
    }
}
```

<!-- > -->

## The use of $

When you see a property being used by itself:

```swift
Text("You entered:\(password)")
```

Means we want the value to be used here. **We read the value.**

<!-- > -->

When you see a property with `$`:

```swift
TextField("Enter your password", text: $password)
```

Means the value is being accessed through the property wrapper. Swift handles the two-way binding. **We read and update the value.**

<!-- > -->

## @Binding

Use a binding to create a two-way connection between a property that stores data, and a view that displays and changes the data.

A binding connects a property to a source of truth stored elsewhere, instead of storing data directly.

<!-- > -->

```swift
@Binding var isPlaying: Bool

struct PlayButton: View {
    @Binding var isPlaying: Bool
    var body: some View {
        Button(action: {
            self.isPlaying.toggle()
        }) {
            Image(systemName: isPlaying ? "pause.circle" : "play.circle")
        }
    }
}
```

<aside class"notes">
For example, a button that toggles between play and pause can create a binding to a property of its parent view using the Binding property wrapper.
</aside>

<!-- > -->

```swift
struct PlayerView: View {
    var episode: Episode
    @State private var isPlaying: Bool = false

    var body: some View {
        VStack {
            Text(episode.title)
            Text(episode.showTitle)
            PlayButton(isPlaying: $isPlaying)
        }
    }
}
```
<aside class ="notes">
The parent view declares a property to hold the playing state, using the
State property wrapper to indicate that this property is the value's source of truth.

When PlayerView initializes PlayButton, it passes a binding of its state property into the button's binding property. Whenever the user taps the PlayButton, the PlayerView updates its isPlaying state.
</aside>

<!-- > -->

## In Class Activity

Complete the refactoring of the Calculator app.

Stretch challenges:
- Keep the numbers as you make operations (currently it's shows a 0 in between)
- Support for decimals
- Support for percent

<!-- > -->

## Additional Resources

- [For Each - Hacking with Swift](https://www.hackingwithswift.com/books/ios-swiftui/why-does-self-work-for-foreach)
- [Hacking with Swift](https://www.youtube.com/watch?v=stSB04C4iS4)
- [Calculator Logic](https://github.com/TarokhDev2020/Calculator-for-SwiftUI)
- Swift UI Documentetion in Xcode for @Binding
