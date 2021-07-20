
# Challenge 1

1. Write the enum BobaTea
2. Write a structure called Order that will represent a client’s order. It will need two properties:

- name of type String
- boba of type BobaTea

```swift
struct BobaTea {
  var tea: String
  let sweetness: Int
  let hasBoba: Bool
}

struct Order {
  var boba: BobaTea
  let name: String
}

```

# Challenge 2
1. Write a function that given input parameters returns an order of type Order (the enum you created before is new type!).
2. Then create an order using the function.
3. Then print it’s details.

This is how I should be able to call your function:
`let newOrder = createOrder(withTea: "black", sweetness: 25, forCustomer: "Adriana", includeBoba: true)`

and this is what you’ll print in the end:
`Adriana ordered black boba tea, 25% sweetness, with boba`

```swift
struct BobaTea {
  var tea: String
  let sweetness: Int
  let hasBoba: Bool
}

struct Order {
  var boba: BobaTea
  let name: String
}

func createOrder(withTea tea: String, sweetness level:Int, forCustomer name: String, includeBoba hasBoba: Bool) -> Order{
    let boba = BobaTea(tea: tea, sweetness: level, hasBoba: hasBoba)
    let order = Order(boba: boba, name: name)
    return order
}

let newOrder = createOrder(withTea: "black", sweetness: 25, forCustomer: "Adriana", includeBoba: true)

print("\(newOrder.name) ordered \(newOrder.boba.tea) boba tea, \(newOrder.boba.sweetness)% sweetness, \(newOrder.boba.hasBoba ? "with boba" : "no boba")")
```


# Challenge 3

Improvement with method inside the struct

```swift
struct BobaTea {
  var tea: String
  let sweetness: Int
  let hasBoba: Bool
}

struct Order {
  var boba: BobaTea
  let name: String

  func printDescription(){
    print("\(name) ordered \(boba.tea) boba tea, \(boba.sweetness)% sweetness, \(boba.hasBoba ? "with boba" : "no boba")")
  }
}

func createOrder(withTea tea: String, sweetness level:Int, forCustomer name: String, includeBoba hasBoba: Bool) -> Order{
    let boba = BobaTea(tea: tea, sweetness: level, hasBoba: hasBoba)
    let order = Order(boba: boba, name: name)
    return order
}

let newOrder = createOrder(withTea: "black", sweetness: 25, forCustomer: "Adriana", includeBoba: true)
newOrder.printDescription()
```


# Challenge 4

1. Add the class Customer and refactor your code to use it
2. Using a class to represent the customer, instead of just using a String for the name.

```swift
struct BobaTea {
  var tea: String
  let sweetness: Int
  let hasBoba: Bool
}

struct Order {
  var boba: BobaTea
  let customer: Customer

  func printDescription(){
    print("\(customer.firstName) ordered \(boba.tea) boba tea, \(boba.sweetness)% sweetness, \(boba.hasBoba ? "with boba" : "no boba")")
  }
}

class Customer {
  var firstName: String
  var lastName: String

  init(firstName: String, lastName: String) {
    self.firstName = firstName
    self.lastName = lastName
  }
}

func createOrder(withTea tea: String, sweetness level:Int, forCustomer customer: Customer, includeBoba hasBoba: Bool) -> Order{
    let boba = BobaTea(tea: tea, sweetness: level, hasBoba: hasBoba)
    let order = Order(boba: boba, customer: customer)
    return order
}

let newcustomer = Customer(firstName: "Monica", lastName: "Geller")
let newOrder = createOrder(withTea: "black", sweetness: 25, forCustomer: newcustomer, includeBoba: true)
newOrder.printDescription()
```

# Challenge 5

Finish the implementation of the Boba Tea shop.

1. Use enums to represent the tea types
2. Add an option to customize milk too: whole, almond, oat
3. Include the `makeOrder` to practice using associated values
4. Experiment, break things 🤓

```swift
struct BobaTea {
  var tea: TeaType
  let sweetness: Int
  let hasBoba: Bool
  let milkOption: MilkOption
}

struct Order {
  var boba: BobaTea
  let customer: Customer

  func printDescription(){
    print("\(customer.firstName) ordered \(boba.tea) boba tea, \(boba.sweetness)% sweetness, \(boba.hasBoba ? "with boba" : "no boba") and \(boba.milkOption) milk")
  }
}

class Customer {
  var firstName: String
  var lastName: String

  init(firstName: String, lastName: String) {
    self.firstName = firstName
    self.lastName = lastName
  }
}

enum TeaType : String{
    case black = "black"
    case oolong = "oolong"
    case lavender = "lavender"
    case chai = "chai"
}

enum MilkOption : Int{
    case oat
    case whole
    case almond
}

enum OrderFullfilment {
  case success(message: String)
  case error(message: String)
}

func createOrder(withTea tea: TeaType, sweetness level:Int, forCustomer customer: Customer, includeBoba hasBoba: Bool, withMilk milk: MilkOption) -> Order{
    let boba = BobaTea(tea: tea, sweetness: level, hasBoba: hasBoba, milkOption: milk)
    let order = Order(boba: boba, customer: customer)
    return order
}

func makeOrder(order: Order) -> OrderFullfilment {
    let date = Date()
    let calendar = Calendar.current
    let hour = calendar.component(.hour, from: date)
    if hour < 17 && hour > 9{
        return .success(message: "You can pick up your order in 30 min")
    }else{
        return .error(message: "We are closed, try tomorrow")
    }
}

let newcustomer = Customer(firstName: "Monica", lastName: "Geller")

if let tea = TeaType.init(rawValue: "black"), let milk = MilkOption.init(rawValue: 0){
    let newOrder = createOrder(withTea: tea, sweetness: 25, forCustomer: newcustomer, includeBoba: true, withMilk: milk)
    newOrder.printDescription()

    let orderResult = makeOrder(order: newOrder)

    switch orderResult {
    case .success(let message):
      print("Order result: \(message)")
    case .error(let message):
      print("Order result: \(message)")
    }
}
```
