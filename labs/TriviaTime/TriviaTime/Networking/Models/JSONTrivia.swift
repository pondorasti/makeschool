//
//  Trivia.swift
//  TriviaTime
//
//  Created by Eliel A. Gordon on 11/29/17.
//  Copyright © 2017 Eliel Gordon. All rights reserved.
//

import Foundation

enum TriviaType: String, Decodable {
    case boolean
    case multiple
}

struct TriviaList: Decodable {
    let results: [JSONTrivia]
}

struct JSONTrivia: Decodable {
    let question: String
    let category: String
    let answer: String
    let incorrectAnswers: [String]
    let type: TriviaType
    
    enum CodingKeys: String, CodingKey {
        case answer = "correct_answer"
        case incorrectAnswers = "incorrect_answers"
        case category
        case type
        case question
    }
}
