//
//  BottomViewController.swift
//  ios-view-hierarcy-sample
//
//  Created by Eliel A. Gordon on 3/7/18.
//  Copyright © 2018 Eliel Gordon. All rights reserved.
//

import UIKit

class BottomViewController: UIViewController {
    weak var windowDelegate: ApplicationSwitcherDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func switchToCustomerPressed(_ sender: Any) {
        windowDelegate?.switchWindow(to: .customer)
    }
}
