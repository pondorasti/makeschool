//
//  ViewController.swift
//  PlistDemo
//
//  Created by Adriana González Martínez on 2/25/19.
//  Copyright © 2019 Adriana González Martínez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    var scores : [[String: Any]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
       
        //TODO: Get the list of scores coming from your plist
        
        
        //TODO: Add two entries by code
        
        
        //TODO: Display the complete list of scores in the table view
        
    }
    
    // MARK: Table setup
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scores.count
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Highest Scores 🚀"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath)
        let item = scores[indexPath.row]
        //TODO: Make sure to display the score and name
        return cell
        
    }
    
    //MARK: Plist handling
    //TODO: Keep your file clean by adding helper methods to handle the plist.
    
    
}
