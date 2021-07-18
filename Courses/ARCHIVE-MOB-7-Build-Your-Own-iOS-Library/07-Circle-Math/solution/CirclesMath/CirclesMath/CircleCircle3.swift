//
//  CircleCircle.swift
//  CirclesMath
//
//  Created by mitchell hudson on 1/27/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import UIKit

class CircleCircle3: UIView {

    var circleLayers = [CALayer]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Make some circles
        let circleSize:CGFloat = 40
        let ringRadius: CGFloat = 120
        let totalCircles = 12
        let c = center
        
        for i in 0 ..< totalCircles {
            let r = CGRect(x: 0, y: 0, width: circleSize, height: circleSize)
            let v = UIView()
            v.frame = r
            v.backgroundColor = UIColor.orange
            v.layer.cornerRadius = circleSize / 2
            addSubview(v)
            
            // Arrange the circles in a circle!
            let t = CGFloat(M_PI * 2) / CGFloat(totalCircles) * CGFloat(i)
            let x = sin(t) * ringRadius + c.x
            let y = cos(t) * ringRadius + c.y
            v.center.x = x
            v.center.y = bounds.height + circleSize // Position the circle off the bottom of the screen.
            
            v.alpha = 0
            let delay = 0.15 * TimeInterval(i)
            
            UIView.animateKeyframes(withDuration: 0.5, delay: delay, options: [], animations: {
                v.alpha = 1
                v.center.y = y // Animate the y property. 
            }, completion: nil)
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
