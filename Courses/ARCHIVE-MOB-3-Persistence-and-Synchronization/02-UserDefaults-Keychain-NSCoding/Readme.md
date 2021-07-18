# UserDefaults and Keychain

## Objectives
- Learn about storing basic data types in iOS
- Brainstorm use cases for persisting informatin with UserDefaults in iOS
- Learn about storing sensitive information with Keychain in iOS

## Class Materials

Slides:

[Intro To Persistence - Slides](intro-to-persistence.key)


## UserDefaults

UserDefaults allows to store Strings, Numbers, Dates, Data and
Arrays or Dictionaries

Usually should be used to store user preferences, can be used to store small amount of persistent information.

**Note:**

Should never be used for sensitive data as its not encrypted (eg. Authentication Token, passwords).

**Example - Storing a boolean indicating a user first downloaded(opened) an app**
```swift
// Set
UserDefaults.standard.set(false, forKey: "FirstTimeUser")

// Get
let value = UserDefaults.standard.bool(forKey: "FirstTimeUser")
```

Items stored in UserDefault belong to an app. This means deleting your app will clear out its UserDefaults.

## Keychain

Is used to store sensitive information, such as passwords. All information is stored encrypted. Meaning you can use this to store sensitive user information.

**Keychain Use Case - Logging in a User**

For instance, when loggin in a *user*, you will typically have some token/secret that is used to authorize a user's requests to a server. That information should be stored in the keychain.

Items stored in the keychain belong to a container that is shared by the operating system.
This means that if you store a key-value pair in the keychain, and delete your app without clearing the keychain, that item will persist.


> An app can access only its own keychain items, or those shared with a group to which the app belongs. It can't manage the keychain container itself. - Apple

Apple’s API is arcane - Open Source Libraries such as
KeychainSwift will make your life easier!


## Encoding/Decoding

Encoding: Creating a binary/textual representation (that can
be stored on disk, transferred via network) from an object
graph

Decoding: Creating an object graph from a binary/textual
representation

**Implementing NSCoding**

To Encode/Decode, your class has to be NSCoding compliant. That means it has to conform to NSCoding. This gives you two methods that correspond to decoding an object, and encoding it.


### Step 1: Implement NSCoding

```swift
class Movie: NSObject, NSCoding {
    var title: String
    var duration: Int

    init(title: String, duration: Int) {
        self.title = title
        self.duration = duration
    }

    required convenience init?(coder aDecoder: NSCoder) {
        guard let title = aDecoder.decodeObject(forKey: "title") as? String
            else { return nil }
        let duration = aDecoder.decodeInteger(forKey: "duration")

        self.init(title: title, duration: duration)
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.title, forKey: "title")
        aCoder.encode(self.duration, forKey: "duration")
    }
}

```

### Step 2: User Archiver - Archiving to filesystem

Archive

```swift
let data = NSKeyedArchiver.archivedData(withRootObject: movie)
```

Unarchive

```
let unarchivedMovies = NSKeyedUnarchiver.unarchiveObject(with: data) as? Movie
```

### When to use NSCoding

Use NSCoding when main goal of persistence in your App is
to store the current state of the application
If you additionally want to create queries, need migrations,
etc, there are better solutions (e.g., CoreData)


## Challenges

1. Interate Cocoapods into a project(Trip Planner)
Download KeychainSwift though cocoapods to use the keychain:

[KeychainSwift Link](https://github.com/evgenyneu/keychain-swift#keychain_access_groups)

a. Using the trip planner app from MOB2, only bring up the login screen if the user hasn't logged in. If they have, take them straight to the list of trips.

b. Generate and store the Basic Auth token securely in the keychain.

c. When making a request that requires the API key, retrieve it securely to use in your request headers.


## Resources

[Apple Documentation on UserDefaults](https://developer.apple.com/documentation/foundation/userdefaults)
