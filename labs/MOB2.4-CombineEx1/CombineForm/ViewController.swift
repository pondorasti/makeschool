//
//  ViewController.swift
//  CombineForm
//
//  Created by Adriana González Martínez on 2/21/21.
//

import UIKit
import Combine

class ViewController: UIViewController {
    
    let emailTextField: UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.placeholder = "Enter your email"
        txt.autocapitalizationType = .none
        return txt
    }()
    
    let passwordTextField: UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.placeholder = "Choose your password"
        txt.autocapitalizationType = .none
        return txt
    }()
    
    let confirmPasswordTextField: UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.placeholder = "Confirm your password"
        txt.autocapitalizationType = .none
        return txt
    }()
    
    let emailWarning: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .systemRed
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Minimum 3 characters required"
        return lbl
    }()
    
    let passwordWarning: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .systemRed
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Passwords must match and have at least 5 characters"
        lbl.numberOfLines = 0
        return lbl
    }()
    
    let registerButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitleColor(.darkGray, for: .normal)
        btn.setTitleColor(.lightGray, for: .disabled)
        btn.setTitle("Register", for: .normal)
        btn.isUserInteractionEnabled = true
        btn.addTarget(self, action: #selector(goRegister), for: .touchUpInside)
        return btn
    }()
    
    let stack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.axis = .vertical
        return stack
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Welcome 🤓"
        setupStack()
        
    }
    
    func setupStack(){
        self.view.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stack.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stack.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            stack.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.5)
        ])
        stack.addArrangedSubview(emailTextField)
        stack.addArrangedSubview(emailWarning)
        stack.addArrangedSubview(passwordTextField)
        stack.addArrangedSubview(confirmPasswordTextField)
        stack.addArrangedSubview(passwordWarning)
        stack.addArrangedSubview(registerButton)
    }
    
    @objc func goRegister(){
        let alert = UIAlertController(title: "Register", message: "Successful", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
}
