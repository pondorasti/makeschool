//
//  UIImage+ImagePickerController.swift
//  loaner
//
//  Created by Erick Sanchez on 8/17/18.
//  Copyright © 2018 LinnierGames. All rights reserved.
//

import UIKit.UIImage

extension UIImage {
    var applyFixedOrientation: UIImage {
        if (self.imageOrientation == UIImage.Orientation.up) {
            return self
        }
        
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        let rect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
        self.draw(in: rect)
        
        guard let normalizedImage: UIImage = UIGraphicsGetImageFromCurrentImageContext() else {
            return self
        }
        
        UIGraphicsEndImageContext()
        return normalizedImage
    }
}
