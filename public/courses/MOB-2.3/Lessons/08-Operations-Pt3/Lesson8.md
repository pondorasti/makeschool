# Operations Pt. 3

<!-- INSTRUCTOR NOTES:
1)  -->

## Learning Objectives

1. Identify use cases of Operations with dependencies.
1. Implement dependencies.
1. Review Operations by implementing a solution in a project.


## Dependencies

(Refer to slides)

## In Class Activity I

### Pair Programming activity - Introduction


**We'll do this activity in pairs.** One of you will code while the other guides the activity using this repo. Then at some point you will switch roles.

Get the starter project [here](https://github.com/amelinagzz/operations-starter). Build it, run it and tap where it says  **“Show Tilt Shift”**.  What we’ll see is an example of what we want to achieve for a collection of images. It's a blur effect. 🤓

Tilt shifting is a technique used on images to alter the depth of field. This results in a change in focus as you can tell from comparing both images.

Now go back and select **“Show Table View”**. You’ll notice it’s an empty table with some activity indicators, but nothing ever shows up. Let’s fix that. 😦

We’ll start using an over simplified approach to then make it better.

Files breakdown:

- `ExampleViewController.swift`- The VC with the example image to demonstrate the filter effect
- `PhotoCell.swift` - Custom cell with the layout to display one image
- `TiltShiftFilter.swift` - Class that create and applies the filter
- `TiltShiftOperation.swift` - Operation class responsible to handle filter application
- `TiltShiftTableViewController.swift` - VC with the tableview that needs to be fixed
- `NetworkImageOperation.swift` - Operation that will be used later to download images from urls
- `AsyncOperation.swift` - Operation implementation with KVO
- Assets - contains the 10 images you will use for the first part of this activity

### Step 1

Go to `TiltShiftTableViewController.swift` and on the `cellForRowAt` method, get an image to then apply the filter to it.

```Swift
override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  let cell = tableView.dequeueReusableCell(withIdentifier: "normal", for: indexPath) as! PhotoCell
  let name = "\(indexPath.row).png" //these files can be found in the assets folder
  let inputImage = UIImage(named:name)!

  //Creating the filter
  guard let filter = TiltShiftFilter(image:inputImage, radius:3), let output = filter.outputImage else{
    print("Failed to generate image")
    cell.display(image: nil)
    return cell
  }

  let fromRect = CGRect (origin: .zero, size: inputImage.size)
  let context = CIContext() //context used to turn the image back to UIImage
  guard let cgImage = context.createCGImage(output, from: fromRect) else{
    print("Image generation failed")
    cell.display(image:nil)
    return cell
  }

  cell.display(image: UIImage(cgImage:cgImage))
  return cell
}
```

Now run the app and notice how the table takes forever to load (you might want to wait up to a minute or two 😵) and is pretty much unusable. But the images are there now!

**Can you guess what is it that we need to do to improve the user experience?**

If any of you said moving the tilt shifting off the main thread and into a background thread, you are correct ✅


### Step 2 - Using an operation

Let’s move the Core Image operations into `TiltShiftOperation` which is an Operation subclass.

Add this property to you class:
`private static let context = CIContext()`
The reason why this property is *static* is because we don’t want to create a new context with each instance of the operation. CIContext should be reused if possible and it’s also *thread safe*.

Add two properties: `outputImage` and `inputImage`. Both of type `UIImage?`.

Add the initializer.
```Swift
init(image: UIImage? = nil) {
    inputImage = image
    super.init()
}
```

Now let’s override the main method. Here goes the long running task we want to do. **Make sure you move the right code into the main method.** (hint: we tried to do this for each cell) See if you can do it on your own. And then confirm you have it right with the following:

```swift
override func main() {
  if let inputImage = inputImage{
    guard let filter = TiltShiftFilter(image: inputImage, radius:3),
      let output = filter.outputImage else {
        print("Failed to generate tilt shift image")
        return
    }

    let fromRect = CGRect(origin: .zero, size: inputImage.size)
    guard let cgImage = TiltShiftOperation.context.createCGImage(output, from: fromRect) else {
      print("No image generated")
      return
    }
    outputImage = UIImage(cgImage: cgImage)
  }
}
```

After that is correctly set up. **We need to go back to our table and make it use our operation.** Try running it manually, using the `start()` method. It should look something like this:

```swift
override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  let cell = tableView.dequeueReusableCell(withIdentifier: "normal", for: indexPath) as! PhotoCell
  let name = "\(indexPath.row).png"
  let inputImage = UIImage(named:name)!
  print("Filtering")
  let op = TiltShiftOperation(image: inputImage)
  op.start()

  cell.display(image: op.outputImage)
  print("Done")

  return cell
}
```

Build and run. Is this a lot better? How about performance? Think about what is it that changed and how it’s not good yet.

**Q: What is the problem?**

If you said it’s the `start()` call, correct! When we call the start method directly, we are performing a *synchronous* call on the main thread. So even when we moved out the filtering code into an Operation, we are still not using it correctly to take advantage of it.

Another thing that could have gone really wrong, was if the operation wasn’t ready and we call start on it. Sure crash. ❌


### Step 3 -  Updating the table

Go to `TiltShiftTableViewController` and create a new `OperationQueue` at the scope of the class (at the top). We'll use the queue to run the TiltShiftOperation instead of doing it manually.

```swift
let operationQueue = OperationQueue()
```

Now replace the contents of `cellForRowAt` to run the operation with the queue. Like this:

```swift
override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  let cell = tableView.dequeueReusableCell(withIdentifier: "normal", for: indexPath) as! PhotoCell
  let name = "\(indexPath.row).png"
  let inputImage = UIImage(named:name)!
  let tiltOperation = TiltShiftOperation(image: inputImage)
  tiltOperation.completionBlock = {
    DispatchQueue.main.async {
      guard let cell = tableView.cellForRow(at: indexPath) as? PhotoCell else { return }
      cell.isLoading = false
      cell.display(image: tiltOperation.outputImage)
    }
  }
  operationQueue.addOperation(tiltOperation)
  return cell
}
```

Build and run. What’s different from the last time? Is this better? 🤔 It should be! Now each image applies the filter at its own pace.

**SWITCH TIME 🔛** If you are pair programming, give the control to the other teammate.

### Step 4 - Downloading images

Right now the app uses images from the Assets Catalog. Let’s change that so that it downloads images from URLs, which is closer to a real use case.

Take some time to look at `NetworkImageOperation.swift` before moving on. See the similarities and differences between this one and `TiltShiftOperation.swift` which you coded out entirely.

Now go to `TiltShiftTableViewController` and get list of URLs form the Photos plist. If you get stuck check it below.

```Swift
private var urls: [URL] = []
override func viewDidLoad() {
  super.viewDidLoad()
  guard let plist = Bundle.main.url(forResource: "Photos",
                                    withExtension: "plist"),
        let contents = try? Data(contentsOf: plist),
        let serial = try? PropertyListSerialization.propertyList(
                          from: contents,
                          format: nil),
        let serialUrls = serial as? [String] else {
        print("Something went horribly wrong!")
        return
}
  urls = serialUrls.compactMap(URL.init)
}
```

**Food for thought: What is compactMap doing?** Think about if and share with your partner.

Now change `cellForRowAt` one more time to use the `NetworkImageOperation` class and send to it the corresponding element from the urls array. Try it out, it should look as follows:

```swift
override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   let cell = tableView.dequeueReusableCell(withIdentifier: "normal", for: indexPath) as! PhotoCell

   let networkOperation = NetworkImageOperation(url: urls[indexPath.row])
   networkOperation.completionBlock = {
     DispatchQueue.main.async {
       guard let cell = tableView.cellForRow(at: indexPath) as? PhotoCell else { return }
       cell.isLoading = false
       cell.display(image: networkOperation.image)
     }
   }
   operationQueue.addOperation(networkOperation)
   return cell
 }
```

Build and run. You should see a smoother scroll.

### Step 5 - Using dependencies

What we are here for! Dependencies.

Now that we have an operation that downloads the image and another that applies the filter, let’s combine them together to have one happening after the other. Using dependencies 😎

To start we are going to need a protocol to pass data between operations. Create a new file and call it `ImageDataProvider` and add the following:

```Swift
import UIKit
protocol ImageDataProvider {
  var image: UIImage? { get }
}

```

Both `NetworkImageOperation` and `TiltShiftOperation` should conform to this protocol. You can try doing that in extensions.

```Swift
extension NetworkImageOperation: ImageDataProvider {}

extension TiltShiftOperation: ImageDataProvider {
  var image: UIImage? { return outputImage }
}
```

We know `TiltShiftOperation` needs an image as input. Let’s also make it check if any of its dependencies give the image as output.

Add this at the beginning of `main()` in `TiltShiftOperation`:

```Swift
let dependencyImage = dependencies
  .compactMap { ($0 as? ImageDataProvider)?.image }
  .first
guard let inputImage = inputImage ?? dependencyImage else {
return
}
```
At this point you will need to get rid of the safety `if ... let` that we had before because now we are using a `guard` statement for the same purpose.

Let’s  go back to 'TiltShiftTableViewcontroller' change what’s in `cellForRowAt` again (this is the last time I promise), specifically the line where we set and declare the operation.

```Swift
let networkOperation = NetworkImageOperation(url: urls[indexPath.row])
let tiltShiftOp = TiltShiftOperation()
tiltShiftOp.addDependency(networkOperation)
```

See how we have now **2 operations and a dependency** that ties them together.

Now instead of setting the completionBlock, set it on the `tiltShiftOp` which is the one giving you back the image.

Replace it with this:
```Swift
tiltShiftOp.completionBlock = {
  DispatchQueue.main.async {
    guard let cell = tableView.cellForRow(at: indexPath) as? PhotoCell else { return }
    cell.isLoading = false
    cell.display(image: tiltShiftOp.outputImage)
  }
}
```

**Our tilt shift depends on the download. Does this mean we should only add the network operation to the queue?**

```swift
operationQueue.addOperation(networkOperation)
```

**Or both?**

```swift
operationQueue.addOperation(networkOperation)
operationQueue.addOperation(tiltShiftOp)
```

Try both and see what is the answer. Then you should have the tableview working in the end.

### Step 6 - Final fix

You have probably noticed that the cells don't clean up before being reused. We are not caching these images but we can make it better by cleaning up the cell using the method `prepareForReuse`. Open `PhotoCell.swift` and add the following:

```swift
override func prepareForReuse() {
  nasaImageView.image = nil
  activityIndicator.startAnimating()
}
```

Try running it again and this time you should not see the previous images before new ones get placed.

Congrats you made it! You used dependencies with Operations to establish the following order:

1. Download images from urls
2. Apply Filters to the images

You also used an operation queue to run these to make sure things happened async. Great job 👍🏼

## Wrap Up

- You pair programmed today's exercise. Make sure both of you get a working copy of the project.

## Additional Resources

1. [Slides](https://docs.google.com/presentation/d/1ZS9ZQaGVD5bsQ3kkDOBDZY_fRgh45Xgsb1NHPhuXAbI/edit?usp=sharing)
1. Concurrency by Tutorials Book
