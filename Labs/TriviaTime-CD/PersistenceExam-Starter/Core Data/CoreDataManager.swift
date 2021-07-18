//
//  CoreDataManager.swift
//  PersistenceExam-Starter
//
//  Created by Adriana González Martínez on 5/11/19.
//  Copyright © 2019 Adriana González Martínez. All rights reserved.
//



import Foundation
import CoreData

class CoreDataManager {
    
    //This Core Data manager works as a Singleton. This means you will use the same instance throughout the project. Call its sharedManager to have access to its methods.
    
    static let sharedManager = CoreDataManager()
    private init() {}
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "PersistenceExam_Starter")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    
    func saveContext () {
        let context = CoreDataManager.sharedManager.persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func insertQuestion(questionText:String, answer: String) -> Question?{
        
        let managedContext = CoreDataManager.sharedManager.persistentContainer.viewContext
        
        //TODO: Create a new entity & managed object and save it.
        
        return nil
    }
    
    func fetchAllQuestions() -> [Question]?{
        
        let managedContext = CoreDataManager.sharedManager.persistentContainer.viewContext
        
        //TODO: Create a new fetch request to return all the questions.
        
        return nil

        
    }
}
