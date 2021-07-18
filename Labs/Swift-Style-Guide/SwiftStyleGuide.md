# Swift Style Guide
https://google.github.io/swift/

## Table of Contents:

<a name="ch1TOC"></a>

1. [Source File Basics](#ch1)
    - [File Names](#ch1.1)
    - [File Encoding](#ch1.2)
    - [Whitespace Characters](#ch1.3)
    - [Special Escape Sequences](#ch1.4)
    - [Invisible Characters and Modifiers](#ch1.5)
    - [String Literals](#ch1.6)


<a name="ch2TOC"></a>

2. [Source File Structure](#ch2)
    - [File Comments](#ch2.1)
    - [Import Statements](#ch2.2)
    - [Type, Variable, and Function Declarations](#ch2.3)
    - [Overloaded Declarations](#ch2.4)
    - [Extensions](#ch2.5)
    
    
<a name="ch2TOC"></a>

3. [ General Formatting](#ch3)
    - [Column Limit](#ch3.1)
    - [Braces](#ch3.2)
    - [Semicolons](#ch3.3)
    - [One Statement Per Line](#ch3.4)
    - [Line-Wrapping](#ch3.5)
        - [Function Declarations](#ch3.5.1)
        - [Type and Extension Declarations](#ch3.5.2)
        - [Function Calls](#ch3.5.3)
        - [Control Flow Statements](#ch3.5.4)
        - [Other Expressions](#ch3.5.5)
    - [Horizontal Whitespace](#ch3.6)
    - [Horizontal Alignment](#ch3.7)
    - [Vertical Whitespace](#ch3.8)
    - [Parentheses](#ch3.9)
    
    
<a name="ch3TOC"></a>

4. [Formatting Specific Constructs](#ch4)
    - [Non-Documentation Comments](#ch4.1)
    - [Properties](#ch4.2)
    - [Switch Statements](#ch4.3)
    - [Enum Cases](#ch4.4)
    - [Trailing Closures](#ch4.5)
    - [Trailing Commas](#ch4.6)
    - [Numeric Literals](#ch4.7)
    - [Attributes](#ch4.8)
    
    
<a name="ch4TOC"></a>

5. [Naming](#ch5)
    - [Apple’s API Style Guidelines](#ch5.1)
    - [Naming Conventions Are Not Access Control](#ch5.2)
    - [Identifiers](#ch5.3)
    - [Initializers](#ch5.4)
    - [Static and Class Properties](#ch5.5)
    - [Global Constants](#ch5.6)
    - [Delegate Methods](#ch5.7)
    
    
<a name="ch6TOC"></a>

6. [Programming Practices](#ch6)
    - [Compiler Warnings](#ch6.1)
    - [Properties](#ch6.3)
    - [Types with Shorthand Names](#ch6.4)
    - [Optional Types](#ch6.5)
    - [Error Types](#ch6.6)
    - [Force Unwrapping and Force Casts](#ch6.7)
    - [Implicitly Unwrapped Optionals](#ch6.8)
    - [Access Levels](#ch6.9)
    - [Nesting and Namespacing](#ch6.10)
    - [guards for Early Exits](#ch6.11)
    - [for-where Loops](#ch6.12)
    - [fallthrough in switch Statements](#ch6.13)
    - [Pattern Matching](#ch6.14)
    - [Tuple Patterns](#ch6.15)
    - [Numeric and String Literals](#ch6.16)
    - [Playground Literals](#ch6.17)
    
    
<a name="ch7TOC"></a>

7. [Documentation Comments](#ch7)
    - [General Format](#ch7.1)
    - [Single-Sentence Summary](#ch7.2)
    - [Parameter, Returns, and Throws Tags](#ch7.3)
    - [Apple’s Markup Format](#ch7.4)
    - [Where to Document](#ch7.5)


------------------------------------------------------------------------------------------------------------------------



<a name="ch1"></a>
## [1. Source File Basics](#ch1TOC)

<a name="ch1.1"></a>
### [File Names](#ch1TOC)

<a name="ch1.2"></a>
### [File Encoding](#ch1TOC)

<a name="ch1.3"></a>
### [Whitespace Characters](#ch1TOC)

<a name="ch1.4"></a>
### [Special Escape Sequences](#ch1TOC)

<a name="ch1.5"></a>
### [Invisible Characters and Modifiers](#ch1TOC)

<a name="ch1.6"></a>
### [String Literals](#ch1TOC)

------------------------------------------------------------------------------------------------------------------------

<a name="ch2"></a>
## [2. Source File Structure](#ch2TOC)

<a name="ch2.1"></a>
### [File Comments](#ch2TOC)

<a name="ch2.2"></a>
### [Import Statements](#ch2TOC)

<a name="ch2.3"></a>
### [Type, Variable, and Function Declarations](#ch2TOC)

<a name="ch2.4"></a>
### [Overloaded Declarations](#ch2TOC)

<a name="ch2.5"></a>
### [Extensions](#ch2TOC)
    
------------------------------------------------------------------------------------------------------------------------

<a name="ch3"></a>
## [3. General Formatting](#ch3TOC)

<a name="ch3.1"></a>
### [Column Limit](#ch3TOC)

<a name="ch3.2"></a>
### [Braces](#ch3TOC)

<a name="ch3.3"></a>
### [Semicolons](#ch3TOC)

<a name="ch3.4"></a>
### [One Statement Per Line](#ch3TOC)

<a name="ch3.5"></a>
### [Line-Wrapping](#ch3TOC)

<a name="ch3.5.1"></a>
### [Function Declarations](#ch3TOC)

<a name="ch3.5.2"></a>
### [Type and Extension Declarations](#ch3TOC)

<a name="ch3.5.3"></a>
### [Function Calls](#ch3TOC)

<a name="ch3.5.4"></a>
### [Control Flow Statements](#ch3TOC)

<a name="ch3.5.5"></a>
### [Other Expressions](#ch3TOC)
    
<a name="ch3.6"></a>
### [Horizontal Whitespace](#ch3TOC)

<a name="ch3.7"></a>
### [Horizontal Alignment](#ch3TOC)

<a name="ch3.8"></a>
### [Vertical Whitespace](#ch3TOC)

<a name="ch3.9"></a>
### [Parentheses](#ch3TOC)
    
------------------------------------------------------------------------------------------------------------------------

<a name="ch4"></a>
## [4. Formatting Specific Constructs](#ch4TOC)

<a name="ch4.1"></a>
### [Non-Documentation Comments](#ch4TOC)

<a name="ch4.2"></a>
### [Properties](#ch4TOC)
- Variables are not created in single line
- Local variables that are closely related are stored as a tuple instead

Ex:
```swift
//⛔️⛔️⛔️
var quotient = 11, remainder = 1
```
```swift
//✅✅✅
var quotient = 11
var remainder = 1

//⭐️⭐️⭐️
let (quotient, remainder) = divide(100, 9)
```

<a name="ch4.3"></a>
### [Switch Statements](#ch4TOC)
- Case statements are indented at the same level as the switch statement to which they belong.
- Only code block inside the cases are indented with the exception of `break`

Ex:
```swift
//⛔️⛔️⛔️
switch order {
  case .ascending:
    print("Ascending")
  case .descending:
    print("Descending")
  case .same:
    print("Same")
  default:
    break
}
```

```swift
//✅✅✅
switch order {
case .ascending:
  print("Ascending")
case .descending:
  print("Descending")
case .same:
  print("Same")
default: break
}
```


<a name="ch4.4"></a>
### [Enum Cases](#ch4TOC)
- In general, there is only one case per line in an enum. Only separate cases with a comma when enum is simple and when none of the cases have asociated values or raw values

```swift
//✅✅✅
public enum Token { //enum without associated or raw values
  case comma, semicolon, identifier
}

public enum Token {
  case comma
  case semicolon
  case identifier(String) //associated value
```
```swift
//⛔️⛔️⛔️
public enum Token {
  case comma, semicolon, identifier(String)
}
```

- When all cases of an enum are `indirect`, the enum itself is declared `indirect` and the indirect keyword is removed from all the cases.

```swift
//✅✅✅
public indirect enum DependencyGraphNode {
  case userDefined(dependencies: [DependencyGraphNode])
  case synthesized(dependencies: [DependencyGraphNode])
}
```
```swift
//⛔️⛔️⛔️
public enum DependencyGraphNode {
  indirect case userDefined(dependencies: [DependencyGraphNode])
  indirect case synthesized(dependencies: [DependencyGraphNode])
}
```

- When an `enum` case does not have associated values, empty parentheses are never present

```swift
//⛔️⛔️⛔️
public enum BinaryTree<Element> {
  indirect case node(element: Element, left: BinaryTree, right: BinaryTree)
  case empty()  // AVOID.
}
```
```swift
//✅✅✅
public enum BinaryTree<Element> {
  indirect case node(element: Element, left: BinaryTree, right: BinaryTree)
  case empty  // GOOD.
}
```


- The cases of an enum must follow a logical ordering that the author could explain.

```swift
//⛔️⛔️⛔️
public enum HTTPStatus: Int {
  case badRequest = 400
  case forbidden = 403
  case internalServerError = 500
  case notAuthorized = 401
  case notFound = 404
  case ok = 200
  case paymentRequired = 402
}
```
```swift
//✅✅✅
//Cases are arranged in numerical order and blank lines are used to separate groups
public enum HTTPStatus: Int {
  case ok = 200

  case badRequest = 400
  case notAuthorized = 401
  case paymentRequired = 402
  case forbidden = 403
  case notFound = 404

  case internalServerError = 500
}
```

<a name="ch4.5"></a>
### [Trailing Closures](#ch4TOC)
- Functions should not be overloaded that they differ only by the name of their trailing closure argument.

```swift
//⛔️⛔️⛔️
//This prohibits using trailing closure syntax to call greet
func greet(enthusiastically nameProvider: () -> String) {
  print("Hello, \(nameProvider())! It's a pleasure to see you!")
}

func greet(apathetically nameProvider: () -> String) {
  print("Oh, look. It's \(nameProvider()).")
}

greet { "John" }  // error: ambiguous use of 'greet'
```
```swift
//✅✅✅
func greetEnthusiastically(_ nameProvider: () -> String) {
  print("Hello, \(nameProvider())! It's a pleasure to see you!")
}

func greetApathetically(_ nameProvider: () -> String) {
  print("Oh, look. It's \(nameProvider()).")
}

greetEnthusiastically { "John" }
greetApathetically { "not John" }
```

- If a function call has multiple closure arguments, then *none* are called using trailing closure syntax, instead *all* are labeled and nested inside the argument list’s parentheses.
```swift
//⛔️⛔️⛔️
UIView.animate(
  withDuration: 0.5,
  animations: {
    // ...
  }) { finished in
    // ...
  }
```
```swift
//✅✅✅
UIView.animate(
  withDuration: 0.5,
  animations: {
    // ...
  },
  completion: { finished in //labeled closure arguments
    // ...
  })
```

- When a function called with trailing closure syntax takes no other arguments, empty parentheses (()) after the function name are never present.

```swift
//✅✅✅
let squares = [1, 2, 3].map { $0 * $0 }
```

```swift
//⛔️⛔️⛔️
let squares = [1, 2, 3].map({ $0 * $0 })
let squares = [1, 2, 3].map() { $0 * $0 }
```


<a name="ch4.6"></a>
### [Trailing Commas](#ch4TOC)
- Trailing commas in **array** and **dictionary literals** are required when each element is placed on its own line.

```swift
//✅✅✅
let configurationKeys = [
  "bufferSize",
  "compression",
  "encoding",                                    // GOOD.
]
```
```swift
//⛔️⛔️⛔️
let configurationKeys = [
  "bufferSize",
  "compression",
  "encoding"                                     // AVOID.
]
```


<a name="ch4.7"></a>
### [Numeric Literals](#ch4TOC)
- For readability, It is recommended but not required that long numeric literals (decimal, hexadecimal, octal, and binary) use the underscore (_) separator to group digits
- 3 digits for decimals, 4 digits for hexadecimal, 4 or 8 digits for binary literals

```swift
//⛔️⛔️⛔️
var bigInt = 50020099000
var smallDouble = 0.2340911002
var bigHex = "7BFC6FEA9"
```
```swift
//✅✅✅
var bigInt = 50_020_099_000
var smallDouble = 0.234_091_100_2
var bigHex = "7_BFC6_FEA9"
```

<a name="ch4.8"></a>
### [Attributes](#ch4TOC)
- Parameterized attributes (such as @availability(...) or @objc(...)) are each written on their own line before the declaration to which they apply, are ordered, and are indented at the same level.
```swift
//⛔️⛔️⛔️
@available(iOS 9.0, *) public func coolNewFeature() {
  // ...
}
```
```swift
//✅✅✅
@available(iOS 9.0, *)
public func coolNewFeature() {
  // ...
}
```

- Attributes without parameters (for example, @objc without arguments, `@IBOutlet`, or `@NSManaged`) may be placed on the same line
```swift
//✅✅✅
public class MyViewController: UIViewController {
  @IBOutlet private var tableView: UITableView!
}
```

------------------------------------------------------------------------------------------------------------------------

<a name="ch5"></a>
## [5. Naming](#ch5TOC)

<a name="ch5.1"></a>
### [Apple’s API Style Guidelines](#ch5TOC)


<a name="ch5.2"></a>
### [Naming Conventions Are Not Access Control](#ch5TOC)
- Do not put access control (`open`, `internal`, `fileprivate`, `private`) on model or variable names
- Open access is the highest (least restrictive) access level and private access is the lowest (most restrictive) access level.
```swift
//⛔️⛔️⛔️
struct PrivateProfile {
    var secretId: String
    ...
}
```

```swift
//✅✅✅
private struct HiddenProfile {
    var secretId: String
    ...
}
```

<a name="ch5.3"></a>
### [Identifiers](#ch5TOC)
- Identifiers should only contain [7-bit ASCII characters](https://www.sciencebuddies.org/science-fair-projects/references/ascii-table). 
- Unicode identifiers are allowed if they have a clear and legitimate meaning 
    - e.g. Greek letters that represent mathematical concepts
```swift
//✅✅✅
let smile = "😊"
let deltaX = newX - previousX
let Δx = newX - previousX
```

```swift
//⛔️⛔️⛔️
let 😊 = "😊"
```

<a name="ch5.4"></a>
### [Initializers](#ch5TOC)
- Initializer arguments that correspond directly to a stored property have the same name as the property

```swift
//⛔️⛔️⛔️
public struct Person {
  public let name: String
  public let phoneNumber: String

  // AVOID.
  public init(name otherName: String, phoneNumber otherPhoneNumber: String) {
    name = otherName
    phoneNumber = otherPhoneNumber
  }
}
```
```swift
//✅✅✅
public struct Person {
  public let name: String
  public let phoneNumber: String

  // GOOD.
  public init(name: String, phoneNumber: String) {
    self.name = name
    self.phoneNumber = phoneNumber
  }
}
```

<a name="ch5.5"></a>
### [Static and Class Properties](#ch5TOC)
- Static and class properties that return instances of the declaring type are *not suffixed* with the name of the type.
```swift
//⛔️⛔️⛔️
public class UIColor {
  public class var redColor: UIColor {           // AVOID.
    // ...
  }
}

public class URLSession {
  public class var sharedSession: URLSession {   // AVOID.
    // ...
  }
}

```
```swift
//✅✅✅
public class UIColor {
  public class var red: UIColor {                // GOOD.
    // ...
  }
}

public class URLSession {
  public class var shared: URLSession {          // GOOD.
    // ...
  }
}
```

<a name="ch5.6"></a>
### [Global Constants](#ch5TOC)
- Like other variables, global constants are **lowerCamelCase**
```swift
//⛔️⛔️⛔️
let SecondsPerMinute = 60
let kSecondsPerMinute = 60
let gSecondsPerMinute = 60
let SECONDS_PER_MINUTE = 60
```

```swift
//✅✅✅
let secondsPerMinute = 60
```

<a name="ch5.7"></a>
### [Delegate Methods](#ch5TOC)
- All methods take the delegate’s source object as the first argument

##### For methods that take the delegate’s source object as their only argument:
- If method **returns Void**
    - base name is **delegate’s source type** followed by an **indicative verb phrase** describing the event
    - argument is **unlabeled**
    ```swift
    func scrollViewDidBeginScrolling(_ scrollView: UIScrollView) //✅✅✅
    ```
- If the method **returns Bool** (such as those that make an assertion about the delegate’s source object itself), then the method’s 
    - name is the **delegate’s source type** followed by an **indicative or conditional verb phrase** describing the assertion
    - argument is **unlabeled**.
    ```swift
    func scrollViewShouldScrollToTop(_ scrollView: UIScrollView) -> Bool //✅✅✅
    ```
- If the method returns some other value 
    - base name is a **noun phrase** describing the property being queried. 
    - argument is **labeled with a preposition or phrase with a trailing preposition** that combines the noun phrase and the delegate’s source object
    ```swift
    func numberOfSections(in scrollView: UIScrollView) -> Int //✅✅✅
    ```
##### For methods that take additional arguments after the delegate’s source object, the method’s base name is the delegate’s source type by itself and the **first argument is unlabeled**. Then:
- If the method **returns Void**, 
    - the second argument is **labeled with an indicative verb phrase** describing the event that has the argument as its **direct object or prepositional object**
    ```swift
    //✅✅✅
    func tableView(
    _ tableView: UITableView,
    willDisplayCell cell: UITableViewCell,
    forRowAt indexPath: IndexPath)
    ```
- If the method **returns Bool**, 
    - the second argument is **labeled with an indicative or conditional verb phrase** that describes the return value in terms of the argument

    ```swift
    //✅✅✅
    func tableView(
      _ tableView: UITableView,
      shouldSpringLoadRowAt indexPath: IndexPath,
      with context: UISpringLoadedInteractionContext
    ) -> Bool
    ```
- If the method **returns some other value**, 
    - the second argument is **labeled with a noun phrase and trailing preposition** that describes the return value in terms of the argument
    ```swift
    //✅✅✅
    func tableView(
      _ tableView: UITableView,
      heightForRowAt indexPath: IndexPath
    ) -> CGFloat
    ```

Apple’s documentation on [delegates and data sources](https://developer.apple.com/library/content/documentation/General/Conceptual/CocoaEncyclopedia/DelegatesandDataSources/DelegatesandDataSources.html) also contains some good general guidance about such names.



------------------------------------------------------------------------------------------------------------------------

<a name="ch6"></a>
## [6. Programming Practices](#ch6TOC)
This section is about rules to avoid: 
- avoid redundancy
- avoid ambiguity
- implicitness over explicitness unless being explicit improves readability and/or reduces ambiguity.


<a name="ch6.1"></a>
### [Compiler Warnings](#ch6TOC)
- Code should compile without warnings unless these warnings are hard for the author to remove
- A reasonable exception is deprecation warnings

<a name="ch6.3"></a>
### [Properties](#ch6TOC)
- The `get` block for a read-only computed property is omitted

```swift
//⛔️⛔️⛔️
var totalCost: Int {
  get {
    return items.sum { $0.cost }
  }
}
```

```swift
//✅✅✅
var totalCost: Int {
  return items.sum { $0.cost }
}
```

<a name="ch6.4"></a>
### [Types with Shorthand Names](#ch6TOC)
- Arrays, dictionaries, and optional types are written in their shorthand form whenever possible
```swift
//⛔️⛔️⛔️
func enumeratedDictionary<Element>(
  from values: Array<Element>,
  start: Optional<Array<Element>.Index> = nil
) -> Dictionary<Int, Element> {
  // ...
}
```

```swift
//✅✅✅
func enumeratedDictionary<Element>(
  from values: [Element],
  start: Array<Element>.Index? = nil
) -> [Int: Element] {
  // ...
}
```

- `Void` is a `typealias` for the empty tuple (), so from an implementation point of view they are equivalent
- `Void` return type is omitted entirely on functions with the `func` keyword
```swift
//⛔️⛔️⛔️
func doSomething() -> Void {
  // ...
}

func doSomething2() -> () {
  // ...
}

let callback: () -> ()
```

```swift
//✅✅✅
func doSomething() {
  // ...
}

let callback: () -> Void
```

<a name="ch6.5"></a>
### [Optional Types](#ch6TOC)
- Optional is used to convey a non-error result that is either a value or the absence of a value
    - e.g. searching a collection for a value and not finding the value is **valid and expect outcome**, not an error 
```swift
//⛔️⛔️⛔️
func index(of thing: Thing, in things: [Thing]) -> Int { //should not return -1 if no index like in Python
  // ...
}

let index = index(of: thing, in: lotsOfThings)
if index != -1 {
  // Found it.
} else {
  // Didn't find it.
}
```

```swift
//✅✅✅
func index(of thing: Thing, in things: [Thing]) -> Int? { //should return nil index instead of -1
  // ...
}

if let index = index(of: thing, in: lotsOfThings) {
  // Found it.
} else {
  // Didn't find it.
}
```
- Conditional statements that test that an Optional is non-nil but do not access the wrapped value are written as comparisons to nil

```swift
//⛔️⛔️⛔️
if let _ = value {
  print("value was not nil")
}
```
```swift
//✅✅✅
if value != nil {
  print("value was not nil")
}
```

<a name="ch6.6"></a>
### [Error Types](#ch6TOC)
- Error types are used when there are multiple possible error states
- Throwing errors instead of merging them with the return type cleanly separates concerns
- Invalid inputs and invalid state are treated as errors and are handled using **do-catch** and **try**
```swift
//✅✅✅
struct Document {
  enum ReadError: Error {
    case notFound
    case permissionDenied
    case malformedHeader
  }

  init(path: String) throws {
    // ...
  }
}

do {
  let document = try Document(path: "important.data")
} catch Document.ReadError.notFound {
  // ...
} catch Document.ReadError.permissionDenied {
  // ...
} catch {
  // ...
}
```
- In general, force-try! is forbidden because it is equivalent to try followed by fatalError **without a meaningful message**
    - **exceptiion** unit tests and test-only code
```swift
let regex = try! NSRegularExpression(pattern: "a*b+c?")
```

<a name="ch6.7"></a>
### [Force Unwrapping and Force Casts](#ch6TOC)
- Force-unwrapping and force-casting are often code smells and are strongly discouraged
- **Exception:** 
    - clear comment that describes to other programmers that the operation is safe
    - unit tests and test-only code does not need additional documentation
```swift
//✅✅✅
let value = getSomeInteger()

// ...intervening code...

// This force-unwrap is safe because `value` is guaranteed to fall within the
// valid enum cases because it came from some data source that only permits
// those raw values.
return SomeEnum(rawValue: value)!
```


<a name="ch6.8"></a>
### [Implicitly Unwrapped Optionals](#ch6TOC)
- Implicitly unwrapped optionals are unsafe and should be avoided in favor of non-optional declarations or regular `Optional` types
- **Exceptions**
    - User-interface objects whose lifetimes are based on the UI lifecycle like `@IBOutlet` properties connected to XIB file or storyboard
    - properties that are initialized externally like in the `prepareForSegue`
    - properties that are initialized elsewhere during a class’s life cycle, like views in a view controller’s `viewDidLoad` method
    - unit tests which must initialized in the `setup()` method
```swift
//✅✅✅
class SomeViewController: UIViewController {
  @IBOutlet var button: UIButton!

  override func viewDidLoad() {
    populateLabel(for: button)
  }

  private func populateLabel(for button: UIButton) {
    // ...
  }
}
```

<a name="ch6.9"></a>
### [Access Levels](#ch6TOC)
- Specifying an explicit access level at the file level on an extension is forbidden 
- Each member of the extension should have its access level specified if it is different than the default

```swift
//⛔️⛔️⛔️
public extension String {
  var isUppercase: Bool {
    // ...
  }

  var isLowercase: Bool {
    // ...
  }
}
```

```swift
//✅✅✅
extension String {
  public var isUppercase: Bool {
    // ...
  }

  public var isLowercase: Bool {
    // ...
  }
}
```

<a name="ch6.10"></a>
### [Nesting and Namespacing](#ch6TOC)
- Swift allows and prefers enums, structs, and classes to be nested to show scope and relationships among types 
```swift
//⛔️⛔️⛔️
class Parser {
  func parse(text: String) throws {
    // ...
  }
}

enum ParseError: Error {
  case invalidToken(String)
  case unexpectedEOF
}
```

```swift
//✅✅✅
class Parser {
  enum Error: Swift.Error {
    case invalidToken(String)
    case unexpectedEOF
  }

  func parse(text: String) throws {
    // ...
  }
}
```

- Swift does not currently allow protocols to be nested in other types or vice versa
- Declaring an enum without cases is **the canonical way to define a “namespace”** to group a set of related declarations, such as constants or helper functions

```swift
//⛔️⛔️⛔️
struct Dimensions {
  private init() {}

  static let tileMargin: CGFloat = 8
  static let tilePadding: CGFloat = 4
  static let tileContentSize: CGSize(width: 80, height: 64)
}
```

```swift
//✅✅✅
enum Dimensions {
  static let tileMargin: CGFloat = 8
  static let tilePadding: CGFloat = 4
  static let tileContentSize: CGSize(width: 80, height: 64)
}
```


<a name="ch6.11"></a>
### [guards for Early Exits](#ch6TOC)
- A `guard` statement provides visual emphasis that the condition being tested is a special case that causes early exit from the enclosing scope
- `guard` statements improve readability by eliminating extra levels of nesting
```swift
//⛔️⛔️⛔️
func discombobulate(_ values: [Int]) throws -> Int {
  if let first = values.first {
    if first >= 0 {
      var result = 0
      for value in values {
        result += invertedCombobulatoryFactor(of: value)
      }
      return result
    } else {
      throw DiscombobulationError.negativeEnergy
    }
  } else {
    throw DiscombobulationError.arrayWasEmpty
  }
}
```

```swift
//✅✅✅
func discombobulate(_ values: [Int]) throws -> Int {
  guard let first = values.first else {
    throw DiscombobulationError.arrayWasEmpty
  }
  guard first >= 0 else {
    throw DiscombobulationError.negativeEnergy
  }

  var result = 0
  for value in values {
    result += invertedCombobulatoryFactory(of: value)
  }
  return result
}
```


<a name="ch6.12"></a>
### [for-where Loops](#ch6TOC)
- If the entirety of a for loop’s body would be a single if block testing a condition of the element, the test is placed in the where clause of the for statement instead
```swift
//⛔️⛔️⛔️
for item in collection {
  if item.hasProperty {
    // ...
  }
}
```
```swift
//✅✅✅
for item in collection where item.hasProperty {
  // ...
}
```

<a name="ch6.13"></a>
### [fallthrough in switch Statements](#ch6TOC)
- Multiple cases of a switch that execute the same statements should be combined into ranges or comma-delimited lists. 
- Multiple case statements that do nothing but fallthrough to a case below are not allowed
    - there is never a case whose body contains only the fallthrough statement
```swift
//⛔️⛔️⛔️
switch value {
case 1: print("one")
case 2: fallthrough
case 3: fallthrough
case 4: print("two to four")
case 5: fallthrough
case 7: print("five or seven")
default: break
}
```

```swift
//✅✅✅
switch value {
case 1: print("one")
case 2...4: print("two to four")
case 5, 7: print("five or seven")
default: break
}
```


<a name="ch6.14"></a>
### [Pattern Matching](#ch6TOC)
- The let and var keywords are placed individually in front of each element in a pattern that is being matched

```swift
//✅✅✅
enum DataPoint {
  case unlabeled(Int)
  case labeled(String, Int)
}

let label = "goodbye"

// `label` is treated as a value here because it is not preceded by `let`, so
// the pattern below matches only data points that have the label "goodbye".
switch DataPoint.labeled("hello", 100) {
case .labeled(label, let value):
  // ...
}

// Writing `let` before each individual binding clarifies that the intent is to
// introduce a new binding (shadowing the local variable within the case) rather
// than to match against the value of the local variable. Thus, this pattern
// matches data points with any string label.
switch DataPoint.labeled("hello", 100) {
case .labeled(let label, let value):
  // ...
}
```
- The first switch example above, the author is comparing "hello" with "goodbye" while the second switch statement is creating an instance of the "hello"

##### Pattern matching with Tuples
- Labels of tuple arguments and enum associated values are omitted when binding a value to a variable with the same name as the label.
- Including the labels adds noise that is redundant and lacking useful information
```swift
//⛔️⛔️⛔️
switch treeNode {
case .subtree(left: let left, right: let right):
  // ...
case .leaf(element: let element):
  // ...
}
```

```swift
//✅✅✅
enum BinaryTree<Element> {
  indirect case subtree(left: BinaryTree<Element>, right: BinaryTree<Element>)
  case leaf(element: Element)
}

switch treeNode {
case .subtree(let left, let right):
  // ...
case .leaf(let element):
  // ...
}
```


<a name="ch6.15"></a>
### [Tuple Patterns](#ch6TOC)
- Assigning variables through a tuple pattern is only permitted if the left-hand side of the assignment is unlabeled.
```swift
//⛔️⛔️⛔️
let (x: a, y: b) = (y: 4, x: 5.0)
```
```swift
//✅✅✅
let (a, b) = (y: 4, x: 5.0)
```
- Labels on the left-hand side should resemble type annotations
```swift
//⛔️⛔️⛔️
let (x: Int, y: Double) = (y: 4, x: 5.0)
```

<a name="ch6.16"></a>
### [Numeric and String Literals](#ch6TOC)
- Integer and string literals in Swift do not have an intrinsic type
```swift
//⛔️⛔️⛔️
// This first tries to create an `Int` (signed) from the literal and then
// convert it to a `UInt64`. Even though this literal fits into a `UInt64`, it
// doesn't fit into an `Int` first, so it doesn't compile.
let a1 = UInt64(0x8000_0000_0000_0000)

// This invokes `Character.init(_: String)`, thus creating a `String` "a" at
// runtime (which involves a slow heap allocation), extracting the character
// from it, and then releasing it. This is significantly slower than a proper
// coercion.
let b = Character("a")

// As above, this creates a `String` and then `Character.init(_: String)`
// attempts to extract the single character from it. This fails a precondition
// check and traps at runtime.
let c = Character("ab")
```

```swift
//✅✅✅
// Without a more explicit type, x1 will be inferred as type Int.
let x1 = 50

// These are explicitly type Int32.
let x2: Int32 = 50
let x3 = 50 as Int32

// Without a more explicit type, y1 will be inferred as type String.
let y1 = "a"

// These are explicitly type Character.
let y2: Character = "a"
let y3 = "a" as Character

// These are explicitly type UnicodeScalar.
let y4: UnicodeScalar = "a"
let y5 = "a" as UnicodeScalar

func writeByte(_ byte: UInt8) {
  // ...
}
// Inference also occurs for function arguments, so 50 is a UInt8 without
// explicitly coercion.
writeByte(50)
```


<a name="ch6.17"></a>
### [Playground Literals](#ch6TOC)
- The graphically-rendered playground literals `#colorLiteral(...)`, `#imageLiteral(...)`, and `#fileLiteral(...)` are forbidden in non-playground production code
```swift
//⛔️⛔️⛔️
let color = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
```
```swift
//✅✅✅
let color = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
```

------------------------------------------------------------------------------------------------------------------------

<a name="ch7"></a>
## [7. Documentation Comments](#ch7TOC)

<a name="ch7.1"></a>
### [General Format](#ch7TOC)
- Documentation comments are written with a triple slash (///) at the beginning of the line, not Javadoc-style block comments (/** ... */)
```swift
//⛔️⛔️⛔️
/**
 * Returns the numeric value of the given digit represented as a Unicode scalar.
 *
 * - Parameters:
 *   - digit: The Unicode scalar whose numeric value should be returned.
 *   - radix: The radix, between 2 and 36, used to compute the numeric value.
 * - Returns: The numeric value of the scalar.
 */
func numericValue(of digit: UnicodeScalar, radix: Int = 10) -> Int {
  // ...
}
```

```swift
//✅✅✅
/// Returns the numeric value of the given digit represented as a Unicode scalar.
///
/// - Parameters:
///   - digit: The Unicode scalar whose numeric value should be returned.
///   - radix: The radix, between 2 and 36, used to compute the numeric value.
/// - Returns: The numeric value of the scalar.
func numericValue(of digit: UnicodeScalar, radix: Int = 10) -> Int {
  // ...
}
```


<a name="ch7.2"></a>
### [Single-Sentence Summary](#ch7TOC)
- Documentation comments begin with a brief **single-sentence** summary that describes the declaration.
- May not be too many lines
- Does not need to be a complete sentence
```swift
//⛔️⛔️⛔️
/// This property is the background color of the view.
var backgroundColor: UIColor

/// This method returns the sum of the numbers in the given array.
///
/// - Parameter numbers: The numbers to sum.
/// - Returns: The sum of the numbers.
func sum(_ numbers: [Int]) -> Int {
  // ...
}
```

```swift
//✅✅✅
/// The background color of the view.
var backgroundColor: UIColor

/// Returns the sum of the numbers in the given array.
///
/// - Parameter numbers: The numbers to sum.
/// - Returns: The sum of the numbers.
func sum(_ numbers: [Int]) -> Int {
  // ...
}
```


<a name="ch7.3"></a>
### [Parameter, Returns, and Throws Tags](#ch7TOC)
- Clearly document the parameters, return value, and thrown errors of functions using the `Parameter(s)`, `Returns`, and `Throws` tags, in that order
- None should have an empty description. 
- When a description does not fit on a single line, continuation lines are indented 2 spaces in from the position of the hyphen starting the tag.
- Recommended way to write a documentation comments in Xcode is to place cursor on the declaration and press **Command + Option + /** to automatically generate the correct format with placeholders to be filled in ⭐️⭐️⭐️
```swift
//⛔️⛔️⛔️
/// Returns the output generated by executing a command.
///
/// - Parameters:
///   - command: The command to execute in the shell environment. 🚫🚫🚫
/// - Returns: A string containing the contents of the invoked process's
///   standard output.
func execute(command: String) -> String {
  // ...
}

/// Returns the output generated by executing a command with the given string
/// used as standard input.
///
/// - Parameter command: The command to execute in the shell environment. 🚫🚫🚫
/// - Parameter stdin: The string to use as standard input. 🚫🚫🚫
/// - Returns: A string containing the contents of the invoked process's
///   standard output.
func execute(command: String, stdin: String) -> String {
  // ...
}
```

```swift
//✅✅✅
/// Returns the output generated by executing a command.
///
/// - Parameter command: The command to execute in the shell environment.
/// - Returns: A string containing the contents of the invoked process's
///   standard output.
func execute(command: String) -> String {
  // ...
}

/// Returns the output generated by executing a command with the given string
/// used as standard input.
///
/// - Parameters:
///   - command: The command to execute in the shell environment.
///   - stdin: The string to use as standard input.
/// - Returns: A string containing the contents of the invoked process's
///   standard output.
func execute(command: String, stdin: String) -> String {
  // ...
}

```


<a name="ch7.4"></a>
### [Apple’s Markup Format](#ch7TOC)
- Use of [Apple’s markup format](https://developer.apple.com/library/content/documentation/Xcode/Reference/xcode_markup_formatting_ref/) is strongly encouraged to add rich formatting to documentation.
- Some Examples:
    - Paragraphs are separated using a single line that starts with /// and is otherwise blank.
    - *Single asterisks* (*) and _single underscores_ (_) will italisize text
    - **Double asterisks** (**) and __double underscores__ (__) will bold the text
    - Names of symbols or inline code are surrounded in `backticks` (`).
    - Multi-line code is denoted by placing three backticks ( `` `) on the lines before and after the code block.

<a name="ch7.5"></a>
### [Where to Document](#ch7TOC)
- At a minimum, **documentation comments are present for every open or public declaration, and every open or public member** of such a declaration
- Exceptions:
    - Individual cases of an enum often are not documented if their meaning is self-explanatory from their name. 
        - Cases with associated values, however, should document what those values mean if it is not obvious.
    - A documentation comment is not always present on a declaration that overrides a supertype declaration or implements a protocol requirement, or on a declaration that provides the default implementation of a protocol requirement in an extension.
    - It is acceptable to document an overridden declaration to describe new behavior from the declaration that it overrides.
    - A documentation comment is not always present on test classes and test methods. 
        - However, they can be useful for functional test classes and for helper classes/methods shared by multiple tests.
    - A documentation comment is not always present on an extension declaration (that is, the extension itself). You may add one if it help clarify the purpose of the extension, but avoid meaningless or misleading comments.
        ```swift
        //⛔️⛔️⛔️
        /// Add `Equatable` conformance.
        extension MyType: Equatable {
          // ...
        }
        ```

    - Example below's documentation that is not scalable because the extension or the conformance could be updated in the future. Client code could use `Comparable` for other purposes in the future
        ```swift
        //⛔️⛔️⛔️
        /// Make `Candidate` comparable so that they can be sorted.
        extension Candidate: Comparable {
          // ...
        }
        ```
    - Leave out comments that are repeated information that is obvious from the source and sugaring words like “a representation of”

------------------------------------------------------------------------------------------------------------------------
