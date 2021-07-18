//
//  TouchableView.swift
//  TouchResponder
//
//  Created by Thomas Vandegriff on 4/5/19.
//  Copyright © 2019 Make School. All rights reserved.
//

import UIKit

func delay(_ delay:Double, closure:@escaping ()->()) {
    let when = DispatchTime.now() + delay
    DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
}

class TouchableView: UIView {

    var single = false
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // To see the order of events, log this function name
        print(#function)
        
        let touch = touches.first!
        
        // handle double-taps
       
        
        /** location() function - returns the current location of a UITouch object in the coordinate system of the specified view **/
        print(touch.location(in:self))
        print(touch.location(in:self.window!))
//        print(touch.location(in:nil))
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // To see the order of events, log this function name
        let tapCount = touches.first!.tapCount
        switch tapCount {
        case 1:
            self.single = true
            delay(0.3) { // Set small delay to ensure double-tap is not missed
                if self.single { // no second tap caught
                    print("Single Tap Ended")
                }
            }
        case 2:
            print("Double Tap Ended")
        default: break
        }
    }
    
    override func hitTest(_ point: CGPoint,
                          with event: UIEvent?) -> UIView? {
        let view = self
        //        print("view is:", view)
        return view
    }
}

