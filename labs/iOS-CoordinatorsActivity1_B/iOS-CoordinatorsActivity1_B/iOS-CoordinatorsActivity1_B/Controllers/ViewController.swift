//
//  ViewController.swift
//  iOS-CoordinatorsActivity1_B
//
//  Created by Thomas Vandegriff on 4/24/19.
//  Copyright © 2019 Make School. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Storyboarded {

     weak var coordinator: MainCoordinator?
    
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var createAccountBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func buyTapped(_ sender: Any) {
         coordinator?.buySubscription()
    }
    
    @IBAction func createAccountTapped(_ sender: Any) {
        coordinator?.createAccount()
    }
}

