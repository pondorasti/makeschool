//
//  CalendarViewController.swift
//  Mood Tracker
//
//  Created by Erick Sanchez on 8/14/18.
//  Copyright © 2018 LinnierGames. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController {
    
    @IBAction func pressDone(_ sender: UIButton) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }

}
