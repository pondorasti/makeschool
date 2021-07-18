//
//  Item.swift
//  loaner
//
//  Created by Erick Sanchez on 8/17/18.
//  Copyright © 2018 LinnierGames. All rights reserved.
//

import Foundation
import UIKit.UIImage
import Contacts.CNContact

struct Item {
    var itemTitle: String
    var notes: String = ""
    var itemImage: UIImage = UIImage(named: "no item image")!
    var loanee: Loanee? = nil
    
    init(itemTitle: String) {
        self.itemTitle = itemTitle
    }
    
    init(itemTitle: String, notes: String, itemImage: UIImage, loanee: Loanee?) {
        self.itemTitle = itemTitle
        self.notes = notes
        self.itemImage = itemImage
        self.loanee = loanee
    }
    
    mutating func assignLoanee(name: String?, phoneNumber: String?) {
        
        //validate contact has at least one number
        guard let contactNumber = phoneNumber else {
            return print("this contact needed to have at least one number")
        }
        
        if let contactName = name {
            
            //update loanee var
            let newLoanee = Loanee(
                name: contactName,
                contactNumber: contactNumber
            )
            loanee = newLoanee
        } else {
            loanee = nil
        }
        
/** For Future Feature: Ability to access Contacts app:
        
//    mutating func assignLoanee(to contact: CNContact?) {
        if let contact = contact {
 
            //contact image
//            var profileImage = UIImage(named: "no profile image")!
//            if let dataFromContact = contact.imageData,
//                let imageFromContact = UIImage(data: dataFromContact) {
//                profileImage = imageFromContact
//            }
//
            //validate contact has at least one number
            guard let firstPhoneNumber = contact.phoneNumbers.first else {
                return print("this contact needed to have at least one number from the ContactPickerVc")
            }
 
            //update loanee var
            let newLoanee = Loanee(
                name: contact.givenName,
//                profileImage: profileImage,
                contactNumber: firstPhoneNumber.value.stringValue
//                contact: contact
            )
 
            loanee = newLoanee
        } else {
            loanee = nil
        }
 **/
    }
}


//TODO: Cleanup inits
    
/** For Future Feature: Ability to access Contacts app:

    init(name: String, profileImage: UIImage, contactNumber: String?, contact: CNContact) {
        self.name = name
        self.profileImage = profileImage
        self.contactNumber = contactNumber
        self.contactInfo = contact
     }
 **/
    
    
    /** For Future Feature: Ability to access Contacts app:

    // Loanee type that uses built in Contacts app
struct Loanee {
    var name: String
    var profileImage: UIImage = UIImage(named: "no profile image")!
    var contactNumber: String?
    var contactInfo: CNContact! = nil
    
    init(name: String, profileImage: UIImage, contactNumber: String?) {
        self.name = name
        self.profileImage = profileImage
        self.contactNumber = contactNumber
    }
    
    init(name: String, profileImage: UIImage, contactNumber: String?, contact: CNContact) {
        self.name = name
        self.profileImage = profileImage
        self.contactNumber = contactNumber
        self.contactInfo = contact
    }
     ***/
    
//}
