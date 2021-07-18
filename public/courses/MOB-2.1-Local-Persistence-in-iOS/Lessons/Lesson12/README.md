<!-- Run this slideshow via the following command: -->
<!-- reveal-md README.md -w -->


<!-- .slide: class="header" -->

# CloudKit

## [Slides](https://make-school-courses.github.io/MOB-2.1-Local-Persistence-in-iOS/Slides/Lesson12/README.html ':ignore')

<!-- > -->

## Learning Objectives

1. Review creating records to CloudKit.
1. Fetch records with CloudKit.
1. Understand the mechanism behind an external app.

<!-- > -->


## Useful code snippets

```swift
extension CKContainer {
    static var shared: CKContainer {
        return CKContainer(identifier: "iCloud.com.amgm.Trends.t5")
    }
}
```

<!-- > -->

```swift
let categoryRecord = CKRecord(recordType: .Category, recordID: .init(recordName: UUID().uuidString))
categoryRecord[.title] = ""
categoryRecord[.order] = ""

let operation = CKModifyRecordsOperation(recordsToSave: [categoryRecord], recordIDsToDelete: nil)
operation.modifyRecordsCompletionBlock = { savedRecords, deletedRecordIds, error in

  if let error = error {
      fatalError(error.localizedDescription)
  } else if let records = savedRecords {
      print(records)
  } else {
    fatalError()
  }
}
CKContainer.shared.publicCloudDatabase.add(operation)
```

<!-- > -->

Type safety 👌🏼

```swift
extension CKRecord.RecordType {
    public static var Category: String = "Category"
    public static var Post: String = "Post"
}
```

<!-- > -->

Type safety 👌🏼

```swift
enum CKRecordKey: String {
    //Category
    case title, order
    //Post
    case thumbnail, url, date, category
}
```
*title is reusable in Post*

<!-- > -->

## Fetching from CloudKit

- **NSPredicate** describes a filter that we'll use to decide which results to show.
- **NSSortDescriptor** tells CloudKit which field we want to sort on, and whether we want it ascending or descending.
- **CKQuery** combines a predicate and sort descriptors with the name of the record type we want to query.
- **CKQueryOperation** is the work horse of CloudKit data fetching, executing a query and returning results.

<!-- > -->

```swift
let predicate = NSPredicate(value: true)
let query = CKQuery(recordType: "Category", predicate: predicate)
```

<!-- > -->

```swift
let operationFetch = CKQueryOperation(query: query)
```

<!-- > -->

operationFetch.recordFetchedBlock = { record in
    print(record)
}

<!-- > -->

```swift
operationFetch.queryCompletionBlock = { [unowned self] (cursor, error) in
    DispatchQueue.main.async {
        if error == nil {
            print("Done")
        } else {
          let ac = UIAlertController(title: "Fetch failed", message: "There was a problem fetching the list of posts; please try again: \(error!.localizedDescription)", preferredStyle: .alert)
          ac.addAction(UIAlertAction(title: "OK", style: .default))
          self.present(ac, animated: true)
        }
    }
}
```

<!-- > -->

```swift
CKContainer.default().publicCloudDatabase.add(operationFetch)
```

<!-- > -->

Everything together

```swift
let predicate = NSPredicate(value: true)
let query = CKQuery(recordType: "Category", predicate: predicate)
let operationFetch = CKQueryOperation(query: query)

operationFetch.recordFetchedBlock = { record in
    print(record)
}
operationFetch.queryCompletionBlock = { [unowned self] (cursor, error) in
    DispatchQueue.main.async {
        if error == nil {
            print("Done")
        } else {
            let ac = UIAlertController(title: "Fetch failed", message: "There was a problem fetching the list of posts; please try again: \(error!.localizedDescription)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(ac, animated: true)
        }
    }
  }
CKContainer.default().publicCloudDatabase.add(operationFetch)
```

<!-- > -->

## Now you try it

Do the same to get a list of all the available posts.

<!-- > -->

## Challenge - but more like exploring 🕵🏻‍♀️

You'll be given sample code for an app that's ready to fetch data from CloudKit.

- Look for the warnings and check what each step is doing.
- Try to focus only on CloudKit/CoreData related functions (there's a lot more to the project and it might feel overwhelming)
- If you conceptually understand how the app works, that's the win we are going for. 💪🏼
- Can you hook up the app with your own CloudKit instance? 

<!-- > -->

## External resources

- [Using Core Data with CloudKit](https://developer.apple.com/videos/play/wwdc2019/202/)
- [Tutorial - not free](https://www.raywenderlich.com/3413-introduction-to-cloudkit)
- [Tutorial - free](https://www.raywenderlich.com/4878052-cloudkit-tutorial-getting-started)
- [Apple's docs - start guide](https://developer.apple.com/library/archive/documentation/DataManagement/Conceptual/CloudKitQuickStart/Introduction/Introduction.html#//apple_ref/doc/uid/TP40014987-CH1-SW1)
- [CloudKit 101](https://rambo.codes/posts/2020-02-25-cloudkit-101)
- [Code snippets](https://littlebitesofcocoa.com/topics/36-cloudkit)
- [Reading from iCloud](https://www.hackingwithswift.com/read/33/6/reading-from-icloud-with-cloudkit-ckqueryoperation-and-nspredicate)
- Starter code for consumer app by Mustafa Yusuf
