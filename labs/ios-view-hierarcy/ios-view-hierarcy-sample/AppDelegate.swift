//
//  AppDelegate.swift
//  ios-view-hierarcy-sample
//
//  Created by Eliel A. Gordon on 3/6/18.
//  Copyright © 2018 Eliel Gordon. All rights reserved.
//

import UIKit

enum WindowType {
    case customer
    case admin
}

protocol ApplicationSwitcherDelegate: class {
    func switchWindow(to windowType: WindowType)
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var customerWindow: UIWindow?
    var adminWindow: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let mainFrame = UIScreen.main.bounds
        
        // Customer Setup
        customerWindow = UIWindow(frame: mainFrame)
        
        let customerRootViewController = TopViewController(
            nibName: "TopViewController",
            bundle: nil
        )
        
        customerRootViewController.windowDelegate = self
            
        customerWindow?.rootViewController = customerRootViewController
        
        // Admin Setup
        adminWindow = UIWindow(frame: mainFrame)

        let adminRootViewController = BottomViewController(
            nibName: "BottomViewController",
            bundle: nil
        )
        
        adminRootViewController.windowDelegate = self
        adminWindow?.rootViewController = adminRootViewController
        
        // Start Scene with Customer Window
        customerWindow?.makeKeyAndVisible()
  
        return true
    }
}

extension AppDelegate: ApplicationSwitcherDelegate {
    func switchWindow(to windowType: WindowType) {
        switch windowType {
        case .customer:
            customerWindow?.makeKeyAndVisible()
        case .admin:
            adminWindow?.makeKeyAndVisible()
        }
    }
}
