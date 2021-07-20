//: Playground - noun: a place where people can play

import UIKit

// Same (serial) queue of execution
let queue = DispatchQueue(label: "com.makeschool.queue1", qos: .utility)

queue.async {
    for i in 0..<10 {
        print("🍎 ", i)
    }
}
queue.async {
    for i in 100..<110 {
        print("🐳 ", i)
    }
}

queue.async {
    for i in 1000..<1010 {
        print("🍑 ", i)
    }
}

//: [Next](@next)
