//
//  ListOne.swift
//  Type-Hierarchy
//
//  Created by mitchell hudson on 11/14/16.
//  Copyright © 2016 Mitchell Hudson. All rights reserved.
//

import UIKit

class ListTwo: UITableViewDelegate, UITableViewDataSource {
    
    
    var vc: UIViewController? = nil
    // var tableView: UITableView
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // vc.handleTapOnListOneCell()
    }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }
}
