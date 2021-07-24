//
//  ViewController.swift
//  CirclesMath
//
//  Created by mitchell hudson on 1/27/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment each example below to view each of the examples. 
        
        // let circleView = CircleCircle(frame: view.bounds)
        // view.addSubview(circleView)
        
        // let circleView = CircleCircle2(frame: view.bounds)
        // view.addSubview(circleView)
        
        // let circleView = CircleCircle3(frame: view.bounds)
        // view.addSubview(circleView)
        
        // let circleView = CircleCircle4(frame: view.bounds)
        // view.addSubview(circleView)
        
        let circleView = CircleCircle5(frame: view.bounds)
        view.addSubview(circleView)
        
        // let circleView = CircleCircle6(frame: view.bounds)
        // view.addSubview(circleView)
        
        // let formatter = NumberFormatter()
        // formatter.maximumSignificantDigits = 2
        
        // let t: Float = 2.3333
        // let n = formatter.string(for: t)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

