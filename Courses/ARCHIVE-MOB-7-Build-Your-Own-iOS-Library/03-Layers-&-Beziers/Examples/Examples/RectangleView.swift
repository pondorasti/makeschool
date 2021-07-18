//
//  RectangleView.swift
//  Examples
//
//  Created by mitchell hudson on 1/25/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import UIKit

class RectangleView: UIView {

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        for i in 0 ... 8 {
            let inset = CGFloat(i) * 10
            let r = bounds.insetBy(dx: inset , dy: inset)
            let l = CALayer()
            l.frame = r
            let hue = CGFloat(i) * 0.03
            l.backgroundColor = UIColor(
                hue: hue,
                saturation: 1,
                brightness: 1,
                alpha: 1).cgColor
            
            self.layer.addSublayer(l)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("RectangleView! init(coder:) has not been implemented")
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
