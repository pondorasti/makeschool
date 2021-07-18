//
//  Question+CoreDataProperties.swift
//  PersistenceExam-Starter
//
//  Created by Adriana González Martínez on 5/11/19.
//  Copyright © 2019 Adriana González Martínez. All rights reserved.
//
//

import Foundation
import CoreData


extension Question {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Question> {
        return NSFetchRequest<Question>(entityName: "Question")
    }

    @NSManaged public var question: String?
    @NSManaged public var answer: String?

}
