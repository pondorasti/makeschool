<!-- Run this slideshow via the following command: -->
<!-- reveal-md README.md -w -->


<!-- .slide: class="header" -->

# NSUserDefaults & Plist

## [Slides](https://make-school-courses.github.io/MOB-2.1-Local-Persistence-in-iOS/Slides/Lesson2/README.html ':ignore')

<!-- > -->

## Agenda

- Plist


- NSUserDefaults
- Activity w/property wrappers

<!-- > -->

## Learning Objectives

By the end of this lesson, we should be able to...

- Identify use cases for persisting information in a plist.
- Use a plist to store and retrieve data.
- Identify use cases for persisting information with UserDefaults in iOS
- Use UserDefaults to store and retrieve data.
- Familiarize with property wrappers.

<!-- > -->

## The plist

A **property list**, or **plist**, is an XML file that contains **key-value** data.

<!-- > -->

In iOS, a common plist is the `Info.plist` file.

An information property list file is a structured text file that contains essential configuration information for a bundled executable.

<!-- > -->

![ex1](assets/ex1.png)

<!-- > -->

Typically the contents are structured using XML. The root XML node is always an **array or a dictionary**, whose contents are a set of **keys and values** describing the bundle.

These values are used by the system to obtain information about the app and its configuration.

<!-- > -->

![ex2](assets/ex2.png)

<!-- > -->

The file is called `Info.plist` by convention. The file name is case sensitive so it should have a capital letter I.

The file is created automatically by Xcode when you create a new project.

<!-- > -->

### Adding keys

The default `Info.plist` file given by Xcode has the required keys, but it's possible that you will need to add more for your project. We can use the plist as a key-value data store.

- To add a new item, right-click on the editor and select *Add Row*.
- To change the value's type, click on the select button in the Type column.
- To change the value, double-click on the Value column.
- To remove a row, select it and hit Backspace.

<!-- > -->

Reading from a plist

```swift
var format = PropertyListSerialization.PropertyListFormat.xml
var data:[String:AnyObject] = [:]
let path:String? = Bundle.main.path(forResource: "MyList", ofType: "plist")!
let xmlContents = FileManager.default.contents(atPath: path!)!
  do{
    data = try PropertyListSerialization.propertyList(from: xmlContents,
          options: .mutableContainersAndLeaves,
          format: &format) as! [String:AnyObject]
    print(data)
  }
  catch{
    print("Error reading plist: \(error)")
  }
```

<!-- > -->

Writing to a plist

```swift
let path:String? = Bundle.main.path(forResource: "MyList", ofType: "plist")!
let fileManager = FileManager.default
if fileManager.fileExists(atPath: path!) {
  guard let dict = NSMutableDictionary(contentsOfFile: path!) else { return }
  //add values to dictionary
  let fileManager = FileManager.default
  if fileManager.fileExists(atPath: path!) {
    if !dict.write(toFile: path!, atomically: false) {
      print("File not written successfully")
    }
  }          
}
```

<!-- > -->

### Handling Plist operations

We can write small helper methods to help handling plists easier.

[This suggestion](https://stackoverflow.com/questions/25100262/save-data-to-plist-file-in-swift) made on StackOverflow keeps all operations on plists contained in a single place and prevents errors

```Swift

struct Plist {

  enum PlistError: Error {
    case FileNotWritten
    case FileDoesNotExist
  }

  let name:String

  var sourcePath:String? {
    guard let path = Bundle.main.path(forResource: name, ofType: "plist") else { return nil }
    return path
  }

  var destPath:String? {
    guard sourcePath != nil else { return nil }
    let dir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    return (dir as NSString).appendingPathComponent("\(name).plist")
  }

  init?(name:String) {

    self.name = name

    let fileManager = FileManager.default

    guard let source = sourcePath else { return nil }
    guard let destination = destPath else { return nil }
    guard fileManager.fileExists(atPath: source) else { return nil }

    if !fileManager.fileExists(atPath: destination) {

      do {
        try fileManager.copyItem(atPath: source, toPath: destination)
      } catch let error as NSError {
        print("Unable to copy file. ERROR: \(error.localizedDescription)")
        return nil
      }
    }
  }


  func getValuesInPlistFile() -> NSDictionary?{
    let fileManager = FileManager.default
    if fileManager.fileExists(atPath: destPath!) {
      guard let dict = NSDictionary(contentsOfFile: destPath!) else { return nil }
      return dict
    } else {
      return nil
    }
  }

  func getMutablePlistFile() -> NSMutableDictionary?{
    let fileManager = FileManager.default
    if fileManager.fileExists(atPath: destPath!) {
      guard let dict = NSMutableDictionary(contentsOfFile: destPath!) else { return nil }
      return dict
    } else {
      return nil
    }
  }

  func addValuesToPlistFile(dictionary:NSDictionary) throws {
    let fileManager = FileManager.default
    if fileManager.fileExists(atPath: destPath!) {
      if !dictionary.write(toFile: destPath!, atomically: false) {
        print("File not written successfully")
        throw PlistError.FileNotWritten
      }
    } else {
      throw PlistError.FileDoesNotExist
    }
  }
}

```

<!-- > -->

## In Class Activity I

Instructions [here](https://github.com/Make-School-Courses/MOB-2.1-Local-Persistence-in-iOS/blob/master/Lessons/Lesson2/assignments/plist.md)

<!-- > -->

## UserDefaults

<iframe src="https://www.youtube.com/embed/D0dp7f_atO0" data-autoplay  width="700" height="500"></iframe>

<!-- > -->

UserDefaults allows us to store:
- Strings
- Numbers
- Dates
- Data
- Arrays
- Dictionaries

Keep in mind that it is a **small** amount of data what we should be storing in UserDefaults.

<!-- > -->

Usually it should be used to store user preferences, or anything as long as it's a **small amount of persistent information**.

Every piece of data we store will have a unique **key**, if we try saving things with the same key, new data will only replace the old data.

<!-- > -->

🔓 Should **never be used for sensitive data** as its not encrypted

(eg. Authentication Token, passwords).

<!-- > -->

## Example

Storing a Boolean

```swift
// Set
UserDefaults.standard.set(false, forKey: "FirstTime")

// Get
let value = UserDefaults.standard.bool(forKey: "FirstTime")
```

<!-- > -->

## Example

Storing a String.

```swift
// Set
UserDefaults.standard.set("Mika", forKey: "name")

// Get
let name = UserDefaults.standard.string(forKey: "name") ?? ""
```

<!-- > -->

Items stored in UserDefault belong to an app.

⚠️ This means deleting your app will clear out its UserDefaults.

<!-- > -->

## In Class Activity II

Instructions [here](https://github.com/Make-School-Courses/MOB-2.1-Local-Persistence-in-iOS/blob/master/Lessons/Lesson2/assignments/defaults.md)

<!-- > -->

## Resources
[Plist - article](https://learnappmaking.com/plist-property-list-swift-how-to/)<br>
[Info.plist - Apple Docs](https://developer.apple.com/library/archive/documentation/General/Reference/InfoPlistKeyReference/Articles/AboutInformationPropertyListFiles.html#//apple_ref/doc/uid/TP40009254-102276)<br>
[Apple Documentation on UserDefaults](https://developer.apple.com/documentation/foundation/userdefaults)<br>
[Plist struct](https://stackoverflow.com/questions/25100262/save-data-to-plist-file-in-swift)<br>
[User defaults - exercise](https://medium.com/@nimjea/userdefaults-in-swift-4-d1a278a0ec79)<br>
[Property Wrappers](https://www.vadimbulavin.com/swift-5-property-wrappers/)
