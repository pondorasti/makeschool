//
//  Networking.swift
//  basic-testing
//
//  Created by Eliel Gordon on 5/23/18.
//  Copyright © 2018 MakeSchool. All rights reserved.
//

import Foundation

enum Resource {
    case ranking(name: String)
    
    func headers() -> [String: String] {
        switch self {
        case .ranking:
            return [:]
        }
    }
    
    func body() -> Data? {
        switch self {
        case .ranking:
            return nil
        }
    }
    
    func params() -> [URLQueryItem] {
        switch self {
        case let .ranking(name):
            return [URLQueryItem(name: "domain", value: name),
            URLQueryItem(name: "key", value: "c4868d9c9ff94371b71e69b62ae26bce")]
        }
    }
}

typealias Parser = (Data) -> Void

class Networking {
    static let instance = Networking()
    private let session = URLSession.shared
    
    private init() {}
    
    func resolve(resource: Resource, completion: @escaping (Parser)) {
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.webfinery.com"
        components.path = "/ranks"
        components.queryItems = resource.params()
        
        let request = URLRequest(url: components.url!)
        let task = session.dataTask(with: request) { (data, resp, err) in
            guard let data = data
                else {return}
            
            completion(data)
            
        }
        
        task.resume()
        
    }
}
