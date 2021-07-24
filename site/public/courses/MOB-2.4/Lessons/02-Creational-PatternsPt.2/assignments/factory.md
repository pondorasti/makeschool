# Factory Pattern Activity

In this scenario, you are given the task to code how UI components get created.

UI components vary in color and typography depending on where they are located. For example, font weights and colors are not the same for menu buttons and buttons in the settings screen.

But you were asked to create an easy interface for creating these UI components. Here's something you can try in a new Playground:

Let's assume we can create these types of components:

```swift
enum ComponentType {
    case button
    case label
    case image
}
```

And that we are starting with the Menu items.

```swift
//over simplified subclasses as examples
//when instantiated, these will be concrete products from the factory
class SettingsButton: UIButton{}
class SettingsLabel: UILabel{}
class SettingsImage: UIImageView{}
```

To have different styling when creating views, create a protocol to serve as an interface for the factory. Any class that conforms to it will be able to have its own factory method and do the custom styling.

```swift
protocol ComponentFactory {
    //this is the factory method
    func createView(component: ComponentType) -> UIView
}
```

Now create the factory and specify what happens when using the factory method.

```swift
//this class will be the creator
//it will apply logic and  decide what needs to be instantiated based on given arguments

class MenuComponentFactory: ComponentFactory {
    func createView(component: ComponentType) -> UIView {
        switch component {
        case .button:
            return MenuButton()
        case .label:
            return MenuLabel()
        case .image:
            return MenuImage()
        }
    }
}
```

Now the client doesn't know how the components get created, it uses the interface to ask for them only. If styling ever changes, those changes will come through the factory but nothing will change in the client's way of asking for the UI.

```swift
//asks for a menu label
let menuFactory = MenuComponentFactory()
menuFactory.createView(component: .label)
```

1️⃣ Complete the implementation of UI components in the *settings screen*.

2️⃣ Read [this tip](https://www.swiftbysundell.com/tips/creating-extensions-with-static-factory-methods/) on working with static factory methods.

3️⃣ Write in the chat any questions you might have or if you are done let the instructor know.

[Resource for activity](https://levelup.gitconnected.com/factory-method-pattern-in-swift-1f1b73488072)
