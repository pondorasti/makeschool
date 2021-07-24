## Handle the Response

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
