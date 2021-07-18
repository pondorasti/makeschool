//
//  ViewController.swift
//  KeychainDemo
//
//  Created by Adriana González Martínez on 6/16/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var messageTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Keychain Demo 🔐"
        navigationController?.navigationBar.prefersLargeTitles = true

    }

    @IBAction func saveBtnPressed(_ sender: Any) {
    }
    
}

