
## Present Results  

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
