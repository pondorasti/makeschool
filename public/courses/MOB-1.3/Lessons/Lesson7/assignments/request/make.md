## Make the Request

#### The Data Task

To make a request, you create an instance of the `URLSessionDataTask` class, pass it your `URLRequest/URL,` and call its completion handler.

```swift
...
// Create Data Task
let dataTask = defaultSession.dataTask(with: request, completionHandler: { (data, response, error) -> Void in

  // handle Response Here

})
...
```

The `completion handler` is a closure that is executed when your data task is finished and the response to your request has been returned.

<!-- > -->

##### The Objects Returned

Let's take a moment to examine the `data,` `response,` and `error` objects returned when the data task's completion handler finishes:

```swift
let dataTask = defaultSession.dataTask(with: request, completionHandler: { (data, response, error) ->
...
```

<!-- v -->

- `data` - Is an object of type `Data` (aka, `NSData`). NSData objects encapsulate data in a binary format. To manipulate or present its contents, we will have to convert it to a more human-readable format (i.e, JSON).

<!-- v -->

- `response` - Is of type `NSHTTPURLResponse,` which is a subclass of `URLResponse.` It contains useful data about the response itself that often comes in handy when analyzing success or failure of a specfic request.

<!-- v -->

- `error` - Behind this object is a simple `enum` listed in the official framework docs as "A type representing an error value that can be thrown." If the request is *not* successful, this `error` object will be passed to the completion handler. When the request is successful, this will be `nil.` *(Though we'll see later that the request can still fail, at some level, even if the `error` object is `nil` after the data task completes.)*

<!-- > -->

#### The .resume() function

At this point, your network request has only been set up. To execute it, you'll need to start it.

By **default**, Apple has set up all newly-initialized tasks to begin in a **suspended state.** So you need to call the `.resume()` function on a task in order to start it.


**When you contribute in the making of the request, share: Why is the dataTask using a completion handler? Why do we call the resume function?**

<!-- > -->
