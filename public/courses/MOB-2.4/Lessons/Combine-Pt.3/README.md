<!-- Run this slideshow via the following command: -->
<!-- reveal-md README.md -w -->


<!-- .slide: class="header" -->

# Combine

## [Slides](https://make-school-courses.github.io/MOB-2.4-Advanced-Architectural-Patterns-in-iOS/Slides/Combine-Pt.3/README.html ':ignore')

<!-- > -->

## Learning Objectives

By the end of this lesson, you will be able to:

**Implement**:
- Combine to update UI with UIKit
- Combine to fetch and display data

<!-- > -->

## @Published

A type that publishes a property marked with an attribute.

```swift
@propertyWrapper struct Published<Value>
```
- Publishing a property with the `@Published` attribute creates a publisher of this type.
- You access the publisher with the $ operator
- Class constrained

[Docs](https://developer.apple.com/documentation/combine/published)

<!-- v -->

```swift
class Weather {
    @Published var temperature: Double
    init(temperature: Double) {
        self.temperature = temperature
    }
}

let weather = Weather(temperature: 20)
cancellable = weather.$temperature
    .sink() {
        print ("Temperature now: \($0)")
}
weather.temperature = 25
```

<!-- v -->

## Integration with UIKIt

Declarative UI updates from user input.

[Instructions](https://github.com/Make-School-Courses/MOB-2.4-Advanced-Architectural-Patterns-in-iOS/blob/master/Lessons/Combine-Pt.3/assignments/Example-1.md)

<!-- > -->

## Networking

**URLSession** has a Combine publisher: `dataTaskPublisher`

The result is a tuple `(Data, URLResponse)`

And there's also support with **Codable** by using the operator `decode(type:decoder:)`

[Playground Sample Code](https://github.com/Make-School-Courses/MOB-2.4-Advanced-Architectural-Patterns-in-iOS/blob/master/Lessons/Combine-Pt.3/assignments/Networking.playground.zip)

<aside class="notes">
When using this combination, we need to first use map on the result from dataTaskPublisher, to just get the Data part of it from the tuple. Then we can apply the operator to decode it.
</aside>

<!-- > -->

## Integration with Networking

Fetching, transforming and displaying data.

[Sample Project](https://github.com/Make-School-Labs/MOB2.4-CombineEx2)

<!-- v -->

### Activity

Analize the sample project and observe how Combine is used to fetch and display data.

Make sure you identify and understand these concepts:
- eraseToAnyPublisher
- tryMap
- replaceError
- @Published variables
- throttle
- switchToLatest

<!-- > -->

## After Class

Combine is a new framework and it will take more reading and practice to get used to it. But you can start using what you already know, little by little. 😉

<!-- > -->

## Additional Resources

- [Using Combine](https://heckj.github.io/swiftui-notes/#coreconcepts-publisher-subscriber)
- [Combine Concepts - Playground](https://github.com/AvdLee/CombineSwiftPlayground)
- [URLSession + Combine](https://theswiftdev.com/urlsession-and-the-combine-framework/)
- [Networking Layer with Combine](https://betterprogramming.pub/implement-a-networking-layer-using-combine-in-swift-5-8a83e3ac9bae)
- [More Networking with Combine](https://www.vadimbulavin.com/modern-networking-in-swift-5-with-urlsession-combine-framework-and-codable/)
- [Combine + UI Updates](https://useyourloaf.com/blog/getting-started-with-combine/)
- Book: Practical Combine by Donny Walls
- Book: Combine - Asynchronous programming with Swift By Shai Mishali, Marin Todorov, Florent Pillet and Scott Gardner
