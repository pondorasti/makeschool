//
//  UIView+Extensions.swift
//  custom-views
//
//  Created by Eliel Gordon on 4/24/18.
//  Copyright © 2018 MakeSchool. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func constrain<U: UIView>(to baseView: U) {
        // Important
        // Tells autolayout not to use autoresizing masks as contraints
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: baseView.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: baseView.bottomAnchor).isActive = true
        leadingAnchor.constraint(equalTo: baseView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: baseView.trailingAnchor).isActive = true
    }
    
    func loadNib<T: UIView>(viewType: T.Type) -> T {
        let selfDescription = String(describing: type(of: self))
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: selfDescription, bundle: bundle)
        let nibView = nib.instantiate(
            withOwner: self,
            options: nil
            ).first as! T
        
        return nibView
    }
    
    // Load Xib Components
    func setupXib() {
        // Load Nib from Bundle
        Bundle.main
            .loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)
    }
}
