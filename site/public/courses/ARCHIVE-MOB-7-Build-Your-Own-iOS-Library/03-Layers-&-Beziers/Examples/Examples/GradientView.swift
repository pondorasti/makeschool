//
//  GradientView.swift
//  Examples
//
//  Created by mitchell hudson on 1/25/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import UIKit

class GradientView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        layer.addSublayer(gradient)
        
        var a = UIColor(red: 252/255,
                        green: 217/255,
                        blue: 97/255, alpha: 1).cgColor
        var b = UIColor(red: 247/255,
                        green: 107/255,
                        blue: 22/255, alpha: 1).cgColor
        gradient.colors = [a, b]
        gradient.startPoint = CGPoint(x: 0.5, y: 0)
        gradient.endPoint = CGPoint(x: 0.5, y: 1)
        
        print(gradient.frame)
        
        backgroundColor = UIColor.green
        
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
