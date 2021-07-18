# Networking Overview - Authentication

### Objectives
- Request - Response cycle
- HTTP - Headers, URL Parameters
- HTTP Body types: JSON, Text, Multipart
- Handling JSON
- Third party networking libraries


## HTTP Requests
HTTP Headers

### Standard HTTP Headers

- Authorization - Used to pass authorization data for requests.
eg `Authorization: Bearer ya29.AHES6ZRVmB7fkLtd1XTmq6mo0S1wqZZi3-Lh_s- ...`

- Content-Type - The MIME type of the request or response. eg application/json, multipart/form-data; charset=utf-8; boundary=__X_PAW_BOUNDARY__
Content-Type describes the type of content the request is sending or receiving, - sending json vs image vs html


### URL Parameters
These are key=value pairs and are separated from the rest of the URL by a ? (question mark) character and are normally separated from each other by & (ampersand) characters. What you may not know is the fact that it is legal to separate them from each other by the ; (semi-colon) character as well.


### HTTP Body Types
JSON - commonly used to send simple data types and objects to the server
Multipart/Form-Data - used to send large files and data over to the server

### Handing Authentication Tokens
Login is performed with some credentials eg(email, password), server receives this and verifies that the user exists and the password checks out with the hashed password. An authentication token is sent back typically as a an HTTP header eg Authorization

Store the authentication token in the keychain! 

The authentication token is then used for subsequent requests that require authentication as part of the http request header


## Handling JSON
Foundation framework provides NSJSONSerialization
Class is poorly suited for Swift

For sane JSON parsing code we need to use third party
libraries that implement type checking for us

There are many libraries available: Gloss, SwiftyJSON, Argo,
etc.


### Handling JSON with Gloss

```swift
import Gloss

struct JSONAnswer {
    let id: Int
    let videoURL: URL
    let thumbnailURL: URL
    let question: JSONQuestion
    let likesCount: Int
    let commentsCount: Int
}

extension JSONAnswer: Decodable {
    init?(json: JSON) {
        guard let id: Int = "id" <~~ json,
        let videoURL: URL = "video_url" <~~ json,
        let thumbnailURL: URL = "thumbnail_url" <~~ json,
        let question: JSONQuestion = "question" <~~ json
            else {return nil}
        
        self.id = id
        self.videoURL = videoURL
        self.thumbnailURL = thumbnailURL
        self.question = question
        self.likesCount = "likes_count" <~~ json ?? 0
        self.commentsCount = "comment_count" <~~ json ?? 0
    }
}

let task = session.dataTaskWithRequest(urlRequest) { data, response, error in
    if let data = data {
        let json = try! NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(rawValue: 0))
        let post = JSONAnswer(json: json as! JSON)
        print(post)
    }
}
postTask.resume()

```

## Third Party Networking Libraries

Networking code encounters issues that are similar for all
different kinds of apps

Third party libraries help in solving these common problems
(e.g. parsing responses from as server)

- Alamofire: an abstraction on top of NSURLSession with a
simplified API 

- Moya: built on top of Alamofire, improves modeling of API
client

- Tiny networking: a minimal networking library by Chris
Eidhof, read accompanying blog post


## Summary

- NSURLSession is the main networking API in iOS

- (Sane) JSON parsing in Swift requires third party
libraries

- Popular third party networking libraries provide
abstractions over NSURLSession


# Next - [Layout Essentials](../06-Layout-Essentials/layout-essentials.md)