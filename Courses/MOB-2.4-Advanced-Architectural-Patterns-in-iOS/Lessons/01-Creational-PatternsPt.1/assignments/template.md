## Object Template

### In Pairs

The following code sets up an array of tuples each representing a specific product:

```swift
var products = [
   (“Kayak”, “A boat for one person”, 275.0, 10),
   (“Lifejacket”, “Protective and fashionable”, 48.95, 14),
   (“Soccer Ball”, “FIFA-approved size and weight”, 19.5, 32)]

func calculateTax(product:(String, String, Double, Int)) -> Double {
   return product.2 * 0.2;
}

func calculateStockValue(tuples:[(String, String, Double, Int)]) -> Double {
   return tuples.reduce(0, {
       (total, product) -> Double in
       return total + (product.2 * Double(product.3))
   });
}

print(“Sales tax for Kayak: $\(calculateTax(product: products[0]))“)
print(“Total value of stock: $\(calculateStockValue(tuples: products))“)
```

**Q:** If we remove an element from each of the tuples, how will that effect the rest of the code?

**TODOs:**

1. Have one person validate the code by running it in a playground just as it is.
2. For each of the tuples in the array, remove the second element - the element which describes the product - so that your array now looks like this:

```swift
var products = [
   (“Kayak”, 275.0, 10),
   (“Lifejacket”, 48.95, 14),
   (“Soccer Ball”, 19.5, 32)]
```

3. Analyze and discuss with your partner the various places in the code which must now be rewritten to accommodate this change to the product tuples.
- Also discuss what this reveals regarding the impact of tuples on extending and maintaining code.

4. Now, validate your analysis by applying your proposed fixes to the code in the playground (each person should do this separately in their own playground)
