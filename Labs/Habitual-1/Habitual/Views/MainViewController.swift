//
//  MainViewController.swift
//  Habitual
//
//  Created by Sam Galizia on 8/21/18.
//  Copyright © 2018 Sam Galizia. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
var usersArray : Array = [["first_name": "michael", "last_name": "jackson"], ["first_name" : "bill", "last_name" : "gates"], ["first_name" : "steve", "last_name" : "jobs"], ["first_name" : "mark", "last_name" : "zuckerberg"], ["first_name" : "anthony", "last_name" : "quinn"]]
  
  @IBOutlet weak var tableView: UITableView!
    
  override func viewDidLoad() {
    setupNavBar()
    // FIXME: Uncomment the next 2 lines when the tableview outlet is added
    tableView.delegate = self
    tableView.dataSource = self
    
    let nib = UINib(nibName: "HabitTableViewCell", bundle: nil)
    // FIXME: Uncomment this line when the tableview outlet is added
    tableView.register(nib, forCellReuseIdentifier: "habitCell")
  }
 
}

// MARK: - Navigation Bar Code
extension MainViewController {
  // Setup function to setup the NavBar
  func setupNavBar() {
    // Sets the title for this view controller in the navbar
    title = "Habitual"
    
    // Create a bar button item for the 'Add' button
    let addButton = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addHabit(sender:)))
    
    // Set the bar button as the right button
    navigationItem.rightBarButtonItem = addButton
  }
  
  // This method will be called when the 'Add' button is pressed
  @objc func addHabit(sender: UIBarButtonItem) {
    print("Add button tapped")
  }
}

// MARK: - Tableview Delegate Methods
extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    // Sets the number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Sets the number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersArray.count
    }
    
    // Configure the cell height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    // Configure the cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "habitCell") as! HabitTableViewCell
        
        let dict = usersArray[indexPath.row]
        
        cell.myLabel1.text = "First Name: \(dict["first_name"]!)"
        cell.myLabel2.text = "Last Name: \(dict["last_name"]!)"
        return cell
    }
    
}
