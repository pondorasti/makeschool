//: [Previous](@previous)

import Foundation

var x: Int = 100
var y: Int = 200


let swap = { (x: inout Int, y: inout Int) in
    
    let temp = x
    x = y
    y = temp
    
}

swap(&x, &y)

let thread2 = Thread {
    swap(&y, &x)
    print(x, y)
}

thread2.start()

print("X: \(x), Y: \(y)")
//: [Next](@next)




