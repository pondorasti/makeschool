//
//  HistoryViewController.swift
//  TriviaTime
//
//  Created by Eliel A. Gordon on 11/29/17.
//  Copyright © 2017 Eliel Gordon. All rights reserved.
//

import UIKit


/// Displays a history of all answered trivia questions from Realm
class HistoryViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let dataSource = TableDatasource(items: [])
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "History"
        
        self.navigationController?
            .navigationBar
            .setBackgroundImage(UIImage(), for: .default)
        
        self.navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 30, weight: .black),
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        
        tableView.dataSource = dataSource
        
        dataSource.configureCell = { (tableView, indexPath) -> UITableViewCell in
            let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell")!
        
            //TODO: Fill me in with history details
            
            return cell
        }
        
        tableView.estimatedRowHeight = 55
    }
}
