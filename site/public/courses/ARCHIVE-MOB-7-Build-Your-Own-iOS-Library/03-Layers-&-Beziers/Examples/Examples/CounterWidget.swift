//
//  CounterWidget.swift
//  Examples
//
//  Created by mitchell hudson on 1/25/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import UIKit

class CounterWidget: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        
        backgroundColor = UIColor.magenta
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        let plus = CALayer()
        let minus = CALayer()
        let circle = CALayer()
        
        let darkGray = UIColor(white: 0.3, alpha: 1).cgColor
        let lightGray = UIColor(white: 0.8, alpha: 1).cgColor
        let w: CGFloat = 10
        
        plus.borderColor = darkGray
        minus.borderColor = darkGray
        circle.borderColor = darkGray
        
        plus.borderWidth = w
        minus.borderWidth = w
        circle.borderWidth = w
        
        plus.backgroundColor = lightGray
        minus.backgroundColor = lightGray
        circle.backgroundColor = lightGray
        
        circle.frame = bounds.insetBy(dx: 40, dy: 40)
        circle.cornerRadius = circle.bounds.width / 2
        layer.addSublayer(circle)
        
        plus.frame = CGRect(x: 0, y: bounds.height / 2 - 40, width: 80, height: 80)
        plus.cornerRadius = 40
        layer.addSublayer(plus)
        
        minus.frame = CGRect(x: bounds.width - 80, y: bounds.height / 2 - 40, width: 80, height: 80)
        minus.cornerRadius = 40
        layer.addSublayer(minus)
        
        let number = CATextLayer()
        number.frame = bounds.insetBy(dx: 100, dy: 100)
        number.string = "3"
        number.fontSize = 80
        number.alignmentMode = kCAAlignmentCenter
        
        layer.addSublayer(number)
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
