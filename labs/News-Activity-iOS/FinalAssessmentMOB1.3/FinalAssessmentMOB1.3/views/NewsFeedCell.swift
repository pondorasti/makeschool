//
//  NewsFeedCell.swift
//  FinalAssessmentMOB1.3
//
//  Created by Thomas Vandegriff on 3/4/19.
//  Copyright © 2019 Make School. All rights reserved.
//

import UIKit

class NewsFeedCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
override func awakeFromNib() {
    super.awakeFromNib()
    
    nameLabel.adjustsFontForContentSizeCategory = true
    overviewLabel.adjustsFontForContentSizeCategory = true
    }
    
    var sourceItem: SourceItem? {
        didSet {
            guard let sourceItem = sourceItem else { return }
            nameLabel.text = sourceItem.name
            overviewLabel.text = sourceItem.overview
        }
    }
}
