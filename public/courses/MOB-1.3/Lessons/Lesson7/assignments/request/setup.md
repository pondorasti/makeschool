## Set Up the Request

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

<!-- > -->
