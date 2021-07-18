//
//  ContentView.swift
//  custom-views
//
//  Created by Eliel Gordon on 4/24/18.
//  Copyright © 2018 MakeSchool. All rights reserved.
//

import UIKit

class ContentView: UIView, SwappableView {
    var swapDelegate: FeedRefreshDelegate?
    
    @IBOutlet weak var tableView: UITableView!
    let dataSource = TableViewDataSource<String>()
    let items = [
        "This",
        "Is",
        "A",
        "Custom",
        "View"
    ]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // Load Xib Components
    func setup() {
        tableView = loadNib(viewType: UITableView.self)
        addSubview(tableView)
        constrain(to: tableView)
        setupTable()
    }
    
    func setupTable() {
        tableView.dataSource = dataSource
        dataSource.configure = { [unowned self] tv, idx in
            let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
            cell.textLabel?.text = self.items[idx.row]
            return cell
        }
        dataSource.items = items
        tableView.reloadData()
        
    }
}
