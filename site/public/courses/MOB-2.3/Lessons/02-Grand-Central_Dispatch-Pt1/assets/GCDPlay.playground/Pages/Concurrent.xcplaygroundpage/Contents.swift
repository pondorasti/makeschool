//: [Previous](@previous)

import Foundation

let queue = DispatchQueue(label: "sample.concurrent", qos: .utility, attributes: .concurrent)

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
