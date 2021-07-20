```swift
struct Box{
    var date: Date
    var items: [BoxItem]
    var imageStr: String
}

struct BoxItem{
    var name: String
    var categories: [Category]
    var description: String
    var isFavorite: Bool
}

enum Category{
    case food
    case treats
    case meds
    case clothing
    case toys
    case grooming
    case training
}
```

Example for creating dummy data:

```swift
func createData(){
        let item = BoxItem(name: "Treat", categories: [.food, .treats], description: "Dry treats for training", isFavorite: false)
        let item2 = BoxItem(name: "Ball", categories: [.toys], description: "Ball to play fetch", isFavorite: false)
        let item3 = BoxItem(name: "Kibble", categories: [.food], description: "Chicken and pea", isFavorite: false)
        let item4 = BoxItem(name: "Leash", categories: [.training], description: "Training leash", isFavorite: false)

        for _ in 0...5{
            let box = Box(date: Date(), items: [item, item2, item3, item4], imageStr: "shippingbox")
            arrayBoxes.append(box)
        }
    }

```
