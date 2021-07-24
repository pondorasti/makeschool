//
//  ViewController.swift
//  FramBoundsAndCenter
//
//  Created by mitchell hudson on 1/23/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let w = view.bounds.width / 3
        
        for i in 0 ... 9 {
            let x = CGFloat(i % 3) * w // 0,1,2,0,1,2...
            let y = CGFloat(i / 3) * w
            let r = CGRect(x: x, y: y, width: w, height: w)
            let box = UIView(frame: r.insetBy(dx: 2, dy: 2))
            view.addSubview(box)
            
            let hue = 1 / 10 * CGFloat(i)
            
            let c = UIColor(hue: hue, saturation: 1, brightness: 1, alpha: 1)
            box.backgroundColor = c
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

