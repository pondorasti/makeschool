import Foundation

enum InputError: String, Error {
    case fileDoesNotExist
    case fileIsDirectory
    case couldNotRead
}

extension InputError: CustomStringConvertible {
    var description: String {
        return rawValue
    }
}

func fileURL(from filePath: String) throws -> URL {
    var isDirectory = ObjCBool(false)
    guard FileManager.default.fileExists(atPath: filePath, isDirectory: &isDirectory) else {
        throw InputError.fileDoesNotExist
    }
    
    guard !isDirectory.boolValue else {
        throw InputError.fileIsDirectory
    }
    
    return URL(fileURLWithPath: filePath)
}

func stringContents(from fileURL: URL) throws -> String {
    do {
        let contents = try String(contentsOf: fileURL)
        return contents
    } catch {
        throw InputError.couldNotRead
    }
}

let expr = (try? NSRegularExpression(pattern: "^(\\w+)[ ,:=\t]+(.*)$"))!

extension String {
    func substringsMatchingPattern(_ regex: NSRegularExpression, options: NSRegularExpression.Options, matchGroup: Int) throws -> [String] {
        let range = NSMakeRange(0, (self as NSString).length)
        let matches = regex.matches(in: self, options: [], range: range)
        
        var output: [String] = []
        
        for match in matches  {
            let matchRange = match.range(at: matchGroup)
            let matchString = (self as NSString).substring(with: matchRange)
            output.append(matchString as String)
        }
        
        return output
    }
}

extension Array where Element: StringProtocol {
    func keyValueStrings() -> [String:String] {
        var pairs = [String:String]()
        for item in self {
            do {
                let key = try (item as! String).substringsMatchingPattern(expr, options: [], matchGroup: 1).first
                let value = try (item as! String).substringsMatchingPattern(expr, options: [], matchGroup: 2).first
                
                if let key = key, let value = value {
                    pairs[key] = value
                }
            } catch {
                
            }
        }
        return pairs
    }
}

extension Int: ExpressibleByStringLiteral {
    public typealias StringLiteralType = String
    public init(stringLiteral: String) {
        var value = 0
        if let represented = Int(stringLiteral) {
            value = represented
        }
        self.init(value)
    }
}

class DataSource<T: Codable> {
    
    public struct DataSourceError: Error {
        let reason: String
    }
    
    var fileURL: URL
    private var _itemList: [T]?
    
    init(fileURL: URL) {
        self.fileURL = fileURL
    }
    
    private func readBackingStore() throws -> [T]? {
        let data: Data!
        do {
            data = try Data(contentsOf: fileURL)
        } catch {
            throw DataSourceError(reason: "It looks as though there's no file named \(fileURL.path).")
        }
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted({let df = DateFormatter(); df.dateStyle = .short; return df}())
        do {
            let array = try decoder.decode([T].self, from: data)
            return array
        } catch {
            let item = try decoder.decode(T.self, from: data)
            return [item]
        }
    }
    
    private func write(_ array: [T]) throws {
        let coder = JSONEncoder()
        coder.outputFormatting = .prettyPrinted
        let arrayData = try coder.encode(array)
        try arrayData.write(to: fileURL)
    }
        
    var items: [T] {
        get {
            if _itemList == nil {
                var errorMessage: String?
                
                do {
                    _itemList = try readBackingStore()
                } catch let err as DataSourceError {
                    errorMessage = err.reason
                } catch let err as DecodingError {
                    switch err {
                    case .keyNotFound(let key, _):
                        errorMessage = "Key not found: \"\(key.stringValue)\""
                    case .dataCorrupted(let context):
                        var description = context.debugDescription
                        if let ns = context.underlyingError,
                            let extra = (ns as NSError).userInfo[NSDebugDescriptionErrorKey] {
                            description += " (\(extra))"
                        }
                        errorMessage = description
                    case .typeMismatch(_, let context):
                        errorMessage = "Type mismatch for key \"\(context.codingPath.last!.stringValue)\": \(context.debugDescription)"
                    default:
                        errorMessage = err.localizedDescription
                    }
                } catch {
                    errorMessage = error.localizedDescription
                }
                
                if let errorMessage = errorMessage {
                    print("\n\nThere was a problem decoding your JSON.")
                    print(errorMessage)
                }
            }
            
            return _itemList!
        }
        set {
            _itemList = newValue
        }
    }
    
    func save() {
        do {
            try write(items)
        } catch {
            print("*****ERROR******")
        }
    }
    
    func add(item: T) {
        var existingList = items
        existingList.append(item)
        _itemList = existingList
    }
    
}

/**
 Returns the contents of the given file in a string.
 
 - parameter fromFile: The full path to the file
 
 - returns: The contents of the file as a string
 */
public func string(fromFile filePath: String) -> String {
    do {
        return try stringContents(from: fileURL(from: filePath))
    } catch {
        print("string(fromFile: \(filePath) returning empty string: \(error)")
        return ""
    }
}

/**
Returns the contents of the given file as an array of strings. Each element in the array corresponds to one line of the file.

- parameter fromFile: The full path to the file

- returns: The lines of the file as an array of strings
*/
public func lines(fromFile filePath: String) -> [String] {
    do {
        return try stringContents(from: fileURL(from: filePath)).components(separatedBy: .newlines)
    } catch {
        print("lines(fromFile: \(filePath) returning empty array: \(error)")
        return []
    }
}

/**
Gets the `Int` associated with a key from a file, if present.

If the key isn't found, the default value is returned.

- parameters:
   - fromFile: The full path to the file
   - key: The key
   - defaultValue: The value to return if the key isn't found

## Rules
A file can be formatted with key/value pairs by putting one key on each line with its associated value.
- Key names follow the same rules as Swift identifiers, but may also start with a digit.
- Keys are separated from values by any number of the following punctuation characters:\
 `<space>`&nbsp;&nbsp;&nbsp;`,`&nbsp;&nbsp;&nbsp;`:`&nbsp;&nbsp;&nbsp;`=`&nbsp;&nbsp;&nbsp;`<tab>`
- Values start with the first non-punctuation character and continue to the end of the line.

## Examples
`aKey: 0`&nbsp;&nbsp;&nbsp;-->&nbsp;&nbsp;&nbsp;key: "aString", value: 0
 
`anotherKey = 73`&nbsp;&nbsp;&nbsp;-->&nbsp;&nbsp;&nbsp;key:"anotherKey", value: 73
 
`key_3_b==42`&nbsp;&nbsp;&nbsp;-->&nbsp;&nbsp;&nbsp;key: "key_3_b", value: 42
 
`__keyFour     00500`&nbsp;&nbsp;&nbsp;-->&nbsp;&nbsp;&nbsp;key: "__keyFour", value: 500
 
`5,1`&nbsp;&nbsp;&nbsp;-->&nbsp;&nbsp;&nbsp;key: "5", value: 1
*/
public func intValue(fromFile filePath: String, key: String, defaultValue: Int) -> Int {
    let dict = lines(fromFile: filePath).keyValueStrings()
    if let value = dict[key], let intValue = Int(value) {
        return intValue
    } else {
        return defaultValue
    }
}

/**
Gets the `Double` associated with a key from a file, if present.

If the key isn't found, the default value is returned.

- parameters:
   - fromFile: The full path to the file
   - key: The key
   - defaultValue: The value to return if the key isn't found

## Rules
A file can be formatted with key/value pairs by putting one key on each line with its associated value.
- Key names follow the same rules as Swift identifiers, but may also start with a digit.
- Keys are separated from values by any number of the following punctuation characters:\
 `<space>`&nbsp;&nbsp;&nbsp;`,`&nbsp;&nbsp;&nbsp;`:`&nbsp;&nbsp;&nbsp;`=`&nbsp;&nbsp;&nbsp;`<tab>`
- Values start with the first non-punctuation character and continue to the end of the line.

## Examples
`aKey: 0`&nbsp;&nbsp;&nbsp;-->&nbsp;&nbsp;&nbsp;key: "aString", value: 0.0
 
`anotherKey = 100.524`&nbsp;&nbsp;&nbsp;-->&nbsp;&nbsp;&nbsp;key:"anotherKey", value: 100.524
 
`key_3_b==.25`&nbsp;&nbsp;&nbsp;-->&nbsp;&nbsp;&nbsp;key: "key_3_b", value: 0.25
 
`__keyFour     42`&nbsp;&nbsp;&nbsp;-->&nbsp;&nbsp;&nbsp;key: "__keyFour", value: 42.0
 
`3,14.15`&nbsp;&nbsp;&nbsp;-->&nbsp;&nbsp;&nbsp;key: "5", value: 14.15
*/
public func doubleValue(fromFile filePath: String, key: String, defaultValue: Double) -> Double {
    let dict = lines(fromFile: filePath).keyValueStrings()
    if let value = dict[key], let doubleValue = Double(value) {
        return doubleValue
    } else {
        return defaultValue
    }
}

/**
Gets the `Bool` associated with a key from a file, if present.

If the key isn't found, the default value is returned.

- parameters:
   - fromFile: The full path to the file
   - key: The key
   - defaultValue: The value to return if the key isn't found

## Rules
A file can be formatted with key/value pairs by putting one key on each line with its associated value.
- Key names follow the same rules as Swift identifiers, but may also start with a digit.
- Keys are separated from values by any number of the following punctuation characters:\
 `<space>`&nbsp;&nbsp;&nbsp;`,`&nbsp;&nbsp;&nbsp;`:`&nbsp;&nbsp;&nbsp;`=`&nbsp;&nbsp;&nbsp;`<tab>`
- Values start with the first non-punctuation character and continue to the end of the line.

## Examples
`aKey: true`&nbsp;&nbsp;&nbsp;-->&nbsp;&nbsp;&nbsp;key: "aString", value: true
 
`anotherKey = true`&nbsp;&nbsp;&nbsp;-->&nbsp;&nbsp;&nbsp;key:"anotherKey", value: true
 
`key_3_b==false`&nbsp;&nbsp;&nbsp;-->&nbsp;&nbsp;&nbsp;key: "key_3_b", value: false
 
`__keyFour     true`&nbsp;&nbsp;&nbsp;-->&nbsp;&nbsp;&nbsp;key: "__keyFour", value: true
 
`5,false`&nbsp;&nbsp;&nbsp;-->&nbsp;&nbsp;&nbsp;key: "5", value: false
*/
public func boolValue(fromFile filePath: String, key: String, defaultValue: Bool) -> Bool {
    let dict = lines(fromFile: filePath).keyValueStrings()
    if let value = dict[key], let boolValue = Bool(value) {
        return boolValue
    } else {
        return defaultValue
    }
}

/**
Gets the `String` associated with a key from a file, if present.

If the key isn't found, the default value is returned.

- parameters:
   - fromFile: The full path to the file
   - key: The key
   - defaultValue: The value to return if the key isn't found

## Rules
A file can be formatted with key/value pairs by putting one key on each line with its associated value.
- Key names follow the same rules as Swift identifiers, but may also start with a digit.
- Keys are separated from values by any number of the following punctuation characters:\
 `<space>`&nbsp;&nbsp;&nbsp;`,`&nbsp;&nbsp;&nbsp;`:`&nbsp;&nbsp;&nbsp;`=`&nbsp;&nbsp;&nbsp;`<tab>`
- Values start with the first non-punctuation character and continue to the end of the line.

## Examples
`aKey: Hi There`&nbsp;&nbsp;&nbsp;-->&nbsp;&nbsp;&nbsp;key: "aString", value: "Hi There"
 
`anotherKey = AnotherValue`&nbsp;&nbsp;&nbsp;-->&nbsp;&nbsp;&nbsp;key:"anotherKey", value: "AnotherValue"
 
`key_3_b==A third value.`&nbsp;&nbsp;&nbsp;-->&nbsp;&nbsp;&nbsp;key: "key_3_b", value: "A third value."
 
`__keyFour     "A fourth value."`&nbsp;&nbsp;&nbsp;-->&nbsp;&nbsp;&nbsp;key: "__keyFour", value: "\"A fourth value.\""
 
`5,Fifth and final value`&nbsp;&nbsp;&nbsp;-->&nbsp;&nbsp;&nbsp;key: "5", value: "Fifth and final value"
*/
public func stringValue(fromFile filePath: String, key: String, defaultValue: String) -> String {
    let dict = lines(fromFile: filePath).keyValueStrings()
    if let value = dict[key] {
        return value
    } else {
        return defaultValue
    }
}

/**
 Returns a struct instance from a JSON-formatted file.
 
 - parameter fromFile:The full path to the file
 
 - returns: A struct instance
 
 The file must have one JSON object compatible with a struct type you've declared.
 
 ## Note
 
 To use this function, you must declare a variable with an explicit type—you can't rely on type inference.
 
 ## Example
 `let anInstance: MyStructType = structValue(fromFile: "/path/to/aFile.json")`
 */
public func structValue<T: Codable>(fromFile filePath:String) -> T {
    let source = DataSource<T>(fileURL: URL(fileURLWithPath: filePath))
    return source.items.first!
}

/**
Returns an array of struct instances from a JSON-formatted file.

- parameter fromFile:The full path to the file

- returns: An array of struct instances

The file must have an array of JSON objects compatible with a struct type you've declared.

## Note

To use this function, you must declare a variable with an explicit type—you can't rely on type inference.

## Example
`let anArray: [MyStructType] = structValues(fromFile: "/path/to/aFile.json")`
*/
public func structValues<T: Codable>(fromFile filePath:String) -> [T] {
    let source = DataSource<T>(fileURL: URL(fileURLWithPath: filePath))
    return source.items
}
