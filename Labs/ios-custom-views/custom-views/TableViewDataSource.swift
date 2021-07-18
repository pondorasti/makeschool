//
//  TableViewDataSource.swift
//  custom-views
//
//  Created by Eliel Gordon on 4/24/18.
//  Copyright © 2018 MakeSchool. All rights reserved.
//

import UIKit

typealias TableViewCallback = (_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell

class TableViewDataSource<T>: NSObject, UITableViewDataSource {
    
    var items: [T] = []
    var configure: TableViewCallback?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return configure!(tableView, indexPath)
    }
}
