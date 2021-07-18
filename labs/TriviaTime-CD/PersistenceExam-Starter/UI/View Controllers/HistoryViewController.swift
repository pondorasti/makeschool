//
//  HistoryViewController.swift
//  TriviaTime
//
//  Created by Eliel A. Gordon on 11/29/17.
//  Copyright © 2017 Eliel Gordon. All rights reserved.
//

import UIKit
import CoreData

/// Displays a history of all answered trivia questions 
class HistoryViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var dataSource : TableDatasource<Any>!
    let managedContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    var questions: [NSManagedObject] = []

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
        
        tableView.estimatedRowHeight = 55

        dataSource = TableDatasource(items: questions)
        tableView.dataSource = dataSource
        
        dataSource.configureCell = { (tableView, indexPath) -> UITableViewCell in
            let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell")!
            
            //TODO: Fill the cell's textLabel with the question
            // and detailTextLabel with the correct answer
           
            
            return cell
        }
    }
    
    func fetchAllQuestions(){
        //TODO: Use the CoreDataManager to get all the questions you've answered.
        // then show them in the table.
        
      
    }
}
