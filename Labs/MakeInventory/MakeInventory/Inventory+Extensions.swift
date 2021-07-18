//
//  Inventory+Extensions.swift
//  MakeInventory
//
//  Created by Eliel A. Gordon on 11/12/17.
//  Copyright © 2017 Eliel Gordon. All rights reserved.
//

import Foundation
import CoreData

extension Inventory {
    convenience init(context: NSManagedObjectContext) {
        
        let entityDescription = NSEntityDescription.entity(forEntityName: "Inventory", in:
            context)!
        
        self.init(entity: entityDescription, insertInto: context)
    }
}
