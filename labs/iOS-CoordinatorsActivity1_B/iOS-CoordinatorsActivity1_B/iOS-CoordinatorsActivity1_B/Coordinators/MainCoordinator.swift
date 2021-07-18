//
//  MainCoordinator.swift
//  iOS-CoordinatorsActivity1_B
//
//  Created by Thomas Vandegriff on 4/24/19.
//  Copyright © 2019 Make School. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = ViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
      //TODO: Create functions to instantiate other VCs

}
