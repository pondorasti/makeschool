//
//  ItemDetailedViewController.swift
//  loaner
//
//  Created by Erick Sanchez on 8/17/18.
//  Copyright © 2018 LinnierGames. All rights reserved.
//

import UIKit
import ContactsUI

class ItemDetailedViewController: UIViewController {
    
    var item: Item!
    
    func updateUI() {
        labelTitle.text = "Item Details"
        labelItemTitle.text = item.itemTitle
        imageViewItem.image = item.itemImage
        if let loanee = item.loanee {
            labelLoaneeName.text = loanee.name
            loaneePhoneNumLabel.text = loanee.contactNumber
            
            /** For Future Feature: Ability to access Contacts app
            imageViewLoanee.image = loanee.profileImage
             **/
        }
        
        if item.notes.isEmpty {
            labelNotes.text = "no notes"
        } else {
            labelNotes.text = item.notes
        }
    }
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBAction func pressTrash(_ sender: UIButton) {
        let alertTrash = UIAlertController(
            title: nil,
            message: "Are you sure you want to delete this item?",
            preferredStyle: .actionSheet
        )
        
        let actionDelete = UIAlertAction(title: "Delete \(item.itemTitle)", style: .destructive) { (_) in
            self.performSegue(withIdentifier: "unwind from trash", sender: nil)
        }
        alertTrash.addAction(actionDelete)
        
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel)
        alertTrash.addAction(actionCancel)
        
        present(alertTrash, animated: true)
    }
    
    @IBOutlet weak var imageViewItem: UIImageView!
    @IBOutlet weak var labelItemTitle: UILabel!
    @IBOutlet weak var imageViewLoanee: UIImageView!
    @IBOutlet weak var labelLoaneeName: UILabel!
    
    @IBOutlet weak var loaneePhoneNumLabel: UILabel!
    
     /** For Future Feature: Ability to access Contacts app:
    @IBAction func pressContactLoanee(_ sender: UIButton) {
        guard let contactFromLoanee = item.loanee?.contactInfo else {
            return print("item needs to have a loanee assigned before saving")
        }
        
        let contactInfoVc = CNContactViewController(for: contactFromLoanee)
        contactInfoVc.allowsActions = true
        contactInfoVc.allowsEditing = true
        
        navigationController?.pushViewController(contactInfoVc, animated: true)
        contactInfoVc.navigationController?.setNavigationBarHidden(false, animated: true)
    }
     **/
    
    @IBOutlet weak var labelNotes: UILabel!
    @IBAction func pressMarkAsReturned(_ sender: UIButton) {
        let alertMarkAsReturned = UIAlertController(
            title: "Mark Item as Returned",
            message: "Are you sure you want to mark this item, \(item.itemTitle), as returned from \(item.loanee!.name)?",
            preferredStyle: .actionSheet
        )
        
        let actionConfirm = UIAlertAction(title: "Mark as Returned", style: .default) { (_) in
            self.performSegue(withIdentifier: "unwind from mark as returned", sender: nil)
        }
        alertMarkAsReturned.addAction(actionConfirm)
        
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel)
        alertMarkAsReturned.addAction(actionCancel)
        
        present(alertMarkAsReturned, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateUI()
    }
}
