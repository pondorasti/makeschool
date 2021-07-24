# Using Cocoapods/ Carthage / SwiftPackageManager

# Preliminary
Install homebrew from macOS

[HomeBrew Link](https://brew.sh/)


## Cocoapods
CocoaPods comes as a Ruby library and need to be installed as a RubyGem. CocoaPods is built with Ruby and is installable with the default Ruby available on OS X.

#### Instalation
```
$ sudo gem install cocoapods
```

CocoaPods can be initialised with ‘pod init‘ command which will create template Podfile

```
pod init
```

Install dependencies in the podfile with
```
pod install
```

This generates an
 - xcworkspace which you will use as your xcode project file
 - Podfile.lock which is a locked version of your dependencies
 - Pods directory where your dependencies are stored


## Carthage

Carthage takes a lightweight approach to dependency mangement. Rather than modifying your xcode project, it only downloads and creates the framworks. You have to link them yourself in xcode.

Install Carthage with
```
brew install carthage
```

Create a Cartfile with your dependencies

Run
```
carthage update
```

This will fetch dependencies into a Carthage/Checkouts folder, then build each one.

In your application targets -> “General” settings tab, in the “Linked Frameworks and Libraries” section, drag and drop each framework you want to use from the Carthage/Build folder.


## SwiftPackageManager

>> A package consists of Swift source files and a manifest file. The manifest file, called Package.swift, defines the package’s name and its contents using the PackageDescription module. A package has one or more targets. Each target specifies a product and may declare one or more dependencies.

Create a Package.swift containing all your dependencies

run ```swift build```

## Libraries we are going to use
- Zip
- Gloss or any other json parsing library
- KeychainSwift
