//
//  ViewController.swift
//  shop-keep
//
//  Created by Eliel A. Gordon on 2/11/18.
//  Copyright © 2018 Eliel Gordon. All rights reserved.
//

import UIKit
import CoreData.NSFetchedResultsController

class ShopsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let coreDataStack = CoreDataStack.instance
    
    lazy var fetchedResultsController: NSFetchedResultsController<Shop> = {
        // Remember to specify type: *CoreData Bug*
        // Initialize Fetch Request
        let fetchRequest: NSFetchRequest<Shop> = Shop.fetchRequest()
        
        // Add Sort Descriptors
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        // Initialize Fetched Results Controller
        let fetchedResultsController = NSFetchedResultsController(
            fetchRequest: fetchRequest,
            managedObjectContext: self.coreDataStack.viewContext,
            sectionNameKeyPath: nil,
            cacheName: nil
        )
        
        // Configure Fetched Results Controller
        fetchedResultsController.delegate = self
        
        return fetchedResultsController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        try? fetchedResultsController.performFetch()
        tableView.reloadData()
    }
}

extension ShopsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sections = fetchedResultsController.sections else {
            return 0
        }
        
        let sectionInfo = sections[section]
        return sectionInfo.numberOfObjects
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShopCell", for: indexPath)
        
        let item = fetchedResultsController.object(at: indexPath)
        
        cell.textLabel?.text = item.name
        
        // Reduce all employee names to one
        cell.detailTextLabel?.text = item
            .employees?
            .reduce("", { (acc, nextEmployee) -> String in
            guard let employee = nextEmployee as? Employee,
                let name = employee.name
                else {return ""}
            
            // If empty, return first employee name
            guard !acc.isEmpty else {
                return "Employees: \(name)"
            }
            
            // If not, return the previous name then the next name
            return acc + ", " + name
        })
        
        return cell
    }
}

extension ShopsViewController: NSFetchedResultsControllerDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        
        // Fetch
        let inventory = fetchedResultsController.object(at: indexPath)
        
        // Delete
        fetchedResultsController.managedObjectContext.delete(inventory)
        try? fetchedResultsController.managedObjectContext.save()
    }
}

extension ShopsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedShop = fetchedResultsController.object(at: indexPath)
        let st = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = st.instantiateViewController(withIdentifier: "EmployeeViewController") as! EmployeeViewController
        
        vc.shop = selectedShop
        
        self.navigationController?
            .pushViewController(vc, animated: true)
    }
}
