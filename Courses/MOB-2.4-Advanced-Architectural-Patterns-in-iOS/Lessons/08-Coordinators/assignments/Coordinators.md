## In Class Activity

### Individually

**Required Resources:**
1. Download the starter app: [iOS-CoordinatorsActivity1_B](https://github.com/Make-School-Labs/iOS-CoordinatorsActivity1_B)

**Background:**

The `iOS-CoordinatorsActivity1_B` app is incomplete.

Instead of pushing and presenting ViewControllers from other view controllers, the app seeks to implement the Coordinator pattern.

When completed, all screen navigation will be managed by coordinators.

Currently, the app contains implementations of two protocols for:

&nbsp;&nbsp;&nbsp;&nbsp; - The Coordinator protocol - for navigation </br>
&nbsp;&nbsp;&nbsp;&nbsp; - The Storyboarded protocol - for dynamically instantiating View Controller objects from the Main Storyboard bundle </br>

__*Navigation Protocol*__
```Swift
protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
```

__*VC Creation Protocol*__

```Swift
protocol Storyboarded {
    static func instantiate() -> Self
}
```

__*Note that:*__
- the main VC (`ViewController`) is __*not*__ configured as the "Initial View Controller" in the storyboad
- in order to be created dynamically, all VCs are given a `StoryBoard ID`

**- TODO -** </br>
The code in the app is nearly complete. Your job is to:
- analyze the app's structure wrt how it is creating view controllers
- complete any missing code so that the `BuyViewController` and `CreateAccountViewController` are presented using the Coordinator pattern instead of typical iOS navigation process (*see* The Pushing Problem *above*)


> **TIP:** Look for the //TODO: annotations we left in the app for you...


*Adapted from:* </br>
https://www.hackingwithswift.com/articles/175/advanced-coordinator-pattern-tutorial-ios


<!-- INSTRUCTOR NOTES: solutions for Activity 1 are hidden below Additional Resources -->
