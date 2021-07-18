//
//  ItemContactInfoViewController.swift
//  loaner
//
//  Created by Erick Sanchez on 8/17/18.
//  Copyright © 2018 LinnierGames. All rights reserved.
//

import UIKit
import ContactsUI

class ItemContactInfoViewController: UIViewController, UITextFieldDelegate {

    var item: Item!
    
    func updateUI() {
        labelTitle.text = "Contact Info"
        imageViewItem.image = item.itemImage
        labelItemTitle.text = item.itemTitle
        if item.notes.isEmpty {
            labelItemNotes.text = "No Notes"
        } else {
            labelItemNotes.text = item.notes
        }
        
        /** For Future Feature: Ability to access Contacts app:
         updateContactInfo()
         **/
    }
    
    /** For Future Feature: Ability to access Contacts app:
    func updateContactInfo() {
        if let contact = item.loanee {

            buttonAddContact.isHidden = true
             imageViewContact.image = contact.profileImage

            stackViewContactInfo.isHidden = false
            labelContactName.text = contact.name
            labelContactNumber.text = contact.contactNumber ?? "No Number"

        } else {
            buttonAddContact.isHidden = false
            stackViewContactInfo.isHidden = true
        }
    }
      **/
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var imageViewItem: UIImageView!
    @IBOutlet weak var labelItemTitle: UILabel!
    @IBOutlet weak var labelItemNotes: UILabel!
    @IBOutlet weak var buttonAddContact: UIButton!
    @IBAction func pressAddContact(_ sender: UIButton) {
        
        
        let contactVc = CNContactPickerViewController()
        contactVc.delegate = self
        contactVc.predicateForEnablingContact = NSPredicate(format: "phoneNumbers.@count > 0")
        
        present(contactVc, animated: true)
    }
    
    @IBOutlet weak var stackViewContactInfo: UIStackView!
    @IBOutlet weak var imageViewContact: UIImageView!
    @IBOutlet weak var labelContactName: UILabel!
    @IBOutlet weak var labelContactNumber: UILabel!
    @IBOutlet weak var contactNameTextField: UITextField!
    @IBOutlet weak var contactPhoneNumberTextField: UITextField!
    
    @IBAction func pressDeleteContact(_ sender: UIButton) {
        
        /** For Future Feature: Ability to access Contacts app:
        item.assignLoanee(name: String?, phoneNumber: String?)
        item.assignLoanee(to: nil)
        updateContactInfo()
         **/
    }
    
    @IBOutlet weak var buttonSave: UIButton!
    @IBAction func pressSave(_ sender: UIButton) {
        
        guard let nameFromUserInput = contactNameTextField.text else {
            return print("item needs to have a loanee assigned before saving")
        }
        guard let phoneNumFromUserInput = contactPhoneNumberTextField.text else {
            return print("loanee needs to have a phone number assigned before saving")
        }
        
        item.assignLoanee(name: nameFromUserInput, phoneNumber: phoneNumFromUserInput)
        item.loanee?.name = nameFromUserInput
        item.loanee?.contactNumber = phoneNumFromUserInput
        
        print(item.loanee as Any)
        
        //validate the user has selected a contact
        guard item.loanee != nil else {
            let alertMissingContact = UIAlertController(
                title: "Saving New Item",
                message: "please select a contact that has a phone number",
                preferredStyle: .alert
            )
            
            let dismissAction = UIAlertAction(title: "Dismiss", style: .default)
            alertMissingContact.addAction(dismissAction)
            
            present(alertMissingContact, animated: true)
            
            return
        }
        
        performSegue(withIdentifier: "unwind from saving new item", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


extension ItemContactInfoViewController: CNContactPickerDelegate {
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        
        /** For Future Feature: Ability to access Contacts app:
        item.assignLoanee(to: contact)
        updateContactInfo()
         **/
    }
}
