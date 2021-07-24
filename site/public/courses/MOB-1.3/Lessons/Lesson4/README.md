<!-- Run this slideshow via the following command: -->
<!-- reveal-md README.md -w -->


<!-- .slide: class="header" -->

# Communication Patterns

## [Slides](https://make-school-courses.github.io/MOB-1.3-Dynamic-iOS-Apps/Slides/Lesson4/README.html ':ignore')

<!-- > -->

## Why you should know this

If we think about how apps work, we can see they're usually multiple screens displaying or passing information.

In this last remark, there are several methods or patterns we can use to achieve communication between elements in an app.

<!-- > -->

## Learning Objectives

1. Identify and implement the **Target-Action** pattern for event handling.
1. Understand how Notifications work using **Notification Center**.
1. Analyze and decide which pattern to use based on the requirements of an app.

<!-- > -->

## Target-Action

Target-Action is a **design pattern** in which an object holds the information necessary to **send a message** to another object **when an event occurs**.

It's the pattern used to send messages in response to user-interface events, specifically from **UIControl**.

<!-- v -->

### Simplifying things

The Target-Action object has:

1. **Target** - The object that will be notified
2. **Action** - The method that will be used
3. **Event** that will trigger the Target-Action

<!-- v -->

<img src="https://developer.apple.com/library/archive/documentation/General/Conceptual/Devpedia-CocoaApp/Art/target_action.jpg">

<aside class="notes">
Buttons are an example of this pattern, they send a message when they have been tapped.

If the target is specified then the action message, it is sent to the object.
</aside>

<!-- > -->

### What are selectors?

**Unrecognized selector sent to instance**

Wave you ever seen this error in which the app crashes?<br>
What was the problem?

<!-- > -->

**A:** Xcode couldn't find the method being called 😰

<!-- > -->

Selectors are the **names of methods** used to execute code at runtime.

The name of the method that will be called and the object to send the message to are **not known until runtime**.

Selectors are not part of the default Swift runtime behavior so we include `@objc` to our methods.

<!-- > -->

### How does this look like?

Creating a UIButton

```swift
let loginButton = UIButton(type: .roundedRect)
loginButton.setTitle("Login", for: .normal)
```

Adding the target

```swift
loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
```

<!-- > -->

Created a UIButton and called `addTarget(_:action:for:)` with these parameters:

1. **target** is `self`
1. **action** is ``#selector(login)``
1. **event** is `.touchUpInside`

When the event `.touchUpInside` occurs, send a message to `self` to execute `login`

<!-- > -->

Here's the method called

```Swift
@objc func login(){
  print("Button tapped")
}
```

<!-- v -->

Variation passing in the sender object


```swift
loginButton.addTarget(self, action: #selector(login(sender:)), for: .touchUpInside)

@objc func login(sender: UIButton){
  print("Button tapped")
  //Because you received the sender as a parameter, you can access its properties.
  print(sender.titleLabel?.text)
}

```

<!-- v -->

## Example

[Playground example](https://www.ralfebert.de/ios-examples/uikit/uicatalog-playground/UIButton/)

Something to note is that the messages sent can't carry custom information. Which is why we can't send values in a UIButton's target action. They could send the sender that triggered the action as an argument, but that is as far as it goes.

<!-- > -->

## Passing arguments in the target action

[CustomButton Replit](https://replit.com/team/MOB13/TargetAction)

<!--
```swift
class CustomButton: UIButton{
    var arrayValues: [String]!
    convenience init(values: [String]){
        self.init()
        self.arrayValues = values
    }
}
```
-->

<!-- > -->

## Notifications 📣

Notifications can broadcast messages between relatively unrelated parts of your code. They use the **Observer pattern** to inform registered observers when a notification comes in, using a central dispatcher called `Notification Center`.

The Notification Center deals with registering observers and delivering notifications.

<!-- v -->

Notifications can  include a payload in form of their property called `userInfo`, which is a dictionary.

The sender and the recipient don’t have to know each other so they are useful to send information between very distant modules.

<!-- > -->

### How the Notification Center works

Has 3 components
- An **observer** that listens for notifications
- A **sender** that sends notifications when something happens
- The **notification center** that keeps track of observers and notifications

<!-- > -->

![notification](assets/notification.png)

<!-- > -->

### Registering for notifications

This adds an entry to the Notification Center.

```swift
print("Added Observer")
NotificationCenter.default.addObserver(self,
  selector: #selector(receivedNotification(_:)),
  name: Notification.Name("receivedNotification"),
  object: nil)
```

<aside class="notes>
Every app has a default notification center property where objects register or post notifications. In this example 'self' will be listening for notifications with name 'receivedNotification' and when that event happens, the function 'receivedNotification' will be called.
</aside>

<!-- > -->

Function that gets called.

```Swift
@objc func receivedNotification(_ notification:Notification) {
  // Do something here
  print("Received notification")
  self.view.backgroundColor = UIColor.purple       
}
```

<!-- > -->

### Posting notifications

Needs the name of the notification and the object that posts the notification.

```Swift
print("Post Notification")
NotificationCenter.default.post(
  name: Notification.Name("receivedNotification"),
  object: self)
```

<!-- > -->

### Unsubscribing

⚠️ Observers need to be removed, or else you send a message to something that doesn't exist.

```swift
deinit {
  print("Removed Observer")
  NotificationCenter.default.removeObserver(self,
    name: Notification.Name("receivedNotification"),
    object: nil)
}
```
*A deinitializer is called immediately before a class instance is deallocated. Swift automatically deallocates your instances when they are no longer needed, to free up resources.*

<!-- > -->

## Practice - Checking for understanding

[Notifications syntax practice - Replit](https://replit.com/team/MOB13/NotificationCenter)

<!-- > -->

Tips

- When creating a notification, use **unique names** that are also helpful.
- It's best if you declare a **constant for the name**.
- Use the name of the Notification for the selector method. This is less confusing.
- Do not overuse this communication pattern or you'll end up with too many dependencies
- Use Notifications when you need to **communicate between 2 or more objects** in the app that don't know about each other. Or when using one-to-many or many-to-many communications that are consistent.

<!-- > -->

## Pomodoro App

1. Learn what the Pomodoro technique is: [go to video](https://youtu.be/V5l1NPYyH4k)

2. Then follow the instructions in [this repo](https://github.com/amelinagzz/pom-starter).

3. Submit your completed version to Gradescope.

<!-- > -->

## Self Study - suggested resources

- [Notification Center video by iOS Academy](https://www.youtube.com/watch?v=Kr3G9C22_-Q)
- [Section on Selectors](https://learnappmaking.com/target-action-swift/#using-selectors-in-swift)

<!-- > -->

## Additional Resources

1. [Selector and extensions](https://medium.com/@abhimuralidharan/selectors-in-swift-a-better-approach-using-extensions-aa6b0416e850)
1. [Target- Action Apple Archives](https://developer.apple.com/library/archive/documentation/General/Conceptual/Devpedia-CocoaApp/TargetAction.html)
1. [Target-Action - article](https://learnappmaking.com/target-action-swift)
1. [Notifications](https://learnappmaking.com/notification-center-how-to-swift/)
1. [Notifications](https://medium.com/@dmytro.anokhin/notification-in-swift-d47f641282fa)
