//
//  CheckBoard.swift
//  Examples
//
//  Created by mitchell hudson on 1/25/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import UIKit

class CheckerBoard: UIView {
    
    let layers = [CALayer]()
    let rows = 8
    let cols = 8
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setup() {
        let w = bounds.width / CGFloat(cols)
        let h = bounds.height / CGFloat(rows)
        
        print(w, h)
        
        for row in 0 ..< rows {
            for col in 0 ..< cols {
                let square = CALayer()
                let x = CGFloat(col) * w
                let y = CGFloat(row) * h
                let r = CGRect(x: x, y: y, width: w, height: h)
                
                if (row % 2 == 0 && col % 2 == 0) || (row % 2 == 1 && col % 2 == 1) {
                    square.backgroundColor = UIColor(red: 208/255, green: 2/255, blue: 27/255, alpha: 1).cgColor
                    // Could have been an pattern fill
                } else {
                    square.backgroundColor = UIColor(red: 255/255, green: 244/255, blue: 218/255, alpha: 1).cgColor
                    // Could have been an pattern fill
                }
        
                square.frame = r
                layer.addSublayer(square)
            }
            
            layer.borderWidth = 5
            layer.borderColor = UIColor(white: 0.1, alpha: 1).cgColor
        }
        
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
