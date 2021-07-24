//: Playground - noun: a place where people can play


// MARK: Enums with raw values

enum Direction: String {
  case north = "↑"
  case south = "↓"
  case east = "→"
  case west = "←"
}

enum Weekday: Int {
  case monday
  case tuesday
  case wednesday
  case thursday
  case friday
  case saturday
  case sunday
}


// MARK: Enums with associated values

class GroceryItem {
  let name: String
  
  init(name: String) {
    self.name = name
  }
}

enum GroceryBag {
  case empty
  case hasGroceryItems([GroceryItem])
}
