//
//  ViewController.swift
//  RPGGame
//
//  Created by Jonathan Kopp on 9/29/19.
//  Copyright © 2019 Jonathan Kopp. All rights reserved.
//

import UIKit
import Foundation
class ViewController: UIViewController{
    // MARK: Properties
    
    /// "Select a character" label
    @IBOutlet var topLabel: UILabel!
    /// The selector for players
    @IBOutlet var pickerView: UIPickerView!
    /// List of possible players
    var list = ["Wizard","Fighter", "Elf", "Priest"]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        // Sets the navigations color to white
        self.navigationController!.navigationBar.barTintColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        topLabel.textColor = .white
        
        //Set up pickerViews delegate and datasource!
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    
    // Called when a player is picked.
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // Calls the function for each player based on what is selected.
        switch self.list[row] {
        case "Wizard":
            wizard()
        case "Fighter":
            fighter()
        case "Priest":
            priest()
        case "Elf":
            elf()
        default:
            print("")
        }
    }
    
    // MARK: Set up classes
    func wizard() {
        let wizard = Wizard(name: "Wizard")
        
        pushViewController(player: wizard)
    }
    
    func priest() {
        
        let priest = Priest(name: "Priest")
        // TODO: Use the pushViewController function to pass the priest through the navigation controller
        
        // Hint - Look at how the wizard class does it!
        
    }
    
    func fighter() {
        let fighter = Fighter(name: "Fighter", battleCry: "Arrr!")
        // TODO: Use the pushViewController function to pass the fighter through the navigation controller
        
    }
    
    func elf() {
        let elf = Elf(name: "Elf")
        // TODO: Use the pushViewController function to pass the elf through the navigation controller
        
    }
    
    func pushViewController(player: Player) {
        // Creates a viewcontroller from a storyboard file
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "CharacterVC") as! PlayerViewController
        // Pass the player object to the view controller
        controller.player = player
        // Push view controller!
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

// TODO: Create a PlayerType enum, with a case statement
// for each of the following: Priest, Elf, Wizard, Fighter

// MARK: Player classes & Protocols
protocol Casts {
    var name: String {get}
    func castSpell()->String
}

protocol Fights {
    var name: String {get}
    func melee()->String
}


extension Casts {
    func castSpell()->String{
        return "\(name) Casts spell"
    }
}

extension Fights {
    func melee()-> String{
        return "\(name) Attacks with Sword!"
    }
}


class Player: NSObject{
    var name: String
    var hitPoints: Int = 0
    
    init(name: String) {
        self.name = name
    }
    
    func adventure()-> String{
        return "\(name) goes adventuring!"
    }
}


class Fighter: Player, Fights {
    
    var battleCry: String
    
    init(name: String, battleCry: String = "") {
        self.battleCry = battleCry
        
        super.init(name: name)
        
        hitPoints = 8
    }
}

class Wizard: Player, Casts {
    
    override init(name: String) {
        super.init(name: name)
        
        hitPoints = 4
    }
}


class Priest: Player, Casts {
    
    override init(name: String) {
        super.init(name: name)
        
        hitPoints = 6
    }
    
    func castSpell()-> String{
        return "\(name) heals the party!"
    }
    
}

class Elf: Player, Fights, Casts {
    override init(name: String) {
        super.init(name: name)
        
        hitPoints = 6
    }
}


extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    //Tells the pickerView that it only contains one item per row
    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    
    //Tells the pickerView how many rows/items it contains
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        
        return list.count
    }
    
    //Sets the rows title to a white color
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let attributedString = NSAttributedString(string:  list[row], attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        return attributedString
    }
}
