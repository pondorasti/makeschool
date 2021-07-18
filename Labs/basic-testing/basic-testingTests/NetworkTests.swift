//
//  NetworkTests.swift
//  basic-testingTests
//
//  Created by Eliel Gordon on 5/23/18.
//  Copyright © 2018 MakeSchool. All rights reserved.
//

import XCTest
@testable import basic_testing

class NetworkTests: XCTestCase {
    let networking = Networking.instance
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testNetworkIsValidWithCorrectParams() {
        let exp = expectation(description: "Network wait")
        
        let domain = "amazon.com"
        
        networking.resolve(resource: .ranking(name: domain)) {
            data in
            
            let decoder = JSONDecoder()
            let result = try? decoder.decode(Ranking.self, from: data)
            
            XCTAssertNotNil(result)
            XCTAssert(result?.domain == domain)
            XCTAssertTrue(result?.rank != -1)
            
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 5)
    }
}
