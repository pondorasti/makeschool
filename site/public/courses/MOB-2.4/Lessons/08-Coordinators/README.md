<!-- Run this slideshow via the following command: -->
<!-- reveal-md README.md -w -->


<!-- .slide: class="header" -->

# Coordinators

## [Slides](https://make-school-courses.github.io/MOB-2.4-Advanced-Architectural-Patterns-in-iOS/Slides/08-Coordinators/README.html ':ignore')

<!-- > -->

## Learning Objectives

By the end of this lesson, you should be able to...

1. Describe:
- the **Coordinator** design pattern
- the problem it is intended to solve
3. Assess:
- when to use it
- the trade offs (pros/cons)
4. Implement basic examples of **Coordinator** explored in this class

<!-- > -->

## Initial Exercise (5 min)

As a class:

1. Review assignment from last class
- students demo their solutions in pairs

<!-- > -->

### The Coordinator Pattern

The idea behind the Coordinator pattern is the creation of a separate entity &mdash; __*a Coordinator object*__ &mdash; which is responsible for the application’s *navigation.*

*So what is a coordinator?*

<!-- v -->

>
> A **coordinator** is an object that bosses one or more view controllers around.
>
> A **coordinator** is an object that encapsulates a lifecycle that is spread over a collection of view controllers.
>


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *Source:* [Coordinators Redux](http://khanlou.com/2015/10/coordinators-redux/) &mdash; Soroush Khanlou


<!-- v -->

Similar to how UIViewControllers manage UIViews, Coordinators can manage UIViewControllers taking all of the driving logic (navigation) out of view controllers and moving it up one level &mdash; to a __*Coordinator layer.*__

<!-- v -->

![example](assets/coordinator_diagram.png)

*Source:* </br>
https://medium.com/@saad.eloulladi/ios-coordinator-pattern-in-swift-39a15aa3b01b

<!-- > -->

### Problems Addressed

1. **The Pushing Problem**

One of the standard ways to perform navigation on iOS is to use a `UINavigationController` onto which each view controller can either pop or push other view controllers.

```Swift
navigationController?.pushViewController(vc, animated: true)
```

<!-- v -->

When the view controllers themselves must decide the next view controller to push onto `self.navigationController`, the View controllers are **too tightly coupled**.

<!-- v -->

As an app grows, this approach becomes difficult to deal with:


- codebase is hard to change and maintain
- view controllers are hard to reuse

<!--
```Swift
class ImageListViewController: UITableViewController {
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        let image = images[indexPath.row]
        let detailVC = ImageDetailViewController(image: image)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
```

```Swift
class MyViewController : UIViewController {

    // ...
    @IBAction func didTap(_ button: Any) {

        let newViewController = NextViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
``` -->

<!-- v -->

2. **Massive View Controller Problem**

3. **Reusability** &mdash; with standard MVC, View Controllers are nearly impossible to reuse, especially if overloaded with non-VC tasks.

4. **Tight Coupling** &mdash; an inflexible design in which every controller needs to know details about other controllers inhibits an app's growth.

<!-- v -->

5. **Deep Linking Issues**

6. **Testing** &mdash; if you want to generate different views or a different flow in response to user choices (A/B testing) or to handle layout variations, standard MVC implementations of VCs make it extremely difficult to test those scenarios.  

<!-- > -->

### Implementation Notes

A solid, basic implementation of coordinators includes 3 main steps:
1. Design a **Coordinator protocol**
2. Create a __*main coordinator*__ that will control app flow. Start it when your app launches.
3. Create/present view controllers.

<!-- > -->

**About the Coordinator Protocol**

All coordinators will conform to this protocol. At bare minimum, it should include:
- A property to store the **navigation controller** being used to present view controllers.
- A `start()` function to make the coordinator take control. This allows us to create a coordinator fully and activate it only when we’re ready.
- A property to store any **child coordinators**. Coordinator responsibility is to **handle navigation flow**: the same way that UINavigationController keeps reference of its stack, Coordinators do the same with their children. (optional)

<!-- > -->

#### Example:

1. Coordinator protocol created

```Swift
protocol Coordinator {
    func start()
    var navigationController: UINavigationController { get set }
    //var childCoordinators : [Coordinator] { get set }
}
```

<!-- > -->

2. For building the user flow, a concrete implementation of the protocol is created:

```Swift
class MainCoordinator: Coordinator {

    //var childCoordinators: [Coordinator] = []

    var navigationController: UINavigationController
    private var someViewController: UIViewController?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        someViewController = ViewController()        
        navigationController.pushViewController(someViewController, animated: true)
    }
}

```

<!-- > -->

3. All view controllers targeted for participation in the coordinated navigation approach must:
- Have a `MainCoordinator` property for access to its properties and functions

```Swift
class ViewController: UIViewController {

    var coordinator: MainCoordinator?
     ...
}
```

<!-- > -->

5. If staring from the SceneDelegate:

```swift
guard let windowScene = (scene as? UIWindowScene) else { return }

var coordinator: MainCoordinator?

let navController = UINavigationController()
coordinator = MainCoordinator(navigationController: navController)
coordinator?.start()

window = UIWindow(windowScene: windowScene)
window!.rootViewController = navController
window!.makeKeyAndVisible()
```

<!-- > -->

## Practicing the simple approach

Code Demo

<!-- > -->

## Benefits

Coordinators create a well defined way to deal with navigation in which view controllers are:
1. Isolated from each other (do not need to know about each other)
2. Reusable
3. Lightweight and focused on their key responsibilities

<!-- > -->

## Pitfalls

The downside of the Coordinator pattern:

1. More code 😅

2. Can get complex as the app goes to deeper levels in the stack

<!-- > -->

## When to Use

Coordinators are especially useful for complex apps with a large number of destinations screens that can be reached (presented) from multiple places.


<!-- > -->

## AppCoordinator

Creating an app-wide `AppCoordinator` is the most common implementation of Coordinators for navigation flow.

This requires one high-level coordinator instantiated in the `AppDelegate` that directs navigation for the whole app (also known as the *Application Controller pattern*

<!-- > -->

The `AppCoordinator` holds an array of child coordinators, who in turn might hold an array of their own child coordinators.

This is especially useful in a **TabBar** app: each TabBar scene's navigation controller could get its own coordinator for directing its own behavior and flow. And each coordinator can be spawned by its parent coordinator.

<!-- > -->

![example](assets/coordinator_types2.png)

[Source](https://www.scoop.it/topic/swift-by-jerometonnelier/p/4097595680/2018/05/11/the-c-in-mvvm-c-mihael-y-cholakov)


<!-- > -->

### Coordinator and Deep Linking

A **deep link** is any link that directs a user past the home page of a website or app to content inside of it:
- for example, linking directly to a product instead of the home page.

<!-- > -->

**iOS and Deep Linking**
For many kinds of apps we not only want to make it easy to navigate within our own app, but also to enable other apps and websites to deep link into ours.

A common way to do this on iOS is to define a URL scheme that other apps can then use to link directly into a specific screen or feature of an app.

<!-- > -->

__*The Solution*__

Using Coordinators and navigator objects, implementing URL and deep linking support becomes a lot easier because it allows for dedicated navigation points in which URL handling logic can be injected.

*from:*
https://medium.com/@abhimuralidharan/universal-links-in-ios-79c4ee038272


<!-- > -->

### Coordinator &mdash; with other patterns

Coordinator is an easy pattern to implement with other complementary patterns.

For examples:
1. __*Coordinator with MVVM*__
- MVVM results in thinner VCs, more easily testable code, and data formatting logic that is decoupled from VCs.
- Adding navigation flow coordinators further decouples VCs

<!-- > -->

2. __*Coordinator with Factory*__
- Combines more flexible navigation with the ability to create objects (even View Controllers) on demand and to dynamically customized specifications.

<!-- > -->

## In - Class Activity

TabBar App using Coordinators

<!-- > -->

## Useful library

[Coordinator Library](https://github.com/daveneff/Coordinator)

[TabBar implementation using library](https://github.com/levibostian/TabBar-Coordinator-example)

<!-- > -->

## Stretch  Challenge

Download [this starter code](https://github.com/alfianlosari/MovieCoordinator-Starter-Project)

It is the starting point of [this tutorial](https://medium.com/swift2go/refactoring-ios-app-with-coordinator-pattern-for-navigation-alfian-losari-50081bfa7a4a)

Your task is to refactor the code to use the coordinator pattern.

Modify the Coordinator protocol to be like this:

```swift
protocol Coordinator {
    func start()
    var navigationController: UINavigationController { get set }
}
```

<!-- > -->

## Lab

Watch [this presentation](https://youtu.be/9VojuJpUuE8) on MVVM-C.
-[source](https://github.com/macdevnet/mvvmc-demo)

Draw the architectural diagram of MVVM-C, mentioning responsibilities and main properties.

<!-- > -->

## After Class

1. Research:

- Application Coordinator Pattern
- Router (with Coordinators)
- Deep Linking (specific to iOS)
- `Universal Link`
- MVP

<!-- > -->

## Additional Resources

1. [Slides](https://docs.google.com/presentation/d/1Ny2GlorCMgeJdkNo7AZg3m_SH4FwBLyFnrbh9Twqk4o/edit#slide=id.g50e0c2788f_27_8)
2. [The Coordinator - an article ](http://khanlou.com/2015/01/the-coordinator/), by Soroush Khanlou, <sup>1</sup> who popularized the pattern for iOS development.
3. [Coordinators - video presentation](https://vimeo.com/144116310)
4. [Coordinators - a slideshare from LinkedIn](https://www.slideshare.net/secret/3jJlEE1weo0RRl)
5. [8 Patterns to Help You Destroy Massive View Controller - an article](http://khanlou.com/2014/09/8-patterns-to-help-you-destroy-massive-view-controller/)

<!-- > -->

6. [NextPrevious What Are Cocoa Bindings? - from Apple ](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/CocoaBindings/Concepts/WhatAreBindings.html#//apple_ref/doc/uid/20002372-CJBEJBHH)
7. [Application Controller - Martin Fowler](https://martinfowler.com/eaaCatalog/applicationController.html) <sup>2</sup>
8. [Presentation Model - Martin Fowler](https://martinfowler.com/eaaDev/PresentationModel.html)
9. [Universal Links - Apple Devloper](https://developer.apple.com/ios/universal-links/)
10. [Universal links in iOS - an article](https://medium.com/@abhimuralidharan/universal-links-in-ios-79c4ee038272)
