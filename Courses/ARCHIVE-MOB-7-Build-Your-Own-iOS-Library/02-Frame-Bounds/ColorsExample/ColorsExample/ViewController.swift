//
//  ViewController.swift
//  ColorsExample
//
//  Created by mitchell hudson on 1/26/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let w = view.bounds.width
        let h = view.bounds.height / 1
        
        for i in 0 ..< 1 {
            let y = CGFloat(i) * h
            let r = CGRect(x: 0, y: y, width: w, height: h)
            let v = UIView(frame: r)
            view.addSubview(v)
            
            let n = CGFloat(arc4random() % 1000) / 1000
            // v.backgroundColor = UIColor(hue: 1, saturation: 1, brightness: n, alpha: 1)
            v.backgroundColor = UIColor(patternImage: UIImage(named: "pattern")!)
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

