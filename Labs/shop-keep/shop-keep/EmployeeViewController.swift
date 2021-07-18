//
//  EmployeeViewController.swift
//  shop-keep
//
//  Created by Eliel A. Gordon on 2/11/18.
//  Copyright © 2018 Eliel Gordon. All rights reserved.
//

import UIKit

class EmployeeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var shop: Shop?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
        tableView.dataSource = self
    }
}

extension EmployeeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return shop?.employees?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShopCell", for: indexPath)
        
        guard let employees = shop?.employees?.allObjects as? [Employee]
            else {return cell}
        let employee = employees[indexPath.row]
        
        cell.textLabel?.text = employee.name
        
        cell.detailTextLabel?.text = employee.isManager ? "Manager" : "Managed by: \(employee.manager?.name ?? "")"
        
        return cell
    }
}
