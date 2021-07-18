//
//  SourceItem.swift
//  FinalAssessmentMOB1.3
//
//  Created by Thomas Vandegriff on 3/4/19.
//  Copyright © 2019 Make School. All rights reserved.
//

import Foundation

class SourceItem: NSObject, Codable {
    let id: String
    let name: String
    let overview: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case overview = "description"
    }
    
    init(id: String, name: String, overview: String) {
        self.id = id
        self.name = name
        self.overview = overview
    }
}
