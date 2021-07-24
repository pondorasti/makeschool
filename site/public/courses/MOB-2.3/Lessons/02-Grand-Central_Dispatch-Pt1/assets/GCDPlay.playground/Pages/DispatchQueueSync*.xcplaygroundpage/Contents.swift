//: [Previous](@previous)

import Foundation
import UIKit

let queue = DispatchQueue(
    label: "sample.concurrent",
    qos: .userInitiated,
    attributes: .concurrent
)

queue.async {
    print("I am \(Thread.current) an async thread")
    print(45)
}

queue.async {
    print("I am \(Thread.current) a sync thread")
    Thread.sleep(forTimeInterval: 10)
}

print("I am on the main thread - \(Thread.current)")

//: [Next](@next)
