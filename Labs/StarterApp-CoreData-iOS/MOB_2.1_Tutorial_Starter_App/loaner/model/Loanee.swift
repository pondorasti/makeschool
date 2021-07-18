//
//  Loanee.swift
//  loaner
//
//  Created by Thomas Vandegriff on 3/13/19.
//  Copyright © 2019 LinnierGames. All rights reserved.
//

import UIKit

class Loanee: NSObject {

        var name: String
        var contactNumber: String?
        
        init(name: String, contactNumber: String?) {
            
            /** For Future Feature: Ability to access Contacts app:
             init(name: String, profileImage: UIImage, contactNumber: String?) {
             
             self.profileImage = profileImage
             **/
            
            self.name = name
            self.contactNumber = contactNumber
        }
}
