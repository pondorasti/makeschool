//: Playground - noun: a place where people can play

import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let calculation = {
    for i in 0...100 {
        print(i)
    }
}

let thread = Thread {
    print("On thread: \(Thread.current) doing work")
    calculation()
}

print("On thread: \(Thread.current) doing nothing")
thread.name = "Background Thread"
thread.qualityOfService = .userInitiated

thread.start()
