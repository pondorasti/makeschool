//
//  ViewController.swift
//  Type-Hierarchy
//
//  Created by mitchell hudson on 11/13/16.
//  Copyright © 2016 Mitchell Hudson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var tableViewOne = UITableView() // NOT NEEDED really...
        
        var listOne = ListOne()
        listOne.vc = self
        tableViewOne.delegate = listOne
        tableViewOne.dataSource = listOne
        
        var tableViewTwo = UITableView()
        
        var listTwo = ListTwo()
        tableViewTwo.delegate = listTwo
        tableViewTwo.dataSource = listTwo
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

