# Exploring SwiftUI

## [Slides](https://make-school-courses.github.io/MOB-1.1-Introduction-to-Swift/Slides/05-SwiftUI1/README.html ':ignore')

<!-- > -->

## Learning Objectives

By the end of this lesson, students should be able to:

- Familiarize with Apple's frameworks for UI
- Explain what is SwiftUI and how it works with Declarative syntax
- Build layouts using stacks
- Create views efficiently using Swift's constructs

<!-- > -->

## Frameworks for UI

- [UIKit](https://developer.apple.com/documentation/uikit)
- [SwiftUI](https://developer.apple.com/documentation/swiftui/)

<!-- > -->

## SwiftUI

![swiftui](assets/swiftui.png)

SwiftUI is an innovative way to build user interfaces across all Apple platforms using Swift.  

<!-- > -->

## Declarative syntax

*Declarative programming is a non-imperative style of programming in which programs describe their desired results without explicitly listing commands or steps that must be performed.*

Telling SwiftUI **what** we want the UI to look like and work, then it figures out **how** to make that happen.  

- Easy to read
- Natural to write

<!-- > -->

## UIKit and SwiftUI

Side by Side

<div id="left">

![homecook](assets/homecook.jpg)
</div>

<div id="right">

![chef](assets/chef.jpg)
</div>
<!-- home cook needs all instructions and steps vs professional cook who can make a dish with just the name -->

<!-- > -->

## Design Tools

With Xcode 11 came a lot of new tools to work with SwiftUI.

As we work in the code editor, we get to see a live preview of the app.

As we work in the design canvas, everything we edit is in sync with the code editor.

In any case, Xcode recompiles the changes instantly and inserts them into a running version of your app, visible, and editable at all times.

<!-- > -->

## Some facts

- SwiftUI runs on iOS 13, macOS 10.15, tvOS 13, and watchOS 6. And future versions of each.
- SwiftUI is faster than UIKit.
- You can have a project than mixes SwiftUI and UIKit.
- SwiftUI does not replace UIKit.

<!-- > -->

## What should we learn?

For now SwiftUI has limited API coverage, limited adoption and support.

It will be a big deal in years to come (maybe 2 or 3). But as iOS developers in the job industry **now**, we need to know about UIKit as a requirement.

The best option is to learn SwiftUI on the side as well.

<!-- > -->

## Stacks 📚

[designcode.io explanation for stacks](https://designcode.io/swiftui-handbook-hstack-vstack)

<!-- > -->

## Live demo

1. Finding the preview
1. Template contents
1. Hello world
1. Hello world in an HStack
1. Hello world in a VStack
1. Grid with text
1. Add image
1. Simulator

<!--
A view is a rectangular area on the screen where we can display content and interact with it.

In the template contents we have `body` that behaves like a view.

1. No change needed
2. HStack{
    Text("Hello World")
    Text("Hello World")
    Text("Hello World")
   }
3. VStack(spacing:10){
    Text("Hello World")
    Text("Hello World")
    Text("Hello World")
   }
4. VStack(spacing:30){
    HStack(spacing:30){
      Text("👩🏻‍💻")
      Text("👩🏾‍💻")
      Text("👨🏽‍💻")
      Text("👨🏻‍💻")
    }
    HStack(spacing:30){
      Text("👩🏻‍💻")
      Text("👩🏾‍💻")
      Text("👨🏽‍💻")
      Text("👨🏻‍💻")
    }
   }
 5. Image("01")
      .resizable()
      .scaledToFit()
      .frame(width: 100, height: 100)
-->

<!-- > -->

## Warmup

<div id="left">

- Replicate this layout and write your own text at the bottom.
- Find the thread in our Slack channel and post a screenshot when you are done.
</div>

<div id="right">

![warmup](assets/warmup.png)
</div>

<!-- > -->

## In Class Activity

[Instructions here](https://github.com/Make-School-Courses/MOB-1.1-Introduction-to-Swift/blob/master/Lessons/05-SwiftUI1/assignments/calculator.md)

<!-- > -->

<!--

## Adding it to an existing project.

If you need to add the ViewController you created with SwiftUI, you can use it as a regular view in a project that mostly uses UIKit, using the class [UIHostingController](https://developer.apple.com/documentation/swiftui/uihostingcontroller).

You will need to add the SwiftUI file to the project.

Then just use it as a regular view with the help of the class

```swift
let swiftUIView = ContentView()
let viewController = UIHostingController(rootView: swiftUIView)
```
 -->

## Additional Resources

- [What is SwiftUI](https://developer.apple.com/xcode/swiftui/)
- [SwiftUI tutorials](https://developer.apple.com/tutorials/swiftui/tutorials)
- [100 days of SwiftUI](https://www.hackingwithswift.com/100/swiftui)
- [SwiftUI by examples](https://www.hackingwithswift.com/quick-start/swiftui)
- [Learn App Making - SwiftUI intro](https://learnappmaking.com/swiftui-getting-started-how-to-ios-swift/)
- [Warmup Images](https://www.sketchappsources.com/free-source/4389-coronavirus-icons-sketch-freebie-resource.html)
- [Let's build that app - Calculator](https://www.youtube.com/watch?v=ULEFrRSPXFE)
