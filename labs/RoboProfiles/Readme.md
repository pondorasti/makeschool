# Robo Profiles
#### Using the iOS FileSystem

We will be practicing how to read files from the iOS filesystem. In this repository is an iOS XCode project containing a file ```robo-profiles.json``` which contains profiles of robots in json format.

## Tasks

- [x] Clone/Download this repository.

- [x] Load the file ```robo-profiles.json``` from the application bundle.

- [x] Convert the string returned from the Bundle path to a URL.

- [x] Use this method on the Data class to load the url and create data:

```swift
Data(contentsOf: url, options: .alwaysMapped)
```

- [x] Model the JSON loaded from the application bundle into Swift models (You can use Swift Codable or a Third party library for JSON Modeling).

- [x] If you are using swift's codable type, use the JSONDecoder to decode the data to a Swift model(Codable type).

- [x] Display the list of robo profiles(Name, Phrase, Personality, Image is optional) in a list (UITableView or UICollectionView).
