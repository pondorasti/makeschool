# Codable example

```swift
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
```

<!-- > -->

### Encoding
1. Initiate the encoding process
1. Encoder calls `encode(to:Encoder)` method passing itself as the argument.<br>
   Ex. `let jsonData = try encoder.encode(parks)`<br> which in result calls `parks.encode(to:self)`
1. In order to encode itself in the correct format, it will use *encoding containers* <br>The Encoder protocol returns these containers.
 ##### Types of containers
 - **Keyed container**: Encodes key value pairs. Will turn into JSON objects.
 - **Unkeyed container**: Encodes multiple values sequentially, omitting keys. Will turn into JSON arrays.
 - **Single value container**: Encodes a single value. Will turn into numbers, strings, booleans or null.
1. The compiler generates an enum named `CodingKeys`. It contains one case for every stored property of the struct.

Strongly typed keys lead to safety but they must eventually be able to turn into strings/integers. The CodingKey protocol handles this task.

<!-- > -->

### Decoding
1. Call `try decoder.decode([Park].self, from: jsonData)`
1. Decoder creates an instance of the type passed in. What is it in this case?
1. Decoder manages a tree of *decoding continers* where each value travels down recursively in a container hierarchy while initializing values.

If at some point in the hierarchy, an error occurs, the entire process fails.
