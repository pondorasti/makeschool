//
//  PlayerViewController.swift
//  RPGGame
//
//  Created by Jonathan Kopp on 10/14/19.
//  Copyright © 2019 Jonathan Kopp. All rights reserved.
//

import Foundation
import UIKit

class PlayerViewController: UIViewController{
    /// The player object
    var player: Player?
    
    // TODO: create a PlayerType optional variable
    
    /// Action label
    @IBOutlet var topLabel: UILabel!
    /// Action button
    @IBOutlet var button: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        // Changes the navigations color
        // TODO: Set the color to your most favorite color!
        // Purple is given as an example
        self.navigationController!.navigationBar.barTintColor = .purple
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Navigation Controller title
        self.title = player?.name
        
        self.view.backgroundColor = .green
        topLabel.textColor = .white
        
        // When button is touched trigger the doPlayerAction() function is called
        button.addTarget(self, action: #selector(doPlayerAction), for: .touchUpInside)
    }
    
    // TODO: Changes the topLabel text based on what the player object is
    @objc func doPlayerAction() {
        // Hints
        //    - Try using a switch case to determine what the player object is!
        //    - Check if player type can casts only a spell
        //    - Check for Fighter and Elf types.
        //    - Update text based on if the playerType casts a spell or fights
        
    }
    
    
}
