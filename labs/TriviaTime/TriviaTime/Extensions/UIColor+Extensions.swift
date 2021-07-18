//
//  UIColor+Extensions.swift
//  TriviaTime
//
//  Created by Eliel A. Gordon on 11/30/17.
//  Copyright © 2017 Eliel Gordon. All rights reserved.
//

import Foundation

import UIKit

extension UIColor {
    convenience init(r: Int, g:Int , b:Int) {
        self.init(red: CGFloat(r)/255, green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: 1.0)
    }
    
    static var turquoiseColor = {
        return UIColor(r: 26, g: 188, b: 156)
    }
    
    static var greenSeaColor = {
        return UIColor(r: 22, g: 160, b: 133)
    }
    
    static var emeraldColor = {
        return UIColor(r: 46, g: 204, b: 113)
    }
    
    static var nephritisColor = {
        return UIColor(r: 39, g: 174, b: 96)
    }
    
    static var peterRiverColor = {
        return UIColor(r: 52, g: 152, b: 219)
    }
    
    static var belizeHoleColor = {
        return UIColor(r: 41, g: 128, b: 185)
    }
    
    static var amethystColor = {
        return UIColor(r:155, g:89, b:182)
    }
    
    static var wisteriaColor = {
        return UIColor(r:142, g:68, b:173)
    }
    
    static var wetAsphaltColor = {
        return UIColor(r:52, g:73, b:94)
    }
    
    static var midnightBlueColor = {
        return UIColor(r:44, g:62, b:80)
    }
    
    static var sunflowerColor = {
        return UIColor(r:241, g:196, b:15)
    }
    
    static var carrotColor = {
        return UIColor(r:230, g:126, b:34)
    }
    
    static var pumpkinColor = {
        return UIColor(r:211, g:84, b:0)
    }
    
    static var alizarinColor = {
        return UIColor(r:231, g:76, b:60)
    }
    
    static var pomergranateColor = {
        return UIColor(r:192, g:57, b:43)
    }
    
    static var cloudsColor = {
        return UIColor(r:236, g:240, b:241)
    }
    
    static var silverColor = {
        return UIColor(r:189, g:195, b:199)
    }
    
    static var concreteColor = {
        return UIColor(r:149, g:165, b:166)
    }
    
    static var asbestosColor = {
        return UIColor(r:127, g:140, b:141)
    }
}
