<!-- Run this slideshow via the following command: -->
<!-- reveal-md README.md -w -->


<!-- .slide: class="header" -->

# Building a Network Layer

## [Slides](https://make-school-courses.github.io/MOB-1.3-Dynamic-iOS-Apps/Slides/Lesson10/README.html ':ignore')

<!-- > -->

## Learning Objectives

At the end of this class, you should be able to...

1. Extend the Network Layer to do Post requests
2. Use Apple's AuthenticationServices API
3. Set up URL Schemes

<!-- > -->

## POST vs GET

What's the difference between a POST and a GET request? 🤔

<!-- > -->

## POST requests

To make a change in the server side (create, update, delete), we use the HTTP protocol's **POST method.**

Implementing a POST request is a bit like performing a GET request, except that for a POST you will need to supply additional parameters to the `URLRequest` object.

<!-- > -->

Commonly required parameters include:

- The __httpMethod type__ (i.e., "POST")
- The __content type__ (JSON, in our case)
- Or any other __headers__ specifically required by your target web service API (a valid API Key, for example)

<!-- > -->

### Step 1: Set Up the Session and Requests

Just as we did with our HTTP GET request, we first need to create and configure a **URLSession** and a **URLRequest** object that points to our target web service **URL.**

```Swift
  let session = URLSession.shared
  let url = URL(string: "https://<your_web_service_url>")
  var request = URLRequest(url: url!)
```

<!-- > -->

### Step 2: Configure the Request

**Specify the httpMethod type**

For any web service request other than GET (i.e., POST, PUT, PATCH, DELETE), we need to specify the **httpMethod** to invoke.

Since we are performing a POST here, we will set the httpMethod property to `urlRequest = "POST"`.

```Swift
  request.httpMethod = "POST"
```

<!-- > -->

### Specify Headers

Next, use the URLRequest `setValue(_:forHTTPHeaderField:)` method to set the values of any HTTP headers you want to provide except the `Content-Length` header.

The session automatically figures out content length  from the size of your data.

<!-- > -->

___`Content-Type` Header Field___

We use `Content-Type` header to indicate to the web service API the type of data we are sending.

In our case, we want to set the `Content-Type` to `JSON`.

```Swift
  request.setValue("application/json", forHTTPHeaderField: "Content-Type")
```

<!-- > -->

___`Accept` Header Field___

The `Accept` request header field is used to specify certain **media types** that are acceptable for the **response** object returned by the web service.

We want our response to be returned as JSON, so we set the `Accept` request header field to return JSON.

```Swift
  request.setValue("application/json", forHTTPHeaderField: "Accept")
```

<!-- > -->

___Other Header Fields___

Follow the same process of using the URLRequest `setValue(_:forHTTPHeaderField:)` method to supply all header fields required for communicating with your target web service.

A valid API Key is commonly required for the "Authorization" header field:

```Swift
    request.setValue("<insert_valid_API-KEY_here>", forHTTPHeaderField: "Authorization")
```

<!-- > -->

### Step 3: Convert Data to JSON Format

 `JSONSerialization`

 ```Swift
 JSONSerialization.data(withJSONObject obj: Any, options opt: JSONSerialization.WritingOptions = []) throws
```

`Codable`
Mapping values to a specific type.

<!-- > -->

We convert our data into JSON, then include the converted JSON data into the **httpBody** of the URL request and handle any errors thrown.

```Swift
let parameters: [String: Any] = ["foo": "bar", "numbers": [1, 2, 3, 4, 5]]
do {
    let jsonParams = try JSONSerialization.data(withJSONObject: parameters, options: [])
    request.httpBody = jsonParams
} catch { print("Error: unable to add parameters to POST request.")}
```

The `options` array is left blank here, but it can be used to print or to sort the output (see Apple references below for more details).

<!-- > -->

### Step 4:  Execute Request

Finally, the dataTask will execute our POST request with the our specified header values, and its completion block closure will be executed after the response is returned from the web service.

```swift
session.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
  if error != nil { print("POST Request: Communication error: \(error!)") }
  if data != nil {
    do {
        let resultObject = try JSONSerialization.jsonObject(with: data!, options: [])
         DispatchQueue.main.async(execute: {
            print("Results from POST request:\n\(resultObject)")
         })
     } catch {
         DispatchQueue.main.async(execute: {
           print("Unable to parse JSON response")
          })
      }
   } else {
        DispatchQueue.main.async(execute: {
          print("Received empty response.")
        })
    }
}).resume()
```

<!-- > -->

### Put it altogether

The complete code for an HTTP POST request function would resemble this:

```swift
let session = URLSession.shared
let url = URL(string: "https://<your_web_service_url>")
var request = URLRequest(url: url!)

request.httpMethod = "POST"
request.setValue("application/json", forHTTPHeaderField: "Content-Type")
request.setValue("application/json", forHTTPHeaderField: "Accept")
request.setValue("<insert_valid_API-KEY_here>", forHTTPHeaderField: "Authorization")

let parameters: [String: Any] = ["foo": "bar", "numbers": [1, 2, 3, 4, 5]]
    do {
      let jsonParams = try JSONSerialization.data(withJSONObject: parameters, options: [])
      request.httpBody = jsonParams
    } catch { print("Error: unable to add parameters to POST request.")}

    session.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
    if error != nil { print("POST Request: Communication error: \(error!)") }

    if data != nil {
        do {
          let resultObject = try JSONSerialization.jsonObject(with: data!, options: [])
          DispatchQueue.main.async(execute: {
            print("Results from POST request:\n\(resultObject)")
          })
      } catch {
          DispatchQueue.main.async(execute: {
            print("Unable to parse JSON response")
          })
      }
    } else {
      DispatchQueue.main.async(execute: {
        print("Received empty response.")
      })
    }
}).resume()
```

<!-- > -->

## Warmup with POST requests

Create a playground to do a POST request like the previous example.

Use the [JSONPlaceholder API](https://jsonplaceholder.typicode.com). Make a POST request that creates a new entry in a TODO list.

Your POST request should pass data for these parameters:
- "userId"
- "title"
- "completed"

<!-- > -->

Your console output should be something similar to this:

```
Results from POST request:
{
    completed = 0;
    id = 201;
    title = "Do laundry";
    userId = 100;
}
```

<!-- > -->

<!--
## Challenge

### Required Resources:
1. The pre-made [starter app for Lesson 10](https://github.com/VanderDev1/Lesson10.git)

2. [JSONPlaceholder API](https://jsonplaceholder.typicode.com)  - a free "Fake Online REST API for Testing and Prototyping"

For this challenge, we will ___simulate___ an HTTP **POST** request to the JSONPlaceholder API's `todos` endpoint.

**TIP:** The JSONPlaceholder API's home page provides a link to their "How to" page, which provides clues about how to create a successful POST request to their `todos` endpoint. But the code featured there is *JavaScript, not Swift...*

### Your Assignment:

Inside the `URLSessionApiService` class of the pre-made [starter app for Lesson 10](https://github.com/VanderDev1/Lesson10.git), you are to **create a function** that **executes a POST request** to the https://jsonplaceholder.typicode.com/todos endpoint.



___Hint:___ The app is already set up with a button to invoke your POST request function

**TODO #1 -** Create the POST request function:

Your POST request should pass data for these parameters:
- "userId"
- "title"
-  "completed"

Appending an actual user id to the endpoint shows you the data structure and parameters needed...

For example, running the following URL for `"userId" = 6` in a browser...

https://jsonplaceholder.typicode.com/todos/6

...will shows the fields and current status for userId 6:

```Swift
{
 "userId": 6,
 "id": 101,
 "title": "explicabo enim cumque porro aperiam occaecati minima",
 "completed": false
}
```

**TODO #2 -** Validate Results:

- errors or successful results<sup>[2](#footnote2)</sup> can be found in your Xcode Debug log, so be sure to print messages to the log to signify *success* or *failure* conditions...

<!--
3. In constructing your project, follow practices we learned for constructing an API Layer...

- Create a Request Builder class to supply the configured request for the POST request (for now -- we will expand this class later in the course)

5. Add a Unit Test for asserting 1 failed/error condition

-->

## Moviefy Pt. 2

Complete the second part of the [Moviefy Tutorial](https://www.makeschool.com/mediabook/oa/tutorials/moviefy-app-004/getting-started/) that introduces authentication.

<!-- > -->

## Additional Resources

- [Separation of Concerns (withJSONObject) - from Wikepedia](https://en.wikipedia.org/wiki/Separation_of_concerns)
- Apple on JSONSerialization Reading and Writing Options:</br>
- [Writing Options - from Apple](https://developer.apple.com/documentation/foundation/jsonserialization/writingoptions)
- [Reading Options - from Apple](https://developer.apple.com/documentation/foundation/jsonserialization/readingoptions)
- [Writing a network layer - Protocol Oriented](https://medium.com/flawless-app-stories/writing-network-layer-in-swift-protocol-oriented-approach-4fa40ef1f908)
- [Writing network layer](https://medium.com/@rinradaswift/networking-layer-in-swift-5-111b02db1639)
