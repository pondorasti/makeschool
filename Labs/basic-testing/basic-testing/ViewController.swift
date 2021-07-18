//
//  ViewController.swift
//  basic-testing
//
//  Created by Eliel Gordon on 5/23/18.
//  Copyright © 2018 MakeSchool. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let networking = Networking.instance
        
        networking.resolve(
            resource: .ranking(name: "amazon.com"),
            completion: parser
        )
    }
    
    func parser(data: Data) {
        let decoder = JSONDecoder()
        let result = try! decoder.decode(Ranking.self, from: data)
        
        print(result)
    }
}

