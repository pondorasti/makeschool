# Alamofire 

Alamofire is a networking library for iOS, written in Swift. It's a wrapper around Apple's Foundation networking suite. It simplifies handling requests and responses, serializing JSON, authentication, among other things.

Methods available:

- Alamofire.upload: Upload files with multipart, stream, file or data methods.
- Alamofire.download: Download files or resume a download already in progress.
- Alamofire.request: Requests not associated with file transfers.

Something to note is that we don't need to instantiate a class to use Alamofire's methods because they are global within the library.

## In Class Activity I (25 min)

1. Using the pre-made starter app [Lesson10](https://github.com/VanderDev1/Lesson10.git), copy the following code in your ViewController. This is a network request that looks like the type of requests we've used so far.

<!-- Create a new project copy the following code in your ViewController. This is a network request that looks like the type of requests we've used so far.
-->

```Swift
        let endpoint: String = "https://jsonplaceholder.typicode.com/todos/1"
        guard let url = URL(string: endpoint) else {
            print("error creating the URL")
            return
        }
        let urlRequest = URLRequest(url: url)
        // creating the URLSession
        let session = URLSession(configuration: .default)
        // creating the data task
        let task = session.dataTask(with: urlRequest) {(data, response, error) in
            // check for any errors
            guard error == nil else {
                print("error calling the endpoint")
                print(error!)
                return
            }
            // validate data
            guard let responseData = data else {
                print("error receiving data")
                return
            }
            // parse the result as JSON
            do {
                guard let todo = try JSONSerialization.jsonObject(with: responseData, options: [])
                    as? [String: Any] else {
                        print("error converting data to JSON")
                        return
                }
                // if everything is fine, we get a JSON object. We want to print the title of the todo object.
                guard let title = todo["title"] as? String else {
                    print("couldn't find title")
                    return
                }
                print("The title is: " + title)
            } catch  {
                print("error converting data to JSON")
                return
            }
        }
        task.resume()
```
Analyze all the elements of the request, identify where you create the URLRequest, URLSession, dataTask, how to handle the response, data and error.

We are going to write the same request using Alamofire.

1. Go to [Alamofire](https://github.com/Alamofire/Alamofire)'s website and follow the instructions to include the library in your project. You will need to create a podfile and install the library via Cocoapods.

1. Now go back to your ViewController and import Alamofire
1. To make a simple request in Alamofire you will use the following code:
```Swift
Alamofire.request(endpoint).responseJSON { response in
    // handle response
}
// the default HTTP method is GET but we can specify it as well.
Alamofire.request(endpoint, method: .get).responseJSON { response in
  // handle response
}
```
This is how we would set up and send a request.<br>
Is that simple. What differences can you see on the way we are making the request?<br><br>
So what is `.responseJSON`? It's the way in which Alamofire calls `JSONSerialization` on our behalf. So we only worry if we're getting the JSON object in the expected type we specify.
<br><br>Now we have to handle the response.<br><br>
1. Check for an error
```Swift
guard response.result.error == nil ...
```
1. If there's none check if there's a JSON result.
```Swift
guard let json = response.result.value as? ...
```
1. If we can transform the JSON then we print out the title of the todo object.
```Swift
guard let todoTitle = json["title"] as? ...
```
Try to complete it on your own. Then validate with the final result:
```Swift
let endpoint: String = "https://jsonplaceholder.typicode.com/todos/1"
        Alamofire.request(endpoint).responseJSON { response in
                guard response.result.error == nil else {
                    print(response.result.error!)
                    return
                }
                guard let json = response.result.value as? [String: Any] else {
                    print("Error: \(response.result.error)")
                    return
                }
                guard let title = json["title"] as? String else {
                    print("Could not find title")
                    return
                }
                print("The title is: " + title)
        }
```
1. Now create another Alamofire request of type POST. <br>
Endpoint: https://jsonplaceholder.typicode.com/todos <br>
Parameters: ["title": "Super Cool Post", "completed": 0, "userId": 8]
1. If you have time left, ty a DELETE request to this endpoint: https://jsonplaceholder.typicode.com/todos/1 and print a message if the request was successful.

**Q:** When is it a good idea to use Alamofire over our own network implementation?<br>
**Q:** What are the pros and cons of using it?
