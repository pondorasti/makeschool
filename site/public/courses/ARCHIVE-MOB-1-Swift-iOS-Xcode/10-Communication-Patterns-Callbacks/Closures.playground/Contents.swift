//: Playground - noun: a place where people can play

import UIKit
import Foundation
import PlaygroundSupport

// Allows us to run http request and wait for them
PlaygroundPage.current.needsIndefiniteExecution = true

//: ## 1) add function, adds two numbers a and b
// (Int, Int) -> Int

func add(a: Int, b: Int) -> Int {
    return a + b
}

// function signature ->
var closureAdd: (Int, Int) -> Int = { x, y in
    return x + y
}

add(a: 2, b: 3)
closureAdd(2, 3)

// 2) Closure add


/*:
 ## 3) transformNumber, Extend capabilites of functions (used in many stdlib methods)
  Trailing closure syntax
  Closures can capture values
*/
func transformNumber(a: Int, operand: (Int) -> Int) -> Int {
    return operand(a)
}

func divideBy2(b: Int) -> Int {
    return b/2
}

transformNumber(a: 4, operand: divideBy2)
transformNumber(a: 4, operand: { (a: Int) -> Int in
    return  a * 2
})

transformNumber(a: 3) { (x: Int) -> Int in
    return x / 2
}

transformNumber(a: 3, operand: { $0 * 3 } )




//: ## 4) iOS Example of closure, Completion blocks
let url = URL(string: "https://www.gardeningknowhow.com/wp-content/uploads/2009/03/cabbage.jpg")!
var imageView = UIImageView(frame: CGRect(x: 0, y: 0,width: 300, height: 280))

// Doesn't work, can we fix it with a closure?
func downloadImage(imageURL: URL, completion: @escaping (UIImage?) -> Void ) {
    
    let session = URLSession.shared
    let task = session.dataTask(with: imageURL) { taskData, response, error in
        guard let taskData = taskData else {return}
        let myImage = UIImage(data: taskData)
        // Finished
        completion(myImage)
    }
    
    task.resume()
}

// Download image and update UIImageView with new image on main thread
downloadImage(imageURL: url, completion: { (image: UIImage?) -> Void in
    guard let myImage = image else {return}
    DispatchQueue.main.async {
        imageView.image = myImage
    }
})



let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
containerView.addSubview(imageView)
PlaygroundPage.current.liveView = containerView

// 5)
//: ## Standard lib examples (Sorted: by)
let numbers = [2, 4, 1, 8, 2, 5, 8, 1, 90, 33, 42]

numbers.sorted { (a, b) -> Bool in
    a > b
}



