//
//  SnapView.swift
//  UIDynamicsExample
//
//  Created by Eliel Gordon on 5/22/18.
//  Copyright © 2018 MakeSchool. All rights reserved.
//

import UIKit

class SnapView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    func setup() {
//        let path = UIBezierPath(rect: self.frame)
//        layer.shadowPath = path.cgPath
//        layer.shadowOffset = CGSize.zero
//        layer.shadowColor = UIColor.black.cgColor
//        layer.shadowRadius = 2
//        layer.shadowOpacity = 0.25
        backgroundColor = UIColor.white
    }
}
