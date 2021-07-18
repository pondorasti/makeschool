//
//  ViewController.swift
//  CircleMath-1
//
//  Created by mitchell hudson on 1/29/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // This example uses sine and cosine to position views on the screen in a circle.
        
        let c = view.center     // Get the center point. Position views around this point.
        let r: CGFloat = 120    // Radius for the circle.
        
        // Use a loop to create 8 objects
        for i in 0 ..< 8 {
            // Define a rectangle 40 by 40 points. Ignnore the position for now.
            let rect = CGRect(x: 0, y: 0, width: 40, height: 40)
            let v = UIView(frame: rect)         // Create a view
            v.backgroundColor = UIColor.orange  // Set the color to orange
            
            // Do some math. t is the angle in radians.
            let t = CGFloat(M_PI * 2) / 8 * CGFloat(i) // Divide the circle in 8 parts.
            let x = sin(t) * r + c.x    // Get the x and y using sin(t) and cos(t) using the angle t
            let y = cos(t) * r + c.y    // multiply the value by the raidus r.
            
            v.center.x = x // Set the center x and y
            v.center.y = y
            
            view.addSubview(v) // Add a view 
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

