//
//  DataSource.swift
//  FelineTaskList4
//
//  Created by Thomas Vandegriff on 5/16/19.
//  Copyright © 2019 VanderVision Digital, Inc. All rights reserved.
//

import UIKit

class DataSource: NSObject, UITableViewDataSource {
    
    var viewModel = TodoListViewModel()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }
    
    //TODO: Complete implementation of required UITableViewDataSource protocol functions...
    
    
    
}
