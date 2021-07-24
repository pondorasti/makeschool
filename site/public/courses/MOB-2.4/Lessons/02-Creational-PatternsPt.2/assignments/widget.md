```swift
// Builder Pattern example

// 1. Declare the construction steps common to all intended optional object representations.
class WidgetFactory {
   var parts: String = “”
}

// 2. Declare a concrete builder class for each of the object representations.
class Builder {
   let widgetFactory = WidgetFactory()
   var part = 0
   func buildPart() {
       part += 1
       widgetFactory.parts = widgetFactory.parts + ” adding part #\(part)”
   }

   func getResult() -> WidgetFactory{
       return widgetFactory
   }
}

   // 3. Create a director class
   class Director {
       let builder = Builder()
       func construct() -> WidgetFactory {
           for _ in 1...5 {
               builder.buildPart()
           }
           return builder.getResult()
       }
}
// 4. Create builder and director objects
let director = Director()
let widget = director.construct()

// 5. Return the constructed result
print(widget.parts) // prints: adding part #1 adding part #2 adding part #3 adding part #4 adding part #5
```
