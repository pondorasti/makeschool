//
//  AppDelegate.swift
//  shop-keep
//
//  Created by Eliel A. Gordon on 2/11/18.
//  Copyright © 2018 Eliel Gordon. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        setup()
        return true
    }
    
    func setup() {
        let stack = CoreDataStack.instance
        let saveContext = stack.privateContext
        
        // Create Shops
        let grandmas = Shop(context: saveContext)
        grandmas.name = "Grandmas's"
        let teds = Shop(context: saveContext)
        teds.name = "Ted's"
        let chinese = Shop(context: saveContext)
        chinese.name = "The Chinese Place"
        
        // Create Grandma's Employees
        let peter = Employee(context: saveContext)
        peter.name = "Peter"
        peter.shop = grandmas
        
        // Create Manager
        let sarah = Employee(context: saveContext)
        sarah.name = "Sarah"
        sarah.shop = grandmas
        sarah.isManager = true
        sarah.addToEmployees(peter)
        
        // TODO: Change shops to chinese and make manager
        let antoine = Employee(context: saveContext)
        antoine.name = "Antoine"
        antoine.shop = grandmas
        antoine.manager = sarah

        // Create Ted's Employees
        // Ted's Managers
        let silvester = Employee(context: saveContext)
        silvester.name = "Silvester"
        silvester.shop = teds
        silvester.isManager = true
        
        let yara = Employee(context: saveContext)
        yara.name = "Yara"
        yara.shop = teds
        yara.isManager = true
        
        let michael = Employee(context: saveContext)
        michael.name = "Michael"
        michael.shop = teds
        michael.manager = silvester
        
        let william = Employee(context: saveContext)
        william.name = "William"
        william.shop = teds
        william.manager = silvester
        
        let shane = Employee(context: saveContext)
        shane.name = "Shane"
        shane.shop = teds
        shane.manager = yara
        
        
        stack.saveTo(context: saveContext)
    }
}

