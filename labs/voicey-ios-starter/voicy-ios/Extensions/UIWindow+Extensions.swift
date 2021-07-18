//
//  UIWindow+Extensions.swift
//  voicy-ios
//
//  Created by Eliel A. Gordon on 1/5/18.
//  Copyright © 2018 Eliel Gordon. All rights reserved.
//

import Foundation
import UIKit

extension UIWindow {
    func makeCorners() {
        let path = UIBezierPath(
            roundedRect: self.frame,
            byRoundingCorners: [.topLeft, .topRight],
            cornerRadii: CGSize(width: 15, height: 15)
        )
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        
        self.layer.mask = maskLayer
        self.clipsToBounds = true
    }
    
    func makeGradient(firstColor: UIColor, secondColor: UIColor) {
        let gradient = CAGradientLayer()
        
        gradient.frame = self.bounds
        
        gradient.colors = [
            firstColor.cgColor,
            secondColor.cgColor
        ]
        
        self.layer.insertSublayer(gradient, at: 0)
    }
}
