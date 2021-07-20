import UIKit

struct Location: Codable {
    var name: String
    var distance: Double
}

struct Park: Codable{
    var name: String
    var location: Location
}

let parks:[Park] = [Park(name: "Universal Studios", location: Location(name: "Florida", distance: 100.0)), Park(name: "Disneyland", location: Location(name: "California", distance: 200.0)), Park(name: "Cedar Point", location: Location(name: "Ohio", distance: 300.0))
]

//Encoding

do {
    let encoder = JSONEncoder()
    let jsonData = try encoder.encode(parks)
    let jsonString = String(decoding: jsonData, as: UTF8.self)
    print(jsonString)
} catch {
    print(error.localizedDescription)
}

//Decoding

do {
    let encoder = JSONEncoder()
    let jsonData = try encoder.encode(parks)
    
    let decoder = JSONDecoder()
    let decoded = try decoder.decode([Park].self, from: jsonData)
    
    for park in decoded{
        print(park.name)
    }
    
} catch {
    print(error.localizedDescription)
}
