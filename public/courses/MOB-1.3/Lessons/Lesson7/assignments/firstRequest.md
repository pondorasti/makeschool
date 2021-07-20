# Jigsaw - making a request

## 1. Configure the Session

Configuring a `URLSession` object can be as simple as writing a single-line declaration, or you can specify a complex set of conditions and parameters to control your session's state and behavior.

The following code illustrates a complex set of configuration parameters applied to a session defined as a `.background` session:

``` Swift
private lazy var urlSession: URLSession = {
    let config = URLSessionConfiguration.background(withIdentifier: "MySession")
    config.isDiscretionary = true
    config.sessionSendsLaunchEvents = true
    return URLSession(configuration: config, delegate: self, delegateQueue: nil)
}()
```

<!-- > -->

For this assignment, it's ok to work with a simple, one-line `.default` session configuration:

``` Swift
let defaultSession = URLSession(configuration: .default)
```

**When you contribute in the making of the request, share: Why do we use the default configuration?**

<!-- > -->

____________________________________________________________________

## 2. Set Up the Request

#### Create the URL Object

The `URL` class defines a local or remote [URI](https://en.wikipedia.org/wiki/Uniform_Resource_Identifier). It could be a link to a remote HTML webpage, a local file accessed using `file:///` or any other item qualifying as a `URI.`

```swift
// Create URL
let url = URL(string: "https://<your_target_web_service>")
```

<!-- > -->

#### Create the URLRequest Object

Though it is possible to send a very simple request, the `URLRequest` object represents a URL and offers configuration parameters for setting the request's **body, headers, and access method** (GET, POST, etc).

There are various constructor signatures available for creating `URLRequest` objects. This one only requires a valid URL object as its single argument:

```swift
// Create Request
let request = URLRequest(url: url!)
```

**When you contribute in the making of the request, share: Are there other initializers for the URLRequest? What's another option?**

<!-- > -->

____________________________________________________________________

## 3. Make the Request

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

____________________________________________________________________


## 4. Handle the Response

When the `completion handler` closure is executed, you can validate the data returned and process it for presentation to the user, or whatever your app needs to do with it.

<!-- > -->

#### URLResponse Object

The counterpart to the URLRequest object, the `URLResponse` object is returned when the `completion handler` closure successfully executes.

It contains valuable info about the response returned, including:
- the HTTP Status Code
- the HTTP headers

<!-- > -->

#### Handle the `error` Object

Check if the `error` object is `nil.` If not, *properly* handle the error (for now, we'll simply print the error returned):

```swift
// guard against any errors with this HTTP response
guard error == nil else {
  print ("error: ", error!)
  return
}
```

<!-- > -->

#### Confirm the Data Object

Ensure that a `data` object has been returned with the response:

```swift
// protect against no data returned from HTTP response...
guard data != nil else {
  print("No data object")
  return
}
```

**When you contribute in the making of the request, share: What are the objects we get back in the completion handler? How can we validate them?**

____________________________________________________________________

<!-- > -->

## 5. Present Results  

Typically, you will want to process and present the JSON data returned from the GET request.

But before we examine how to *serialize/deserialize* the JSON object returned, we'll simply use `print()` statements to examine and confirm what is returned from our request.

```swift
// Create Data Task
let dataTask = defaultSession.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
    print("data is: ", data!)
    print("response is: ", response!)
})
```

#### JSON Serialization of HTTP Responses

Finally, we want to convert (*deserialize*) the binary data object returned into a JSON object that we can process as a Swift collection object (a dictionary or an array).

And we want to properly respond to potential errors by wrapping our JSONSerialization work in a `do-try-catch` block:

```swift
...
// Convert response data to JSON
  do {
      let jsonObject = try JSONSerialization.jsonObject(with: data!, options: [])
        print(jsonObject)
      } catch {
          print("JSON error: \(error.localizedDescription)")
      }
```

Once we are clear on the steps required to process the returned JSON data, we will be set up to present our returned data to the user (using tables, collection views, image galleries, etc.)

**When you contribute in the making of the request, share: What needs to be done after getting data back?**
