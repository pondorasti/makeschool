//
//  UIViewControllerExtensions.swift
//  Habitual
//
//  Created by Sam Galizia on 8/21/18.
//  Copyright © 2018 Sam Galizia. All rights reserved.
//

import UIKit

extension UIViewController {
  static func instantiate() -> UIViewController {
    return self.init(nibName: String(describing: self), bundle: nil)
  }
}
