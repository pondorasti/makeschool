//
//  RefreshableView.swift
//  custom-views
//
//  Created by Eliel Gordon on 4/24/18.
//  Copyright © 2018 MakeSchool. All rights reserved.
//

import UIKit

protocol RefreshableController  {
    func swap(with view: UIView)
}

extension RefreshableController where Self: UIViewController {
    func swap(with myView: UIView) {
        view.subviews.forEach { $0.removeFromSuperview() }
        view.addSubview(myView)
        view.constrain(to: myView)
    }
}


protocol SwappableView: class {
    var swapDelegate: FeedRefreshDelegate? {get set}
}
