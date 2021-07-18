//
//  ItemNotesViewController.swift
//  loaner
//
//  Created by Erick Sanchez on 8/17/18.
//  Copyright © 2018 LinnierGames. All rights reserved.
//

import UIKit

class ItemNotesViewController: UIViewController {

    var body: String = ""
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch identifier {
            case "unwind from notes":
                body = textViewNotes.text
            default: break
            }
        }
    }
    
    @IBOutlet weak var textViewNotes: UITextView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        textViewNotes.text = body
        textViewNotes.becomeFirstResponder()
    }
}
