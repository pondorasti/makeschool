//: [Previous](@previous)

import Foundation
import PlaygroundSupport

/*:
 ## Containers and Keys
 */

/*
 {
     "data": [
 
         ]
 }
 */
struct AnimeList: Decodable {
    let data: [Anime]
}

struct Anime {
    let title: String
    let thumbnail: URL
    let id: String
    
    init(title: String, thumbnail: URL, id: String) {
        self.title = title
        self.thumbnail = thumbnail
        self.id = id
    }
}

extension Anime: Decodable {
    
    // Declaring our keys
    enum Keys: String, CodingKey {
        case id
        case attributes
    }
    
    enum TitleKeys: String, CodingKey {
        case en = "en"
        case en_jp
    }
    
    enum ThumbnailKeys: String, CodingKey {
        case thumbnail = "original"
    }
    
    enum AttributeKey: String, CodingKey {
        case titles
        case posterImage
    }

    init(from decoder: Decoder) throws {
        
        // Top Level Container
        let container = try decoder.container(keyedBy: Keys.self) // defining our (keyed) container
        
        // Id - top level in data array
        let id: String = try container.decode(String.self, forKey: .id)
        
        // Attributes Container
        let attributesContainer = try container.nestedContainer(keyedBy: AttributeKey.self, forKey: .attributes)

        // Container holding title
        let titlesEnContainer = try attributesContainer.nestedContainer(keyedBy: TitleKeys.self, forKey: .titles)
        
        let title: String = try titlesEnContainer.decodeIfPresent(String.self, forKey: .en) ?? ""
        
//        // Poster Image
        let thumbnailContainer = try attributesContainer.nestedContainer(keyedBy: ThumbnailKeys.self, forKey: .posterImage)
//
        let thumbnail: URL = try thumbnailContainer.decode(URL.self, forKey: .thumbnail)

        self.init(title: title, thumbnail: thumbnail, id: id)
    }
}




typealias JSON = [String: Any]

//: Defining the types of errors our application can have
enum NetworkError: Error {
    case unknown
    case couldNotParseJSON
}



class Networking {
    let session = URLSession.shared
    let baseURL = URL(string: "https://kitsu.io/api/edge/anime")!
    
    func getAnime(id: String, completion: @escaping ([Anime]) -> Void) {
        
        let request = URLRequest(url: baseURL)
        
        session.dataTask(with: request) { (data, resp, err) in
            // Callback, this happens at a later time. Function exits before callback is called
            if let data = data {
                
                let animeList = try? JSONDecoder().decode(AnimeList.self, from: data)
                
                guard let animes = animeList?.data else {return}
                completion(animes)
            }
        }.resume()
    }
}

let networking = Networking()
networking.getAnime(id: "1") { (res) in
    print(res)
}

/*:
 ## Defining error types in Swift
 ### There is the Error type in the Swift stdlib that lets you use enums to represent errors
*/
enum UndefinedError: Error {
    case lessThanZero
    case largeNumerator
}

func performCalculation(num1: Double, num2: Double) throws -> Double {
    guard  num2 < 0 else {throw UndefinedError.lessThanZero }
    return pow(num1, num2) * sqrt(num1 / num2)
}

/*:
 ## Handling errors
 ### You can catch specific errors or just a catch all for all types of defined errors
*/
do {
    _ = try performCalculation(num1: 3, num2: 1)
} catch UndefinedError.lessThanZero {
    
}

/*:
 ## But what happens when the function is asynchronous and will only return a result later, e.g. with a completion block?
*/

struct User {
    init(data: Data) throws {}
}

let url = URL(string: "www.google.com")!

func fetchUser(completion: @escaping (User?) /* throws */ -> Void) /* throws */ {
    _ = URLSession.shared.dataTask(with: url) { (data, response, error) -> Void in
            //    if let error = error { throw error } // No can do, fetchUser can't "throw asynchronously"
//        let user =  data.map { User(data: $0) }
//            completion(user)
            }.resume()
}
// Call it:
fetchUser() { (user: User?) in
    /* do something */
}

PlaygroundPage.current.needsIndefiniteExecution = true



//: [Next](@next)
