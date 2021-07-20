//: [Previous](@previous)

import Foundation


let queue = DispatchQueue(label: "com.makeschool.queue")

queue.sync {
    for i in 0..<10 {
        print("🍎 ", i)
    }
}

for i in 100..<110 {
    print("🐳 ", i)
}


//: [Next](@next)
