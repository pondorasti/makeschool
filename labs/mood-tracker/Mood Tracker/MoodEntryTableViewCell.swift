//
//  MoodEntryTableViewCell.swift
//  Mood Tracker
//
//  Created by Erick Sanchez on 8/14/18.
//  Copyright © 2018 LinnierGames. All rights reserved.
//

import UIKit

class MoodEntryTableViewCell: UITableViewCell {

    @IBOutlet weak var labelMoodTitle: UILabel!
    @IBOutlet weak var labelMoodDate: UILabel!
    @IBOutlet weak var imageViewMoodColor: UIImageView!

    func configure(_ entry: MoodEntry) {
        imageViewMoodColor.backgroundColor = entry.mood.colorValue
        labelMoodTitle.text = entry.mood.stringValue
        labelMoodDate.text = entry.date.stringValue
    }
}
