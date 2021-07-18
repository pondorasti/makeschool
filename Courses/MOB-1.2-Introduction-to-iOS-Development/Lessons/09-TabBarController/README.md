# TabBar Controller

## [Slides](https://make-school-courses.github.io/MOB-1.2-Introduction-to-iOS-Development/Slides/09-TabBarController/README.html ':ignore')

<!-- > -->

## Learning Objectives

By the end of this lesson, students should be able to:

- Understand the view hierarchy when using a UITabBarController + UINavigationController
- Implement a TabBar Controller in an Xcode project
- Use SF Symbols and Named colors

<!-- > -->

## A Review on UINavigationController

<p class="fragment fade-in">What is a UINavigationController?</p>
<p class="fragment fade-in">What is a rootViewController?</p>
<p class="fragment fade-in">How can I navigate to new scenes?</p>

<!-- > -->

## What's a tab bar controller?

- `UITabBarController` is a `UIViewController` subclass
- A tab bar controller manages an **array** of **view controllers**
- The tab bar interface displays tabs at the bottom of the window for selecting between views
- This class is generally used as-is, but may also be subclassed

<!-- v -->

![clock](assets/clock.png)

<!-- v -->

Each tab of a tab bar controller interface is **associated with a view controller**.

When the user selects a specific tab, the tab bar controller **displays the root view** of the corresponding view controller, **replacing any previous views**.

<!-- v -->


![views](assets/views.png)

You can use navigation controllers or custom view controllers as the root view controller for a tab.

<!-- > -->

## Getting familiar with the project

Download [this starter project](https://github.com/amelinagzz/tabbar-starter) where we will add a Tab Bar Controller to display all the continents.

<!-- v -->

## Step 0

Explore the starter project and find out:

- If we are using the storyboard or the programmatic approach.
- What are the contents of `ContinentVC`
- What are the contents of `DetailVC`
- What is the parent class of `TabBarController`
- What is the root view of the whole project, where can you find this?
- What's inside the assets folder

<!-- v -->

## Step 1  

In the SceneDelegate, change this line:

```swift
window?.rootViewController = viewController
```

to set the window's `rootViewController` to be an instance of `TabBarController`.

<!-- v -->

## Step 2

Add this inside `setupViewControllers` in the TabBarController class.

```swift
let vc = ContinentVC()
vc.currentContinent = Continent(name: "North America", imageName: "northAmerica", associatedColor: .cyan)
vc.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
viewControllers = [vc]
```

You created an instance of Continent VC and added it to the array in the tab bar. Try this for two more continents. Then run the app and see the result.

<!-- v -->

## Step 3

Look for the method associated with the button in `ContinentVC.swift`.

We want to present `DetailVC` when the button gets pressed.

```swift
let detailVC = DetailVC()
present(detailVC, animated: true, completion: nil)
```

Run the app and see if that works.

<!-- v -->

It worked. But there's a better way to set the tab bar: Instead of having view controllers as the elements in the array for the tab bar controller, we'll use navigation controllers.

Using a tab bar controller with a navigation controller makes for a powerful combination. You can use them to give the user access to the main interfaces of the app, and to provide left-to-right navigation into more detailed view controllers.

<!-- v -->

![navigation](assets/navigation.png)

<!-- v -->

## Step 3

Go back to the setup of the tab bar controller and add a new instance of a UINavigationController, set its root view controller to be the `ContinentVC` instance you created before.

```swift
let navController = UINavigationController(rootViewController:vc)
vc.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
viewControllers = [navController]
```

Run the app and notice the change.

<!-- v -->

## Step 4

We can now see the titles from each view controller in the navigation bar. This new addition will let us push view controllers into the stack and pop them as we please.

Let's try that. Instead of presenting DetailVC, use the push animation.

```swift
self.navigationController?.pushViewController(detailVC, animated: true)
```

Run the app and see how you can navigate in the stack of view controllers.

<!-- v -->

## Step 5

We aren't seeing all the continents so far.

- Add the remaining view controllers with their corresponding images and titles.
- What happens when you have more than 6 items in the tab bar?

<!-- > -->

## Custom Tab Bar

[UITabBar](https://developer.apple.com/documentation/uikit/uitabbar).

A control that displays one or more buttons in a tab bar for selecting between different subtasks, views, or modes in an app.

To configure the tab bar associated with a UITabBarController object, configure the view controllers associated with the tab bar controller. The tab bar automatically obtains its items from the tabBarItem property of each view controller.

<!-- v -->

There's a lot of properties we can modify in a tab bar:
- Icons
- View color
- Font
- Tint Color

<!-- v -->

## Step 6 - UITabBarItems

Let's change the icons of the tab bar using [SF Symbols](https://developer.apple.com/design/human-interface-guidelines/sf-symbols/overview/)

```swift
vc.tabBarItem = UITabBarItem(title: vc.title, image: UIImage(systemName: "staroflife"), selectedImage: UIImage.init(systemName: "staroflife.fill"))
```

<!-- v -->

## Step 7

You can also customize the tint color and the color of the items. Try this inside `videDidLoad` in TabBarController.

```swift
self.tabBar.barTintColor = UIColor.black
self.tabBar.tintColor = UIColor.white
```

Run the app. Try other colors you think would look good to.

<!-- v -->

## The Delegate

You use the [UITabBarControllerDelegate](https://developer.apple.com/documentation/uikit/uitabbarcontrollerdelegate) protocol when you want to augment the behavior of a tab bar.

- To determine whether specific tabs should be selected.
- To perform actions after a tab is selected.
- To perform actions before or after the user customizes the order of the tabs.

<!-- v -->

## Step 8

Implement the delegate to detect when we've selected a new tab.

1. Add UITabBarControllerDelegate in the class declaration.
1. Set the delegate to self
1. Add the method:

```swift
func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
    //print "\(name) continent selected"
}
```

<!-- > -->

## Bonus Step 😀 - Named Colors

Check out the Resources folder and look at **Colors.xcassets**

You can organize the color palette you use in your project with an asset catalog. Create the colors you need and use them with this initializer:

```swift
UIColor(named: "PeriwinkleBlue")
```

Find a color palette you like using [this app](https://mycolor.space) and use it to give each Continent a better associatedColor.

<!-- > -->

## Lab + After Class

Implement a tab bar controller in your Subscription Box.

Add more View Controllers (empty for now) so that you have:

- Home  Controller - Where the user can explore content in the app
- New Box Controller - Where the user selects their preferences (what they would like to get in the next box)
- History Controller - A log of boxes they have received

You can see how it should look like in [the online design](https://zpl.io/bejlAMq).

<!-- > -->

## Additional Resources

- [Tutorial using the storyboard](https://code.tutsplus.com/tutorials/ios-from-scratch-with-swift-exploring-tab-bar-controllers--cms-25470)
- [TabBar + NavController Image source](https://learnappmaking.com/tab-bar-controller-uitabbarcontroller-swift-ios/)
- [Tab Bar programmatically](https://medium.com/@ITZDERR/uinavigationcontroller-and-uitabbarcontroller-programmatically-swift-3-d85a885a5fd0)
- [Video tutorial with storyboard](https://www.youtube.com/watch?v=n7NNAdaIDKQ)
