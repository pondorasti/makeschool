//
//  Coordinator.swift
//  iOS-CoordinatorsActivity1_B
//
//  Created by Thomas Vandegriff on 4/24/19.
//  Copyright © 2019 Make School. All rights reserved.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
