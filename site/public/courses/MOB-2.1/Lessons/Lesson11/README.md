<!-- Run this slideshow via the following command: -->
<!-- reveal-md README.md -w -->


<!-- .slide: class="header" -->

# CloudKit

## [Slides](https://make-school-courses.github.io/MOB-2.1-Local-Persistence-in-iOS/Slides/Lesson11/README.html ':ignore')

<!-- > -->

## Why you should know this

Everything should sync -> We turn to cloud storage

As an app creates data, it can be backed up and recovered anytime.

**What are current solutions?**

<!-- > -->

## Learning Objectives

1. Describe how the technology behind CloudKit works.
1. Set up an Xcode project with CloudKit support.
1. Familiarize with the CloudKit dashboard.
1. Create records.

<!-- > -->

## CloudKit

Technology behind iCloud.

Moves data from Apple's server to an app and backwards.

Using CloudKit, gives you a backend so that users can persist data between devices.

<!-- > -->

## Why CloudKit

**PROS**

- Create database driven apps with just one tool
- Centralized place where users can share data
- Little server management experience
- Subscriptions
- User discovery


<!-- > -->

**CONS**

-  Not able to run server side code
-  Not cross platform
-  Free -ish

<!-- > -->

## About Containers

![containers](assets/containers.png)

<!-- > -->

![cloudkit](assets/cloudkit.jpeg)

<!-- > -->

## CoreData & CloudKit

We've learned to use Core Data API to manage data locally in an app.<br>
CloudKit gives access to a large distributed database.

Both are very similar and model their APIs in terms of Objects, Models and Stores.

<!-- > -->

|         |      CoreData            |       CloudKit               |
|:-------:|:------------------------:|:----------------------------:|
| Objects |   NSManagedObject        |     CKRecord                 |
| Model   |   NSManagedObjectModel   |     Schema                   |
| Store   |   NSPersistentStore      |     CKRecordZone/CKDatabase  |

<!--

## NSPersistentCloudKitContainer

- Encapsulation of common patterns used to build sync with iCloud
- Gives us a copy of all CloudKit data to store locally
- Robust scheduling and error recovery
- Handles transformation between NSManagedObject and CKRecord

## Why a local replica of CloudKit?

Fetching from a local store is MUCH FASTER 😀

See more about this in [this video from WWDC](https://developer.apple.com/videos/play/wwdc2019/202/)(min 9:00)

-->

<!-- > -->

## Creating a new project

![list](assets/list.png)

Walktrough creating a project (refer to recording of the class).

<!-- > -->

When creating a new project we must make sure to select support for CoreData & CloudKit.

We also need to set up Capabilities:
- iCloud & we automatically get the Notifications support.
- Background Modes

<!-- > -->

## Challenge

Now that the project has CloudKit:

- Create a Custom container for the app.

Create two new records:

- **Category** (title, order)
- **Post** (title, url, date categories)

- Visualize the newly created records in the dashboard.

[CloudKit 101](https://rambo.codes/posts/2020-02-25-cloudkit-101)

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

## Stretch challenge

Build UI for the Admin App.

<!-- > -->

## External resources

- [Using Core Data with CloudKit](https://developer.apple.com/videos/play/wwdc2019/202/)
- [Tutorial - not free](https://www.raywenderlich.com/3413-introduction-to-cloudkit)
- [Tutorial - free](https://www.raywenderlich.com/4878052-cloudkit-tutorial-getting-started)
- [Apple's docs - start guide](https://developer.apple.com/library/archive/documentation/DataManagement/Conceptual/CloudKitQuickStart/Introduction/Introduction.html#//apple_ref/doc/uid/TP40014987-CH1-SW1)
- [CloudKit 101](https://rambo.codes/posts/2020-02-25-cloudkit-101)
- [Code snippets](https://littlebitesofcocoa.com/topics/36-cloudkit)
