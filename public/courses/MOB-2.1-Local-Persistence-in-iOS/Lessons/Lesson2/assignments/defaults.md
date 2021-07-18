## UserDefaults & Property Wrappers

## What if...?

We not only want to save the email, but also the first time the user entered a section of the app, or user settings, whether they prefer light or dark mode, language selection etc.

That's a lot of structs we need to back up with UserDefaults.

<!-- > -->

## Property Wrappers

We can solve the inconvenience using Property Wrappers, introduced in Swift 5.1

First read about what they are in [this article](https://www.swiftbysundell.com/articles/property-wrappers-in-swift/) by John Sundell. (**Stop when you get to the  Decoding and overriding section**)

Think how you can improve the implementation of your `Defaults` struct.

Now take a look at how [this article](https://medium.com/better-programming/property-wrappers-in-swift-b8011c47545d) combines property wrappers with UserDefaults and see if you can adjust your implementation to store:

- Email : String
- FirstTimeUser : Bool
- DarkMode: Bool
- Languague : String (Ex. EN, SP, JP)


Complete the assignment for this activity on [Gradescope](https://www.gradescope.com).

## Additional Resources:

- [Video Explanation](https://www.youtube.com/watch?v=-sNog7Idqqg)
- [Property Wrappers vs Extensions](https://www.youtube.com/watch?v=5WUx9NsP7-k)
