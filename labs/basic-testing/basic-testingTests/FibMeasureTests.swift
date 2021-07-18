//
//  FibMeasureTests.swift
//  basic-testingTests
//
//  Created by Eliel Gordon on 5/23/18.
//  Copyright © 2018 MakeSchool. All rights reserved.
//

import XCTest
@testable import basic_testing

class FibMeasureTests: XCTestCase {
    let workIterations = [2, 4, 5, 20, 13, 25]
    var fibonacciResults: [Int]!
    
    override func setUp() {
        super.setUp()
        fibonacciResults = [Int](repeating: 0, count: workIterations.count)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testPerformanceOfConcurrentLoops() {
        self.measure {
            DispatchQueue.concurrentPerform(iterations: workIterations.count) { (pass) in
                let workItem = workIterations[pass]
                fibonacciResults[pass] = fib(n: workItem)
            }
        }
    }
    
    func testPerformanceOfSingleThreadedLoop() {
        self.measure {
            for i in 0..<workIterations.count {
                let workItem = workIterations[i]
                fibonacciResults[i] = fib(n: workItem)
            }
        }
    }
    
}
