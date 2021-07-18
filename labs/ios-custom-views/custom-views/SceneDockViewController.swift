//
//  SceneDockViewController.swift
//  custom-views
//
//  Created by Eliel Gordon on 4/24/18.
//  Copyright © 2018 MakeSchool. All rights reserved.
//

import UIKit

class SceneDockViewController: UIViewController {
    @IBOutlet var contentView: ContentView!
    @IBOutlet var emptyView: EmptyState!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        setupViews()
    }
    
    func setupViews() {
        emptyView.swapDelegate = self
        swap(with: emptyView)
    }
}

extension SceneDockViewController: FeedRefreshDelegate {
    func refreshTapped() {
        swap(with: contentView)
    }
}

extension SceneDockViewController: RefreshableController {}
