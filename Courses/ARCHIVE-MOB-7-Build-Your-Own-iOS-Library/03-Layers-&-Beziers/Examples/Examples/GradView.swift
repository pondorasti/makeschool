//
//  GradView.swift
//  Examples
//
//  Created by mitchell hudson on 1/25/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import UIKit

class GradView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let g = CAGradientLayer()
        g.frame = bounds
        
        let a = UIColor.red.cgColor
        let b = UIColor.yellow.cgColor
        let colors = [a, b]
        
        g.colors = colors
        g.startPoint = CGPoint(x: 0, y: 0.5)
        g.endPoint = CGPoint(x: 1, y: 0.0)
        
        self.layer.addSublayer(g)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
