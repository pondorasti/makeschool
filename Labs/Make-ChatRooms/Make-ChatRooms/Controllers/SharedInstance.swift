//
//  SharedInstance.swift
//  Make-ChatRooms
//
//  Created by Matthew Harrilal on 1/30/19.
//  Copyright © 2019 Matthew Harrilal. All rights reserved.
//

import Foundation


class SharedUser {
    static var shared = SharedUser()
    var user: User?
}
