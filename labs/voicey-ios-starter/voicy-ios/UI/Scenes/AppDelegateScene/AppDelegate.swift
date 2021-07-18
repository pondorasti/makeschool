//
//  AppDelegate.swift
//  voicy-ios
//
//  Created by Eliel A. Gordon on 1/5/18.
//  Copyright © 2018 Eliel Gordon. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        
        
        let rootViewController = RegisterViewController(
            nibName: RegisterViewController.storyboardIdentifier,
            bundle: Bundle.main
        )
        
        window?.rootViewController = rootViewController
        window?.makeCorners()
        window?.makeGradient(
            firstColor: UIColor.lighterGreenColor,
            secondColor: UIColor.lightGreenColor
        )
        
        window?.makeKeyAndVisible()
        
        return true
    }
}

