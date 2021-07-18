# User Interface Project

The next project you work on will be a User Interface (UI) element of your own design. You will
design, code, and contribute your work to an open source project.

The *goal of the project* is to create collection of useful UI elements that will help you and other
developers make better looking apps faster. *Your goal* is to learn about designing UI elements that
provide maximum use and flexibility and the tools required to do this.

From the perspective that the UI element you design will see a wide variety use cases
you will need to provide a wider and more flexible solution than you would normally shoot for.

## Requirements

- [x] Make a UI Component
- [x] Define your UI component. Describe what it is you intend to make
- [x] Make a folder with a README that includes your description
- [x] UI Component covers edge cases and is not buggy
- [x] UI Component has an easy `API` for developers to use
- [x] Include documentation
- [x] Comment your code
- [x] Reviewed UI component with instructor
- [x] Shipped to cocoapods.org

Bonus Points:
- [x] Shipped to Cocoacontrols.com


## Tools & Concepts

Below are a list of some of the tools and concepts you should think about:

- **IBDesignable**
    - Allows components to render themselves in storyboard. This will allow your component to be
    previewed in storyboard. This makes it easy for others to setup and configure your component.
- **IBInspectable**
    - Allows properties of your component to edited in storyboard without writing any code. This
    makes it easy for others to use your component without having to write code. Combined with
    IBDesignable your component will be quick and easy to set up.
- **Sub classing UIView, UIControl, UIButton, UIImageView ...**
    - Choosing a subclass will allow your component to easily gain functionality in line with it's
    proposed usage. You can sub class one of the built in UI elements to make a more useful
    version of that element.
- **Implementing a logical set of initializers.**
    - To be useful in many situations your component will need the ability to be configured with
    a range of values. Well written initializers make this intuitive and easy.  
- **Planning a sensible API for your UI component.**
    - Your component will have public properties and methods that control it's behavior. Well
    chosen property, method, and parameter names will make your component easy to work with and
    it's behavior intuitive.
- **Documentation**
    - Writing documentation for your component will help explain it's operation. You can add
    documentation that shows up in the code editor _the same as the default library_.

## Write good code

Use comments, write documentation with your work, follow a consistent style. You are sharing your
code with others it needs to be clear, and well documented.

- Follow the style guide here:
    - https://github.com/raywenderlich/swift-style-guide
- Write documentation (this might not be what you think) read the following:
    - http://nshipster.com/swift-documentation/

## Choosing a UI component to create

Choose one of the UI elements from the list below, or invent one of your own. Your component should
be easy to use, and configurable. It should be able to instantiate from code, and from storyboard.
It should provide options to configure it's use and appearance, and instantiate itself with sensible
default values with minimal input.

Your component might have any of the features below.

- Animation
    - Scaling
    - Rotation
    - Plusating
- Colors
    - Foreground color
    - Background color stroke color
    - Gradient colors
- Gradients
    - Elements that use a gradient fill will need to set the angle of the gradient.
- Size
    - The size can be set with a method, or the size is determined by the frame of the element's
    view.
- A property that indicates if the animation is running
    - Many animated components will need to expose a property to indicate if their animation is active.
- Can be started and stopped.
    - Many animated components will need a property or method that starts or stops their animation.

### Example UI Components

Choose a UI element from the list below to work on, or make up one of your own if you think of
something that is not on the list.

- Date Picker
  Some apps need to show a date picker. A user can select a single date or a date range eg. April 14th, 2018 - May 10th 2018
- Progress indicator
    - Create a progress indicator of your own design. It should have some or all of the follow
    features. Feel free to add more features if you think of them!
- Thermostat
    - Draw a good thermostat. Indicates temperature or similar measurement graphically.
- Knob or Dial
    - Design a nifty looking knob or dial. This is a UI element that rotates.
- Buttons
    - Extend the UIButton class to add features. You can add stroke, gradient fill or an animated
    effect when the button tapped.
    - Make custom button with features that are not present in UIButton
- Loading animation
    - Think of any creative effect for a loading animation.
        - Bonus make the effect configurable. For example rather than three bouncing circles, configure
        the number of circles, the size and color of the circles, the speed etc.
- Counter (has +, -, and a number)
    - This would be an element that lets a user input a number easily. Could be used for selecting
    the number of items in a shopping cart, the number of people in your dinner party etc.
- Toggle Switch
    - This is button/switch with two states. An alternative to UISwitch.
- Radio button (segmented control)
    - A group of buttons where only one can be active at any time.
        - Bonus use a class method or singleton to make toggle buttons aware of each other.
- Slider value
    - Create an alternative or extend UISlider.
- Graphs and Charts. Create a view that displays data in various useful formats. To make this truly
useful it will need to be configurable.
    - Bar graph
    - Line graph
    - Pie chart
- Clock
    - Besides keeping time this could be used to display the time of an event or ?
    - Could also be a timer to keep track of time for another feature of an app.
- Compass
    - Thing that points in a direction. Not sure this could be useful in some way. Maybe with maps?
