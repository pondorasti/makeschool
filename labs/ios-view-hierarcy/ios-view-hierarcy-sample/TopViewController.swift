//
//  ViewController.swift
//  ios-view-hierarcy-sample
//
//  Created by Eliel A. Gordon on 3/6/18.
//  Copyright © 2018 Eliel Gordon. All rights reserved.
//

import UIKit

class TopViewController: UIViewController {
    weak var windowDelegate: ApplicationSwitcherDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func switchWindowPressed(_ sender: Any) {
        windowDelegate?.switchWindow(to: .admin)
    }
}

