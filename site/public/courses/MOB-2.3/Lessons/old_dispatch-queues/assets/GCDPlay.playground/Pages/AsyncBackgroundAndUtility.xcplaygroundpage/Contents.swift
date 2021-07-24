//: [Previous](@previous)

import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let queue1 = DispatchQueue(label: "com.makeschool.queue1", qos: .background)
let queue2 = DispatchQueue(label: "com.makeschool.queue2", qos: .utility)

queue1.async {
    for i in 0..<10 {
        print("🍎 ", i)
    }
}

queue2.async {
    for i in 100..<110 {
        print("🐳 ", i)
    }
}


//: [Next](@next)
