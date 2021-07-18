//
//  ViewController.swift
//  TriviaTime
//
//  Created by Eliel A. Gordon on 11/29/17.
//  Copyright © 2017 Eliel Gordon. All rights reserved.
//

import UIKit

class TriviaViewController: UIViewController {
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var triviaController: TriviaController?
    var dataSource = TableDatasource(items: [String]())
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetGame()
        
        tableView.dataSource = dataSource
        tableView.delegate = self
        
        // Configures the tableViewCell
        dataSource.configureCell = { (tableView, indexPath) -> UITableViewCell in
            let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell")!
            
            cell.textLabel?.text = self.triviaController?.choices()[indexPath.row]
            cell.textLabel?.numberOfLines = 0
            
            return cell
        }
    }
    
    
    /// Handles refresh of the trivia
    ///
    /// - Parameter triviaController: TriviaController has data for displaying a Trivia
    func handleRefresh(triviaController: TriviaController) {
        self.triviaController = triviaController
        
        DispatchQueue.main.async {
            self.question.text = triviaController.question()
            self.dataSource.items = triviaController.choices()
            self.tableView.reloadData()
        }
    }
    
    
    /// Resets the game with new trivia
    func resetGame() {
        TriviaController
            .refresh(completion: handleRefresh)
    }
}

extension TriviaViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let triviaController = triviaController else {
            return
        }
        
        let choices = triviaController.choices()
        let choice = choices[indexPath.row]
        
        let result = triviaController
            .validateChoice(choice: choice)
        
        let alertController = UIAlertController(
            title: "Result",
            message: result.prettyPrint(),
            preferredStyle: .alert
        )
        
        let ok = UIAlertAction(title: "Ok", style: .default, handler: { action in
            self.dismiss(animated: true, completion: nil)
            self.resetGame()
        })
        
        alertController.addAction(ok)
        
        self.present(alertController, animated: true) { () in
            
        }
    }
}
