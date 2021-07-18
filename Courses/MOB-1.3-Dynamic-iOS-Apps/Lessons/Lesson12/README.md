<!-- Run this slideshow via the following command: -->
<!-- reveal-md README.md -w -->


<!-- .slide: class="header" -->

# Unit Testing

## [Slides](https://make-school-courses.github.io/MOB-1.3-Dynamic-iOS-Apps/Slides/Lesson12/README.html ':ignore')

<!-- > -->

## Why you should know this

We've all done manual testing. It looks something like this:

We build and run the app ➡ navigate screens ➡  make a few taps ➡  make sure everything works the right way.

If everything is good we move on to **repeating** the same process for different test cases. With unit testing we can **automate** some of these processes to cut time in testing while still making sure our app works.

<!-- > -->

## Learning Objectives

1. **Define** unit testing & its importance
1. **Design** & **implement** basic tests in an Xcode project.
1. **Navigate** Xcode to create and run tests.
1. **Test** a network layer

<!-- > -->

## What is unit testing?

Unit testing is a level of software testing where **individual units/ components** of a software are tested.

The purpose is to **validate that each unit of the software performs as designed**.

A unit is **the smallest testable part** of any software. (ex. a method)

<!-- > -->

## Benefits of unit tests

**Q:** What are some benefits that come to mind?

Group Brainstorm

<!-- > -->

We increase the pace in which we develop if we can trust our existing code while rolling out new features. Making sure the newly added code doesn't break our existing code. That's when unit tests really show their value.

- Detect bugs earlier and fix them faster.
- Saving time = saving resources and money.
- Users are happy with an app that's stable.
- Refactoring is easier.

<!-- > -->

### What can we test?

- Models
- Methods
- Interactions with view controllers
- UI workflows
- Network calls

<!-- > -->

### The first unit test - An example

Steps:

1. Create a new project including unit test targets.

When opening the default file in the tests target: What you see here is a **test case**.

A test case is a class containing several tests.

<!-- > -->

```Swift
import XCTest
@testable import YourProject
```
Every test case needs to import the **XCTest** framework.

It defines the **XCTestCase** class and the test assertions that we'll use later.

<!-- > -->

The second line imports the YourProject module. All the code we write for the app will be in this module.

By default, classes, structs, enums, and their methods are defined as **internal**.

<!-- > -->

This means that they can be accessed within the module. But the test code lives outside of the module.

To be able to write tests for your code, you need to import the module with the @testable keyword.

This keyword makes the internal elements of the module accessible to the test case.

<!-- > -->

Next we’ll take a look at the class declaration:

```Swift
class TestingTestsTests: XCTestCase {
```

<!-- > -->

The **setUp()** method is called before the invocation of each test method in the class.

Here, we can insert code that should run before each test.

<!-- > -->

The opposite of setUp() is **tearDown()**.

This method is called after the invocation of each test method in the class.

If we need to clean up after our tests, here's the right place to do it.

<!-- > -->

Now we can continue writing the test.

<!-- > -->

1. Command + U to run all tests OR click the diamond button on each test.

Xcode compiles the project and runs the test. You should see all diamonds green, meaning all of the tests passed.

<!-- > -->

### Test No. 1

Create a test for the following method:

```Swift
func vowelsInAString(string: String) -> Int {
       let vowels: [Character] = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
       var numberOfVowels = 0
       for character in string {
           if vowels.contains(character) {
               numberOfVowels +=  1
           }
       }
       return numberOfVowels
   }
```

Add the method to you view controller and then write a test for it.

Stretch challenge: Just for fun and practice, try refactoring `vowelsInAString` to use the higher order function `reduce`.

<!-- > -->

### Test No. 2

We want to have a function that given a title, it formats it to have each word capitalized to become a title.

```Swift
func makeTitle(string: String) -> String {
    let words = string.components(separatedBy: " ")

    var headline = ""
    for var word in words {
        let firstCharacter = word.remove(at:word.startIndex)
        headline += "\(String(firstCharacter).uppercased())\(word) "
    }

    headline.remove(at:headline.endIndex)
    return headline.dropLast()
}
```

Write a test to make sure this works. Stretch challenge: Try refactoring `makeTitle` to use the higher order function `map`.


<!--
### Test No. 3

Now let's try doing the same thing for a different component in the app.

Add a UITextfield to a view controller, include a placeholder to it and test the integrity of the message, make sure it's the right one.

Note: This might need more XCTest UI related components, feel free to google how to.
-->

<!-- > -->

### Given When Then

![givenwhenthen](assets/Given-When-Then.jpg)

<!-- > -->

**(5 min)** Take a few minutes to improve your tests and make the more descriptive using the Given When Test approach.

<!-- > -->

## In Class Activity

Try tests in a playground.
Using the following code, your objective is to write a simple test to make sure we can instantiate TodoItem.

```Swift
import UIKit
import Foundation
import XCTest

struct TodoItem {
    let title: String
    let dueBy: Date?

    init(title: String) {
      // complete initializer
    }
}

class TodoTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    override func tearDown() {
        super.tearDown()
    }

    func testTodo() {
      // test making an instance of the struct TodoItem
    }
}

TodoTests.defaultTestSuite.run()

```

<!-- > -->

## Testing a network layer

We should not make tests relying on the network. That job alone is code that needs its own tests.

Why? Servers can go down and APIs can change 🤷🏻‍♀️

<!-- > -->

## How do we handle network calls that fail?

If a request returns unexpected data, we want to make sure the app handles it appropriately instead of just crashing 😰

<!-- > -->

## How again?

We should do **fake** network calls.

One straightforward way is to do it by overriding functions in `NSURLSession` and `NSURLSessionDataTask`

<!-- > -->

```swift
class MockSession: URLSession {

    var completionHandler: ((Data, URLResponse, Error) -> Void)?
    static var mockResponse: (data: Data?, URLResponse: URLResponse?, error: Error?)

    override class var shared: URLSession {
        return MockSession()
    }

    override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        self.completionHandler = completionHandler
        return MockTask(response: MockSession.mockResponse, completionHandler: completionHandler)
    }

}
```

<!-- > -->

```swift
class MockTask: URLSessionDataTask {

    typealias Response = (data: Data?, URLResponse: URLResponse?, error: Error?)
    var mockResponse: Response
    let completionHandler: ((Data?, URLResponse?, Error?) -> Void)?

    init(response: Response, completionHandler: ((Data?, URLResponse?, Error?) -> Void)?) {
        self.mockResponse = response
        self.completionHandler = completionHandler
    }

    override func resume() {
        completionHandler!(mockResponse.data, mockResponse.URLResponse, mockResponse.error)
    }
}
```

<!--
We override dataTaskWithRequest returning a fake task, where resume() is also overridden, which is what gives  back a fake response through the completion handler.
-->

<!-- > -->

```swift
func testRetrieveProductsValidResponse() {
    // we have a locally stored product list in JSON format to test against.
    let testBundle = Bundle(forClass: type(of: self))
    let filepath = testBundle.pathForResource("products", ofType: "txt")
    let data = Data(contentsOfFile: filepath!)
    let urlResponse = HTTPURLResponse(url: URL(string: "https://anyurl.doesntmatter.com")!, statusCode: 200, httpVersion: nil, headerFields: nil)
    // setup our mock response with the above data and fake response.
    MockSession.mockResponse = (data, urlResponse: urlResponse, error: nil)
    let requestsClass = RequestManager()
    // All our network calls are in here.
    requestsClass.Session = MockSession.self
    // Replace NSURLSession with our own MockSession.
    // We still need to test as if it's asynchronous. Because well, it is.
    let expectation = XCTestExpectation(description: "ready")
    // For this test, no need to pass in anything useful since it doesn't affect our mocked response.
    // This particular function fetches JSON, converts it to custom objects, and returns them.
    requestsClass.retrieveProducts("N/A", products: { (products) -> () in
        XCTAssertTrue(products.count == 7)
        expectation.fulfill()
    }) { (error) -> () in
        XCTAssertFalse(error == Errors.NetworkError, "Its a network error")
        XCTAssertFalse(error == Errors.ParseError, "Its a parsing error")
        XCTFail("Error not covered by previous asserts.")
        expectation.fulfill()
    }
    waitForExpectations(timeout: 3.0, handler: nil)
}
```

Source: https://getswifty.dev/unit-testing-network-calls-in-swift-dependency-injection/

<!-- > -->

## Another approach

Playground given.

<!-- > -->

## Wrap Up
- Code Coverage, should we aim for 100% all the time?
- TDD discussion
- Highly recommended to complete the tutorial listed in additional resources.
- Keep practicing with small tests.

<!-- > -->

## Additional Resources

1. [Unit testing tutorial](https://www.raywenderlich.com/709-ios-unit-testing-and-ui-testing-tutorial)
1. [XCTest in Apple's Docs](https://developer.apple.com/documentation/xctest)
1. [Book resource (not free)](https://roadfiresoftware.com/unit-testing-in-swift/)
1. [A LOT of testing resources](https://medium.com/flawless-app-stories/a-complete-list-of-articles-on-unit-testing-with-swift-from-2017-9be8f046ef25)
1. [Testing techniques](https://www.marisibrothers.com/2017/03/common-unit-testing-techniques-on-ios.html#1a)
1. [Example](https://gist.github.com/annjose/1baa75b0796d0d2fef1a10ab74d5bd65)
