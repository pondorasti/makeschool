//
//  EmptyState.swift
//  custom-views
//
//  Created by Eliel Gordon on 4/24/18.
//  Copyright © 2018 MakeSchool. All rights reserved.
//

import UIKit

protocol FeedRefreshDelegate: class {
    func refreshTapped()
}

class EmptyState: UIView, SwappableView {
    var swapDelegate: FeedRefreshDelegate?
    
    @IBOutlet weak var contentView: UIStackView!
    @IBOutlet weak var refreshButton: UIButton!
    
    // Initializer from Xib
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // Initializer from programmatic initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    @IBAction func refreshTapped(_ sender: UIButton) {
        swapDelegate?.refreshTapped()
    }
    
    // Load Xib Components
    func setup() {
        contentView = loadNib(viewType: UIStackView.self)
        addSubview(contentView)
        constrain(to: contentView)
    }
}
