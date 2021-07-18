//
//  APIClient.swift
//  TriviaTime
//
//  Created by Eliel A. Gordon on 11/29/17.
//  Copyright © 2017 Eliel Gordon. All rights reserved.
//

import Foundation

typealias APIClientCallback = ([JSONTrivia]) -> Void

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

protocol TargetType {
    func path() -> String
    func method() -> HTTPMethod
    func headers() -> [String: String]
    func body() -> Data?
    func urlParams() -> [URLQueryItem]
}

enum Target: TargetType {
    case getTrivia(amount: String)
    
    func path() -> String {
        return ""
    }
    
    func method() -> HTTPMethod {
        switch self {
        case .getTrivia:
            return .get
        }
    }
    
    func urlParams() -> [URLQueryItem] {
        switch self {
        case let .getTrivia(amount):
             return [URLQueryItem(name: "amount", value: amount), URLQueryItem(name: "encode", value: "url3986")]
        }
    }
    
    func headers() -> [String : String] {
        return [:]
    }
    
    func body() -> Data? {
        return nil
    }
}

class APIClient {
    let session = URLSession.shared
    let baseURL =  NSURLComponents(string: "https://opentdb.com/api.php")!
    
    func perform(target: Target, response: @escaping APIClientCallback) {
        
        baseURL.queryItems = target.urlParams()
        
        var request = URLRequest(url: baseURL.url!)
        request.allHTTPHeaderFields = target.headers()
        request.httpMethod = target.method().rawValue
        request.httpBody = target.body()
        
        session.dataTask(with: request) { (data, resp, err) in
            
            guard let data = data else {return}
            
            let decoder = JSONDecoder()
            let trivia = try? decoder.decode(TriviaList.self, from: data)
            
            guard let results = trivia?.results else {return}
            
            response(results)
        }.resume()
    }
}
