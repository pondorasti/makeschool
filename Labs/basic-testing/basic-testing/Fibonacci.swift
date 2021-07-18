//
//  Fibonacci.swift
//  basic-testing
//
//  Created by Eliel Gordon on 5/23/18.
//  Copyright © 2018 MakeSchool. All rights reserved.
//

import Foundation

public func fib(n: Int) -> Int {
    // base cases
    if n == 0 {
        return 0
    }
    
    if n == 1 {
        return 1
    }
    
    return fib(n: n - 1) + fib(n: n - 2)
}
