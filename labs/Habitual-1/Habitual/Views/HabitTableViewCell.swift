//
//  HabitTableViewCell.swift
//  Habitual
//
//  Created by Phyllis Wong on 8/22/18.
//  Copyright © 2018 Sam Galizia. All rights reserved.
//

import UIKit

class HabitTableViewCell: UITableViewCell {
    
    @IBOutlet weak var myLabel1: UILabel!
    @IBOutlet weak var myLabel2: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
