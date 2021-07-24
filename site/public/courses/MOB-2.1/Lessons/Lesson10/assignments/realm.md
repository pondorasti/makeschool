# Realm practice

You will be creating an Xcode project and handling instances of objects to save them with Realm.


## The Book Store 📚

Create a new Xcode project and call it **BookStore**. Make sure you include the test targets.

Add Realm using Swift Package Manager (or Cocoapods if SPM is not available to you).

You can find the library here: [https://github.com/realm/realm-cocoa](https://github.com/realm/realm-cocoa)

🌀*Note: Adding Realm to the project might take a few minutes.*

🌀*Another note: This project won't have UI, we will only be looking at result in the console.*


### Step 1️⃣ - Book class

Create a new Swift file and call it **Book**. Add the following to it:

```swift
import RealmSwift

class Book: Object {
    @objc dynamic var title = ""
    @objc dynamic var author = ""
    @objc dynamic var year = 0
}
```

### Step 2️⃣ - Book Store

Create a new Swift file and call it **BookStore**. Add the following to it:

```swift
import RealmSwift

enum RuntimeError: Error {
    case NoRealmSet
}

class BookStore {
    var realm: Realm?

    public func saveBook(_ book: Book){
        //TODO: save the book
    }

    public func findBooksByTitle(_ title: String) -> Results<Book>{
        let predicate = NSPredicate()
        //TODO: create the predicate that matches titles

        return realm!.objects(Book.self).filter(predicate)
    }

    private func findBooksByField(_ field: String, value: String) throws -> Results<Book>
    {
        if (realm != nil) {
            let predicate = NSPredicate()
            //TODO: create the predicate that will find books by a certain field, given a value

            return realm!.objects(Book.self).filter(predicate)
        } else {
            throw RuntimeError.NoRealmSet
        }
    }

    public func createBook(_ title: String, author: String, year: Int ) -> Book{
        let newBook = Book()
        //TODO: set the properties

        return newBook
    }

    public func updateBooks(_ field: String, currentValue: String, updatedValue: String) throws
    {
        let books = try findBooksByField(field, value: currentValue)
        try! realm!.write {
            books.setValue(updatedValue, forKey: "\(field)")
        }
    }

    public func deleteBook(_ book: Book) throws {
        //TODO: delete the book

    }
}
```

Make sure you complete all the `//TODO` tags to make this class work to CRUD books.

### Step 3️⃣ - Trying it out

Go to `ViewController.swift`. Here's where you will put the BookStore class into use.

First you need to set up Realm. Add the following inside `viewDidLoad`.

```swift
let store = BookStore()
let realm = try! Realm()
store.realm = realm

//TODO: Create a book
//A Game of Thrones (A Song of Ice and Fire #1)
//George R. R. Martin"
//1997

//TODO: Save the book


//TODO: Find the book by title, print the result.


//TODO: Delete the book

```
Make sure you complete all the `//TODO` tags.

### Step 3️⃣ - Testing

Go to `BookStoreTests.m`. And add and complete these tests:

```swift
func testSaveBook() {}
func testGetBookByTitle() {}
func testUpdateBook() {}
func testDeleteBook() {}
```

### Stretch challenges:
- Make it possible to update all value types in a book (for example, also the year).
- Adjust the find method to bring values that contain part of the text given, in case the user can't remember the complete name.
- Build simple UI for the app.
