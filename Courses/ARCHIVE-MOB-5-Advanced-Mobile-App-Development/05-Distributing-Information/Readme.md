# Distributing information in iOS

### Objectives

- What does information distribution mean?
- Delegation
- Closures
- Notifications
- Property Observers
- Bindings / Key Value Observation

## Information distribution

Mobile apps are highly interactive and multiple interfaces drive data changes: UI, Network etc
Main task is responding to events and distributing new data

## Code Locality

Each piece of code needs well defined responsibility. Eg. The code that triggers network request is not necessarily the code that is interested in response

## Type to type communication

Typically used to establish a life long connection

![Type-to-type](type-to-type.png)


**Tight coupling!**

The UserView could call any method provided by UserViewController,
including all the ones inherited from UIView Controller

UserView can become dependent on UIViewController.

UserView has to deal with huge interface:
```
func infoButtonTapped()
//…
init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?)
var view: UIView!
func loadView()
var nibName: String? { get }
var nibBundle: NSBundle? { get }
var storyboard: UIStoryboard? { get }
//…
```

**Pros:**
    - Easy to use
**Cons:**
    - Results in tight coupling 
    - No tight interface for communication between two types
    - Mostly only useful for 1-1 communication
    
## Delegation
Typically used to establish a life long connection 

- Create a formal protocol that describes the
communication interface
- Use this protocol to create an indirect
connection between the two types

![Delegation](delegation.png)

Indirection = looser coupling

**Pros:**
    - Decouples communication, easy to replace delegate with
    any other type conforming to protocol 
    - Tight interface that contains only methods that are relevant
    for this specific communication channel 
    
**Cons:**
    - Mostly only useful for 1-1 communication

## Closures
Typically used for short lived relationships 

![Closures](closures.png)

**Pros:**
    - Decouples communication
    - Provides a communication interface with only a single
    function
    
**Cons:**
    - Need to be careful to avoid retain cycles

## Notifications & NotificationCenter
Notifications allow us to broadcast information (1 to N) 
Sender has no information about which objects have subscribed to notifications.

This communication pattern is based of the [Observer pattern](https://en.wikipedia.org/wiki/Observer_pattern) and Event Hub.
In the observer pattern, we have an object called a **Subject**, this subject maintains a list of dependencies known as **Observers** which are notified when state changes.

### Posting a notification
```swift
let PostCompleted = "postCompleted"
let PostNotification = Notification.Name(rawValue: PostCompleted)
let notificaton = Notification(name: PostNotification)

NotificationCenter.default.post(notificaton)
```

- Notifications are delivered on the same thread on which they are posted!
- Optionally you can use a userData argument to attach arbitrary data to the notification

### Registering for Notifications

```swift
// Option 1
class Listner {
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(Listner.notified(notificaton:)), name: PostNotification, object: nil)
    }
    
    @objc func notified(notificaton: Notification) {
        print(notificaton)
    }
}

// Options 2
NotificationCenter.default.addObserver(forName: PostNotification, object: nil, queue: nil) { (not) in
    print(not)
}
```

**Note** Some notifications require an import to view notification
Eg. To observe changes to AVPlayer, you need to import AVFoundation to see AVPlayer notification names

```swift
NotificationCenter.default.addObserver(forName: NSNotification.Name.AVPlayerItemTimeJumped, object: nil, queue: nil) { (not) in
    
}
```

- Specify which notification you want to listen to
- Specify which method on which object should be called once this notification
occurs
- Mark the target method with @objc if you are not subclassing from an Objective-C object

#### Notification Gotchas

- Don’t forget to unsubscribe!

If a deallocated object is registered with the notification center, your app will crash on an attempt to deliver a
notification to the dead object.

```swift
class Listener {

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
 //…
}

class UserViewController: UIViewController {

    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)

        NotificationCenter.default.removeObserver(self)
    }
}
```

- **Pros:**
    - Easy to communicate with different parts of the program without
    explicit references

- **Cons:**
    - No well defined communication interface / no type information
    - Causes crashes if you forget to unregister
    - Can create dependencies between code that should not be
    coupled
    - Similar problem with a singleton, you have a globally accessible object, anyone can listen to the notification


## Property Observers

Implicitly propagate changes within an instance of a type.
Used for information propagation within an instance.

```swift
class UserViewController: UIViewController {
     var label: UILabel!

     var user: User? {
         didSet {
             if let label = label, let user = user {
                label.text = user.name
             }
         }
     }
 }
 ```
 
 - **Pros:**
    - Easy to use, type safe
    
- **Cons:**
    - Not applicable in many scenarios
    
    
## Bindings - Key-Value-Observation(KVO)

Objective-C API that relies on the Objective-C Runtime

Generates notifications when an observed property on
an observed object changes

Think: property observers for other objects

To use KVO with swift you need to implement these steps:
1. The Object you are going to observe needs to inherit from NSObject
2. Add the dynamic keyword to the observed property
3. The object observing property changes needs to add itself to the list observers
4. Override the observeValue(for:of:change:context:) method
5. Remove the observer in deinit()

```swift
class User: NSObject {
    dynamic var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Observer: NSObject {
    var user: User
    
    init(user: User) {
        self.user = user
        super.init()
        
        self.user.addObserver(self, forKeyPath: "name", options: NSKeyValueObservingOptions.new, context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if let newValue = change?[NSKeyValueChangeKey.newKey] {
            print("Name changed: \(newValue)")
        } else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
    }
    
    deinit {
        self.user.removeObserver(self, forKeyPath: "name")
    }
}

let observer = Observer(user: User(name: "Eliel"))
observer.user.name = "Peter"
observer.user.name = "Johnson"
```

- **Pros:**
    - Allows observation of (almost) any property without additional work
    on class that is being observed 
    
- **Cons:**
    - API doesn’t provide type information of observed values 
    - API is arcane, e.g. one callback for all observer properties 
    - Not available on Swift classes, need to inherit from NSObject and
    use the dynamic keyword
    
Swift doesn’t have it’s own KVO mechanism, but there are third party alternatives and it’s easy to implement your own KVO alternative

## Alternatives

A typical iOS project will end up using more than one of the above communication patterns.
Frameworks like **Bond, RxSwift, ReactiveCocoa** reduce communication into a simple interface.

## Brainstorm

1. Building Whale, when will we use Delegation, Closures, NotificationCenter and KVO?
2. What are some of the problems with using NotificationCenter to distribute information across our app?
3. What is the main problem with using Closures in swift?
4. What is the difference between delegates and protocols?


## Summary

- Delegation
- Closures
- Notifications
- Property Observers
- Bindings / Key Value Observation

## Resources

[Playgrounds of KVO and NotificationCenter](distributing-information.playground)

[NotificationCenter Apple](https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSNotificationCenter_Class/)

[Swift Property Observers](https://developer.apple.com/library/prerelease/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Properties.html#//apple_ref/doc/uid/TP40014097-CH14-ID262)

[NSHipster KVO](http://nshipster.com/key-value-observing/)

[RxSwift](https://github.com/ReactiveX/RxSwift)

[ReactiveCocoa](https://github.com/ReactiveCocoa/ReactiveCocoa)

# Next - [Networking Overview](../06-Networking-Overview/Readme.md)