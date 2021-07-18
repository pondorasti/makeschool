import PlaygroundSupport

/*:
 # URLs, URLRequests and URLSessions
 
 
 ## URL - Uniform Resource Locator
 
*/


/*:
 ## Constructing URLRequests
 
 ### Creating a get request to download an html webpage
 
 To create a network request in iOS, there are 3 main parts to it.
 
 1. First construct a url for the resource you want to get/update/delete/create
 2. Create a URLRequest with the URL
 3. Create a URLSession with the URLRequest
 
 
*/

// 1
let url = URL(string: "www.google.com/images/434.png")!

// 2
var request = URLRequest(url: url)
request.httpMethod = "GET"

//3
let session = URLSession.shared

let task = session.dataTask(with: request) { (data, response, error) in
    
}

task.resume()


/*:
 ### URLRequest
 Depending on what kind of request you are making(post,get etc..), you will need to
 change the http method and add a body.
 
 ### URLSession
 The session has information about the request to be made. It is also responsible for executing the network request.
 Calling *resume()* on the task returned by the session kicks off the network request.
 
*/

//: [Next](@next)


//: Below is code required to run this playground, it is not a part of the class material
PlaygroundSupport.PlaygroundPage.current.needsIndefiniteExecution = true
