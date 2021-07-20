<!-- Run this slideshow via the following command: -->
<!-- reveal-md README.md -w -->


<!-- .slide: class="header" -->

# NSCoding & Codable

## [Slides](https://make-school-courses.github.io/MOB-2.1-Local-Persistence-in-iOS/Slides/Lesson3/README.html ':ignore')

<!-- > -->

## Agenda

- Review/Complete activity w/property wrappers
- Objectives
- NSCoder 🧓🏼

<!-- > -->

## Learning Objectives

- Store custom objects into UserDefaults

<!-- > -->

## The problem

"A default object must be a property list—that is, an instance of (or for collections, a combination of instances of) **NSData, NSString, NSNumber, NSDate, NSArray, or NSDictionary**."

<aside class = "notes">
UserDefaults can only accept certain types and if we want to save a custom object into UserDefaults, we have to convert it into NSData first.
Before Apple introduced the Codable protocol, the way to convert custom object into NSData is using NSKeyedArchiver with NSCoding protocol like this:
</aside>

<!-- > -->

Before we had the `Codable` protocol, to convert a custom object into `NSData` we used `NSKeyedArchiver` with `NSCoding` protocol

<!-- > -->

## NSKeyedArchiver

NSKeyedArchiver encodes and decodes classes as long as they are **NSCoding compliant**.

NSCoding is a protocol that requires two methods — encode and decode. If we have a class that conforms to NSObject AND NSCoder, then that class can be serialized and deserialized into data that can be saved to a user’s disk.

<!-- > -->

**Encoding:** Creating a binary representation (that can be stored on disk, transferred via network) from an data structure.

**Decoding:** Creating a data structure from a binary/textual representation.

<!-- > -->

## Storing custom objects

```swift
struct Person {
    var name: String
}

```

<!-- > -->

```swift
extension Person: Codable {
    enum CodingKeys: String, CodingKey {
        case name
    }
}

```

<!-- > -->

What if we add a `favoriteColor` property to `Person`? of type `UIColor`.

<!-- > -->

```swift
struct Person {
    var name: String
    var favoriteColor: UIColor
}

extension Person: Codable {
    enum CodingKeys: String, CodingKey {
        case name
        case favoriteColor
}    
```

<!-- > -->

Check the documentation for UIColor & Person.

<!-- > -->

We need the NSKeyedArchiver

**Encoding**
```swift
func encode(to encoder: Encoder) throws {
  var container = encoder.container(keyedBy: CodingKeys.self)
  try container.encode(name, forKey: .name)

  let colorData = try NSKeyedArchiver.archivedData(withRootObject: favoriteColor, requiringSecureCoding: false)
  try container.encode(colorData, forKey: .favoriteColor)
}
```

<!-- > -->

**Decoding**

```swift
init(from decoder: Decoder) throws {
  let container = try decoder.container(keyedBy: CodingKeys.self)
  name = try container.decode(String.self, forKey: .name)

  let colorData = try container.decode(Data.self, forKey: .favoriteColor)
  favoriteColor = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(colorData) as? UIColor ?? UIColor.purple
}

```

<!-- > -->

## Put it to use

Take the `Person` class and use it to store an instance of it in UserDefaults.

HINT: Since the Person class conforms to the Codable protocol, you can use `JSONEncoder` and `JSONDecoder` to help you on this task.

<!-- > -->

## Resources

1. [Apple Documentation on NSKeyedArchiver](https://developer.apple.com/documentation/foundation/nskeyedarchiver)<br>
1. [Saving custom objects](https://fluffy.es/saving-custom-object-into-userdefaults/)
1. [Load and save from UserDefaults](https://www.hackingwithswift.com/example-code/system/how-to-load-and-save-a-struct-in-userdefaults-using-codable)
