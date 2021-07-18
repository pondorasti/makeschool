//: Playground - noun: a place where people can play

import Foundation
import PlaygroundSupport


/*:
 ## Data Modeling & Error Handling
 
 ### Data Modeling with Swift 4's new Codable Type
 
 Before Swift 4, most iOS develops would use a third party JSON library like Gloss or SwiftyJSON.
 
 Swift 4's new Codable Type, which is actually consists of two protocols, Encodable and Decodable allow us to convert JSON into Swift models and vice versa.
 
 
 Lets look at how we would download and Anime from an API and model it with JSON.
 
*/

struct Anime {
    let title: String
    let thumbnail: URL
    let size: Int
    
    init(title: String, thumbnail: URL, size: Int) {
        self.title = title
        self.thumbnail = thumbnail
        self.size = size
    }
}

extension Anime: Decodable {
    
    // Declaring our keys
    //1
    enum Keys: String, CodingKey {
        case title
        case thumbnail
        case size
    }
    
    // 2
    init(from decoder: Decoder) throws {
        // define our keyed container, and keys for container
        let container = try decoder.container(keyedBy: Keys.self)
        
        // Decode keys
        let title: String = try container.decode(String.self, forKey: .title) // extracting the data
        
        let thumbnail: URL = try container.decode(URL.self, forKey: .thumbnail)
        
        let size: Int = try container.decode(Int.self, forKey: .size)
        
        // Initialize
        self.init(title: title, thumbnail: thumbnail, size: size)
    }
}

extension Anime: Encodable {
    //3
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: Keys.self)
        try container.encode(title, forKey: .title)
        try container.encode(thumbnail, forKey: .thumbnail)
    }
}

/*:
 ## Resources
 1. [JSON modeling with Swift 4](https://grokswift.com/json-swift-4/)
 
 2. [Apple - Encodable & Decodable](https://developer.apple.com/documentation/foundation/archives_and_serialization/encoding_and_decoding_custom_types)
 
 3. [Swift 4 Codable Guide](http://benscheirman.com/2017/06/ultimate-guide-to-json-parsing-with-swift-4/)
 */

PlaygroundPage.current.needsIndefiniteExecution = true

