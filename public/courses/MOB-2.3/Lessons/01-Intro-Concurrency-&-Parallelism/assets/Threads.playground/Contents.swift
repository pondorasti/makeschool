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

    //TODO: What must the thread do here to match the expected output listed below?
}

print("On thread: \(Thread.current) doing nothing")
//TODO: Give new thread its proper name, as in expected output...
thread.qualityOfService = .userInitiated

thread.start()

/* EXPECTED OUTPUT:
 On thread: <NSThread: 0x6000022d28c0>{number = 1, name = main} doing nothing
 On thread: <NSThread: 0x6000022fba00>{number = 3, name = Background Thread} doing work
 0
 1
 2
 3
 4
 5
 6
 7
 8
 9
 10
 11
 ...
 100
 */
