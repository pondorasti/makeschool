/*:
## Dance School
 
 To set BoogieBot up to get ready to dance, use this line of code:
 */
startBot()
/*:
 BoogieBot can do these moves:
- `leftArmUp()`, `leftArmDown()`, `rightArmUp()`, `rightArmDown()`
- `leftLegUp()`, `leftLegDown()`, `rightLegUp()`, `rightLegDown()`
- `shakeItLeft()`, `shakeItRight()`, `shakeItCenter()`
- `jumpUp()`, `jumpDown()`
- `fabulize()`, `defabulize()`
 
 The moves should all be pretty clear, except `fabulize()` and `defabulize()`. The first move changes BoogieBot into fabulous new colors; the second changes BoogieBot back to a dull robot gray.
 
 You tell BoogieBot to move like this:

```
fabulize()
shakeItLeft()
shakeItRight()
shakeItCenter()
```

 Once BoogieBot gets to the end of the routine, it will stop. You can use Editor > Run Playground to see the moves again. Changing the routine itself will start things over.
 */
leftArmUp()
fabulize()
fabulize()
fabulize()
fabulize()

rightArmUp()

leftLegUp()
rightLegUp()
leftLegDown()
rightLegDown()
shakeItLeft()
shakeItRight()
shakeItCenter()
jumpUp()
jumpDown()

leftArmDown()
rightArmDown()
defabulize()

/*:
 - Experiment: Rearrange the lines of code above to remix the dance routine. BoogieBot performs the moves in the order they appear in the playground.\
What happens if you fabulize or defabulize in the middle of a dance routine?

Where do these dance functions come from? Find out on the next page.

[Previous](@previous)  |  page 3 of 9  |  [Next: APIs](@next)
 */
