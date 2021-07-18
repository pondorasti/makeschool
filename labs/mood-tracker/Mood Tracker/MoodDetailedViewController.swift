//
//  MoodDetailedViewController.swift
//  Mood Tracker
//
//  Created by Erick Sanchez on 8/14/18.
//  Copyright © 2018 LinnierGames. All rights reserved.
//

import UIKit

class MoodDetailedViewController: UIViewController {
    
    var date: Date!
    var mood: MoodEntry.Mood!
    var isEditingEntry = false
    
    private func updateUI() {
        updateMood(to: mood)
        datePicker.date = date
    }
    
    private func updateMood(to newMood: MoodEntry.Mood) {
        let unselectedColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        switch newMood {
        case .none:
            buttonAmazingMood.backgroundColor = unselectedColor
            buttonGoodMood.backgroundColor = unselectedColor
            buttonNeutralMood.backgroundColor = unselectedColor
            buttonBadMood.backgroundColor = unselectedColor
            buttonTerribleMood.backgroundColor = unselectedColor
        case .amazing:
            buttonAmazingMood.backgroundColor = newMood.colorValue
            buttonGoodMood.backgroundColor = unselectedColor
            buttonNeutralMood.backgroundColor = unselectedColor
            buttonBadMood.backgroundColor = unselectedColor
            buttonTerribleMood.backgroundColor = unselectedColor
        case .good:
            buttonAmazingMood.backgroundColor = unselectedColor
            buttonGoodMood.backgroundColor = newMood.colorValue
            buttonNeutralMood.backgroundColor = unselectedColor
            buttonBadMood.backgroundColor = unselectedColor
            buttonTerribleMood.backgroundColor = unselectedColor
        case .neutral:
            buttonAmazingMood.backgroundColor = unselectedColor
            buttonGoodMood.backgroundColor = unselectedColor
            buttonNeutralMood.backgroundColor = newMood.colorValue
            buttonBadMood.backgroundColor = unselectedColor
            buttonTerribleMood.backgroundColor = unselectedColor
        case .bad:
            buttonAmazingMood.backgroundColor = unselectedColor
            buttonGoodMood.backgroundColor = unselectedColor
            buttonNeutralMood.backgroundColor = unselectedColor
            buttonBadMood.backgroundColor = newMood.colorValue
            buttonTerribleMood.backgroundColor = unselectedColor
        case .terrible:
            buttonAmazingMood.backgroundColor = unselectedColor
            buttonGoodMood.backgroundColor = unselectedColor
            buttonNeutralMood.backgroundColor = unselectedColor
            buttonBadMood.backgroundColor = unselectedColor
            buttonTerribleMood.backgroundColor = newMood.colorValue
        }
        
        mood = newMood
    }
    
    @IBAction func pressSave(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "unwind from save", sender: nil)
    }
    
    @IBOutlet weak var buttonAmazingMood: UIButton!
    @IBOutlet weak var buttonGoodMood: UIButton!
    @IBOutlet weak var buttonNeutralMood: UIButton!
    @IBOutlet weak var buttonBadMood: UIButton!
    @IBOutlet weak var buttonTerribleMood: UIButton!
    @IBAction func pressMood(_ button: UIButton) {
        switch button.tag {
        case 0:
            updateMood(to: .amazing)
        case 1:
            updateMood(to: .good)
        case 2:
            updateMood(to: .neutral)
        case 3:
            updateMood(to: .bad)
        case 4:
            updateMood(to: .terrible)
        default:
            
            //NOTE: error handling
            print("unhandled button tag")
        }
    }
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBAction func datePickerDidChangeValue(_ sender: UIDatePicker) {
        date = datePicker.date
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
}
