## In Class Activity II

**Required Resources:**
- Internet access to the News API Web Service API: https://newsapi.org
- The [iOS-NewsApp_Starter](https://github.com/Make-School-Labs/iOS-NewsApp_Starter) app, which includes a pre-built table view ready to present the results of a data fetch.

<!--
< for reference >
https://medium.com/@azamsharp/mvvm-in-ios-from-net-perspective-580eb7f4f129 -->


### Part 1 - Refactor the data source (array)

**TODO:** Refactor the `sources` array below into an appropriate construct which implements MVVM.

```Swift
class SourceViewController: UITableViewController {

    //TODO: Using MVVM, refactor this datasource array
    var sources: [SourceItem] = []

    ...
```

### Part 2 - Respond to Data changes

**TODO:** Create a new function which will **add** a new `SourceItem` to the datasource (array) whenever the user clicks on any cell in the table view.
- For the  `name` and `overview` properties, you can hard-code any text you would like; just be sure that it is something simple that you can recognize later.
- Set an observer<sup>3</sup> on the datasource such that, whenever the array changes, data for the table view is reloaded.


<sup>3</sup> *Use either KVO or Notification.*


<!-- Refactor the table cell configuration

You will need to refactor the table cell's configuration in 2 places:

1. In the __*View Controller's*__ `cellForRowAt(_:)` function:

```Swift
override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    ...

    //TODO: Using MVVM, refactor cell configuration
     cell.sourceItem = sources[indexPath.row]
     return cell
 }
```

2. In the __*NewsFeedCell's*__ `awakeFromNib()` function:

```Swift
override func awakeFromNib() {

    ...

    //TODO: Using MVVM, refactor cell configuration
    var sourceItem: SourceItem? {
        didSet {
            guard let sourceItem = sourceItem else { return }
            nameLabel.text = sourceItem.name
            overviewLabel.text = sourceItem.overview
        }
    }
```

Part 3 -
(see Part 3 in After Class assignments below) -->
