//
//  TriviaController.swift
//  TriviaTime
//
//  Created by Eliel A. Gordon on 11/29/17.
//  Copyright © 2017 Eliel Gordon. All rights reserved.
//

import Foundation

enum TriviaChoiceResult {
    case correct(answer: String)
    case wrong(answer: String)
    
    func resolve() -> (answer: String, result: Bool) {
        switch self {
        case let .correct(answer):
            return (answer, true)
        case let .wrong(answer):
            return (answer, false)
        }
    }
    
    func prettyPrint() -> String {
        switch self {
        case .correct:
            return "You got the question correct"
        case let .wrong(answer):
            return "You got the question wrong, the correct answer was \(answer.removingPercentEncoding!)"
        }
    }
}

struct TriviaController {
    private let trivia: JSONTrivia
    
    init(trivia: JSONTrivia) {
        self.trivia = trivia
    }
    
    static func refresh(completion: @escaping (TriviaController) -> Void) {
        let req = APIClient()
        
        req.perform(target: Target.getTrivia(amount: "1")) { (result) in
            
            guard let result = result.first else {return}
            
            completion(TriviaController(trivia: result))
        }
    }
    
    func validateChoice(choice: String) -> TriviaChoiceResult {
        guard choice == trivia.answer.removingPercentEncoding! else {
            return .wrong(answer: trivia.answer)
        }
        
        return .correct(answer: trivia.answer)
    }
    
    func choices() -> [String] {
        let choices = trivia.incorrectAnswers.map{$0.removingPercentEncoding!} + [trivia.answer.removingPercentEncoding!]
        return choices
    }
    
    func question() -> String {
        return trivia.question.removingPercentEncoding!
    }
}
