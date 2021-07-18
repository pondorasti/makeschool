//
//  CoreDataStack.swift
//  shop-keep
//
//  Created by Eliel A. Gordon on 2/11/18.
//  Copyright © 2018 Eliel Gordon. All rights reserved.
//
import Foundation
import CoreData

public final class CoreDataStack {
    static let instance = CoreDataStack()
    
    // Only allow static use, no instance creation
    private init() {}
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(
            name: "shop_keep"
        )
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    lazy var viewContext: NSManagedObjectContext = {
        let viewContext = persistentContainer.viewContext
        return viewContext
    }()
    
    lazy var privateContext: NSManagedObjectContext = {
        let context = persistentContainer.newBackgroundContext()
        context.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        return context
    }()
    
    func saveTo(context: NSManagedObjectContext) {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                preconditionFailure(error.localizedDescription)
            }
        }
    }
}
