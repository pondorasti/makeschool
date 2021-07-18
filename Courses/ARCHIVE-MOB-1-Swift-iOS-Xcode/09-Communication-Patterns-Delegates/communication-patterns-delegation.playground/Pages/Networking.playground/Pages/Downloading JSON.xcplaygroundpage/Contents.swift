import Foundation
import PlaygroundSupport

//: [Previous](@previous)

/*:
 # Downloading JSON
 
 More often than not, we will be dealing with JSON responses from servers.
 Lets look at how we will grab some json from an API using a *get* request.
 
*/

let url = URL(string: "https://jsonplaceholder.typicode.com/photos/1")!

var request = URLRequest(url: url)
request.httpMethod = "GET"

let session = URLSession.shared

let task = session.dataTask(with: request) { (data, response, error) in
    
    if let data = data {
        let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
        print(json)
    }
}

// Don't forget to resume task
task.resume()


//: Below is code required to run this playground, it is not a part of the class material
PlaygroundSupport.PlaygroundPage.current.needsIndefiniteExecution = true

//: [Next](@next)
