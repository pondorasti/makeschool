//
//  Asyn_Op_TesterTests.swift
//  Asyn_Op_TesterTests
//
//  Created by Thomas Vandegriff on 6/26/19.
//  Copyright © 2019 Make School. All rights reserved.
//

import XCTest
@testable import Asyn_Op_Tester

class Asyn_Op_TesterTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testDownloadWebData() {
        
        //TODO: Create an expectation for a background download task.
        
        
        // Create a URL for a web page to be downloaded.
        let url = URL(string: "https://apple.com")!
        
        // Create a background task to download the web page.
        let dataTask = URLSession.shared.dataTask(with: url) { (data, _, _) in
            
            //TODO: Make sure we downloaded some data.
            
            
        }
        
        // Start the download task.
        dataTask.resume()
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
