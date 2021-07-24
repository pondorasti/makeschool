//
//  CircleCircle.swift
//  CirclesMath
//
//  Created by mitchell hudson on 1/27/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import UIKit

class CircleCircle: UIView {

    var circleLayers = [CALayer]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Make some circles
        let circleSize:CGFloat = 40
        let ringRadius: CGFloat = 120
        let totalCircles = 12
        let c = center
        
        
        for i in 0 ..< totalCircles {
            // Define a rect for each circle. Setting the position here is problematic since
            // the origin x, y is the upper left corner. Better to position by setting the center.
            let r = CGRect(x: 0, y: 0, width: circleSize, height: circleSize)
            // Make a layer.
            let l = CALayer()
            l.frame = r                                 // Set the frame
            l.backgroundColor = UIColor.blue.cgColor    // the color
            l.cornerRadius = circleSize / 2             // and the cornerRadius
            layer.addSublayer(l)                        // Add as a sub layer
            
            // Arrange the circles in a circle!
            let t = CGFloat(M_PI * 2) / CGFloat(totalCircles) * CGFloat(i) // Get the angle
            let x = sin(t) * ringRadius + c.x   // Use sin and cos to map the angle to x
            let y = cos(t) * ringRadius + c.y   // and y coordinates on the screen around c
            l.position.x = x    // Set the x and y. 
            l.position.y = y
        }
        
        
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
