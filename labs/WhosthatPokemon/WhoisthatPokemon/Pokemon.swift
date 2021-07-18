//
//  Pokemon.swift
//  DelegationExercise
//
//  Created by Eliel A. Gordon on 9/28/17.
//  Copyright © 2017 MakeSchool. All rights reserved.
//

import Foundation
import UIKit

struct Pokemon {
    let name: String
    let shadowImage: UIImage
    let actualImage: UIImage
}

extension Pokemon: Equatable {
    static func ==(lhs: Pokemon, rhs: Pokemon) -> Bool {
        return lhs.name == rhs.name
    }
}

