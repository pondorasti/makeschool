# Film locations

San Francisco is a great place to film movies. 🎬 Or at least that's what [this database](https://data.sfgov.org/Culture-and-Recreation/Film-Locations-in-San-Francisco/yitu-d5am) shows us, with its more than 3K entries. And let's not forget we'll be seeing some action scenes shot in FiDi whenever The Matrix 4 comes out. 😎

Today we will build an Xcode project listing all the locations that were once used for a film.

### 1. Create a new Xcode project

Name it **FilmLocations** and make a repo in Github for it. You will turn in the link for the finished activity in the end.

### 2. Download the locations.json file

Today we will be using the data from the database that was collected in [this file](locations.json). Download the file and drag it to the project inside Xcode.

Take a look at it, notice how data is structured using JSON. Explore the keys, values, objects, arrays.

### 3. Reading from a file

We are not fetching data from a server. To have reliable data to practice with JSON, we will be using our static data from `locations.json`. So we should learn how to fetch data from a file inside our project. Create a method to retrieve data from a file.

```swift
//method name suggestion
func getDataFromFile(_ fileName:String){}
```

Then add this inside.

```swift
let path = Bundle.main.path(forResource: "nameOfYourFile", ofType: ".json")
if let path = path {
  let url = URL(fileURLWithPath: path)
  print(url)
}
```

Here we are creating a path that goes to our project's main bundle (where all files are stored) and looks for the file with a specific name and extension.

If the path exists we can create a url for the resource, try running the project and see if you can read the url in the console.

Don't forget to call the method in viewDidLoad `getDataFromFile("locations")`

You saw it? Cool, let's keep going.

### 4. Getting the contents

We need to get the contents of the file so we can show it in our app.

```swift
let contents = try? Data(contentsOf: url)
do {
  if let data = contents,
  let jsonResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [[String:Any]] {
    print(jsonResult)
  }
} catch {
  print("Error deserializing JSON: \(error)")
}
```

So we first check if there is data and then use that data to deserialize it. We do this using the build in `JSONSerialization` class.

This class can convert JSON to Foundation objects and convert Foundation objects to JSON.

An object that may be converted to JSON must have the following properties:
- Top level object is an NSArray or NSDictionary
- All objects are NSString, NSNumber, NSArray, NSDictionary, or NSNull
- All dictionary keys are NSStrings
- NSNumbers are not NaN or infinity

The method we are using create an object from JSON data. It also asks for reading options. Here's what those mean:

`NSJSONReadingAllowFragments` - the parser should allow top-level objects that are not an NSArray or NSDictionary. <br>
`NSJSONReadingMutableContainers` - will make the parser generate mutable NSArrays and NSDictionaries.<br>
`NSJSONReadingMutableLeaves` - will make the parser generate mutable NSString objects.

If an error occurs during the parse, then the error parameter will be set and the result will be nil. That's the reason we need a try/catch block.

The data must be in one of the 5 supported encodings listed in the JSON specification: UTF-8, UTF-16LE, UTF-16BE, UTF-32LE, UTF-32BE.  The most efficient encoding to use for parsing is UTF-8, so if you have a choice in encoding the data passed to this method, use UTF-8 😀

Notice the optional casting `as? [[String:Any]]`. This detail is **critical** to have your method working. You should correctly identify the structure of the response you expect.

- Is it an array of objects?
- An array of arrays?
- An array of dictionaries?

If you have the wrong type, it can take a long time before you figure out here is where the error lies.

Run the app to see our JSON in the console.

We should use this data to create our own objects, that's how we know we can populate a tableview.

**This is a good time to commit and push.**

### 5. Creating the FilmEntry struct

Create a new file `FilmEntry` with the following properties:

```swift
struct FilmEntry {
    var firstActor: String
    var locations: String
    var releaseYear: String
    var title: String
}
```

Go back to your main ViewController and add a property in the class that will hold an array of FilmEntry elements.

```swift
var films:[FilmEntry] = []
```

### 6. Parsing objects

Go to where you print the resulting JSON. Let's start getting the data out of it and turning it into objects.

Before we identified we had an **array** of **dictionaries**. So let's loop through each entry and create a struct for each.

```swift
for film in jsonResult{
    let firstActor = film["actor_1"] as? String ?? ""
    let locations = film["locations"] as? String  ?? ""
    let releaseYear = film["release_year"] as? String  ?? ""
    let title = film["title"] as? String  ?? ""
    let movie = FilmEntry(firstActor: firstActor, locations: locations, releaseYear: releaseYear, title: title)
}
```

In this example we are giving default empty strings if we can't find the key in the dictionary. This is one way of dealing with missing data. It's not the only way:

- We could have optional properties in the structure and assign nil to missing values
- We could not create structs at all if one value is missing

How you'll do it later will depend on your team's coding preferences.

Now add each movie to the `films` array. Make sure to do it after creating the instance of `movie`.

```swift
films.append(movie)
```

This should populate our array.

**This is a good time to commit and push.**

### 7. Creating the table view

TableView drill time!

Set up a basic table view (try programmatically) and use the `film` array as the data source. You should have something similar to this in the end:

![table](table.png)

Think of **when should you call `reloadData`**.

**This is a good time to commit and push.**

### 8. Using an extension

Our app works just fine. But let's try cleaning a bit our `getDataFromFile` method by moving the parsing of each object to the structure.

```swift
extension FilmEntry {
    init?(json: [String: Any]) {
        guard let locations = json["locations"] as? String,
            let a1 = json["actor_1"] as? String,
            let year = json["release_year"] as? String,
            let title = json["title"] as? String
            else{
                return nil
        }
        self.firstActor = a1
        self.releaseYear = year
        self.title = title
        self.locations = locations
    }
}
```

This extension is creating a new initializer for the `FilmEntry` struct that takes in a dictionary. Then inside we set the values for each property. Do you see what's different from the original version?

Try adding this extension and then use it to generate your objects.

**This is a good time to commit and push.**
