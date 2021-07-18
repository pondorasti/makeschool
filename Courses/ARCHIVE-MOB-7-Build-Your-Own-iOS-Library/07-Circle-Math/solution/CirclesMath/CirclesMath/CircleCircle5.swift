//
//  CircleCircle.swift
//  CirclesMath
//
//  Created by mitchell hudson on 1/27/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import UIKit

class CircleCircle5: UIView {

    var circleLayers = [CALayer]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Make some circles
        let circleSize:CGFloat = 40
        let ringRadius: CGFloat = 120
        let totalCircles = 12
        let c = center
        
        let formatter = NumberFormatter()
        formatter.roundingMode = .down
        formatter.maximumSignificantDigits = 2
        
        for i in 0 ..< totalCircles {
            let r = CGRect(x: 0, y: 0, width: circleSize, height: circleSize)
            let v = UILabel()

            v.frame = r
            addSubview(v)

            // Arrange the circles in a circle!
            let t = CGFloat(M_PI * 2) / CGFloat(totalCircles) * CGFloat(i)
            let x = sin(t) * ringRadius + c.x
            let y = cos(t) * ringRadius + c.y
            v.center = c

            // Configure label
            v.textAlignment = .center
            v.numberOfLines = 0
            v.font = UIFont.systemFont(ofSize: 12)
            v.adjustsFontSizeToFitWidth = true
            v.text = "\(formatter.string(for: t)!),\n \(formatter.string(for: x)!), \(formatter.string(for: y)!)"
            v.sizeToFit()
            
            v.alpha = 0
            let delay = 0.15 * TimeInterval(i)
            
            UIView.animateKeyframes(withDuration: 0.5, delay: delay, options: [], animations: {
                v.alpha = 1
                v.center = CGPoint(x: x, y: y)
            }, completion: nil)
        }
        
        let centerCircle = UIView(frame: CGRect(origin: c, size: CGSize(width: 60, height: 60)))
        centerCircle.center = c
        addSubview(centerCircle)
        centerCircle.backgroundColor = UIColor.magenta
        centerCircle.layer.cornerRadius = 30
        
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
