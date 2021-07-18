# FileSystem

## Objectives
- Identify the parts of the filesystem in an iOS app
- List the important parts of an iOS app filesystem
- Practice accessing files from the filesystem

## Filesystem

Apps can only read/write files within their sandbox

![App structure](app-structure.png)

### Important Directories

**Main App Bundle**

```swift
<Application_Home>/AppName.app
```

This is the main bundle of the App.

All of the content of this folder is created at compile time (based on files added in
Xcode) and cannot be modified at runtime!

Bundle contains binary along with resource files


**Documents Directory**

```swift
<Application_Home>/Documents/
```

This is the place to store data that is critical to your application
(user generated content, content that cannot be automatically
regenerated)

This directory is backed up with iTunes Backups and it can be
made available to iTunes users via Filesharing


**Temporary Directory**

```swift
<Application_Home>/tmp
```

Use this to store files that you do not need to persist
permanently.

You are responsible for removing files from this
directory when they are no longer needed.


**Library Directory**

```swift
<Application_Home>/Library
```
Used to store files that you don't want to expose to the user


```swift
<Application_Home>/Library/Caches
```

This folder should be used to store cached information (e.g.
profile pictures that have been downloaded).

iOS will remove files from this directory when it needs to free
disk space, your app needs to be able to handle deletion of
file in the caches directory.

*Note*

- The content of this folder is not backed up to iTunes.

- All files in the Library directory (excluding the Library/Caches
directory) are backed up to iTunes by default. You can change
this by using a file attribute

## Accessing files

Accessing files within the application bundle:

```swift
let path = Bundle.main.path(forResource: "file1", ofType: ".jpg")
if let path = path {
    let image = UIImage(contentsOfFile: path)
}
```
Short form:
```swift
UIImage(named: "file1.jpg")
```

### Accessing files within the documents directory:
#### The FileManager

Its a class that allows us to interact with the filesystem.

#### Using the FileManager

```swift
let fileManager = FileManager.default
let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)

if let documentDirectory: URL = urls.first {
    let documentURL = documentDirectory.appendingPathComponent("txtFile.txt")
    do {
        let content = try String(contentsOfURL: documentURL)
    } catch let error {
        print(error.localizedDescription)
    }
}
 ```

### Writing files

Writing a file to the documents directory:

```swift
let fileManager = FileManager.default
let urls = fileManager.urls(for: .documentDirectory,
in: .userDomainMask)

if let documentDirectory: URL = urls.first {
    let documentURL = documentDirectory.appendingPathComponent("txtFile.txt")
    // data you want to write to file
    let data = Data()
    data.write(to: documentURL, options: .atomic)
}
```
Visit the documentation page for info on how to access specific directories in the filesystem

[FileManger Documentation](https://developer.apple.com/documentation/foundation/filemanager)


### When to use filesystem

- Primarily when storing/caching binary data such as images/ audio/ video
- Can also be used to store serialized Objects, allows to persist objects and Object Graphs from your application


## Challenges

Clone/Download the repo below to get started:

[Bundle Challenge - Robo Profiles](https://github.com/Product-College-Labs/RoboProfiles)


## Resources

[FileManger Documentation](https://developer.apple.com/documentation/foundation/filemanager)
