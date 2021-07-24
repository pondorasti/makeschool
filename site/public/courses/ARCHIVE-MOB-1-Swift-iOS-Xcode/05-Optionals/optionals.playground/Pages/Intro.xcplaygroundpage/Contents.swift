import Foundation

/*:
 *Optionals* are simply `enum`s that either contain a some value or none:

     enum Optional<T> {
       case none
       case some(T)
     }
 
 However, because they are such an essential construct to Swift as a whole, we get special syntax to access the contents of an `Optional` and to interact with them in general.
 
 
 You can think of an Optional as a box that can hold anything you put in it.
 The box can have items in it, or nothing.
 In the case it has items, we can access the items in the box from the *.some* case in the enum.
 If the box has nothing, we get *.none*
 */

// these two variable definitions are 100% equivalent
let string1: Optional<String> = "hello"
let string2: String? = "hello"

//: Since Optionals are enums, we can switch on the two cases that it has (some and none)
switch string2 {
case .none:
  print("no value contained in string2")
case .some(let number):
  print("string2 contains: \(number)")
}

/*:
 The example above illustrates that we can use regular pattern matching (using a `switch` statement) to figure out whether an `Optional` contains a value or not. However, if we had to do this every time we want to access the value of an `Optional`, this would be very cumbersome. So, Apple introduced the concept of _unwrapping_ to access an `Optional`s value. Unwrapping is just a convenient way to check for the `case` of the type `Optional`.

 There are two basic ways of unwrapping an `Optional`:
 
 1. _Force unwrapping_ using `!`:
  Every time you are doing this, you **must** be 100% sure that the `Optional` contains a value, otherwise the app will **crash** at runtime. **Every time you are using an exclamation mark inside your app to access an `Optional`, you are potentially exposing it to a crash**, and crashes are a really, really bad user experience!
 2. _Optional binding_ using `if let`:
  This is the proper way to check whether an `Optional` contains a value. It is safe as it includes an `if` condition that ensures we are only accessing a value if it is actually there, thus protecting us from accessing `nil` which would cause a crash. Conveniently, it will directly _bind_ the value (if it exists) to the new variable that we declare the binding. Further, the optional binding approach also allows us to write explicit code in an `else` statement to handle the case where no value was contained in the `Optional` after all. See right below for what the syntax for optional binding looks like.
 */

var string3: String? = nil

// optional binding
if let actualString3 = string3 {
  print(actualString3)
}
else {
  print("string3 is nil")
}

/*:
 We can also unwrap an optional value with a *guard* statement
*/

var optionalString: String? = .none
guard let unwrappedString = optionalString else {throw NilError.nothing}

//: Forceful Unwrapping

//print("The string is: \(string3!)") // crashes

/*:
 
 **Note 1**: You will often find that the newly created variable in an `if let`-statement has the same name as the original one. In the above example, the new variable (which is of type `String`, **not** `String?`) is called `actualString3` to make it very explicit that it does contain a value and that it is a different variable than the one before.
 
 
 **Note 2**: Also, consider that `nil` is just syntactic sugar for the  `enum` case `.none`, so any time you are using the `nil` keyword in your app, you can also write `.none`:
*/

string3 = .none // same as: string3 = nil

/*:
 To illustrate how the optional binding actually works, consider the following (somewhat safe) alternative to using optional binding:
*/

// optional binding (almost equivalent to optional binding)
if string3 != nil { // or: if string3 != .none
  let actualString3: String = string3!
  print(actualString3)
}
else {
  print("string3 is nil")
}

/*:
 If you generally struggle to understand how optional bindings work, here are two tips for you:
 1. Use a different variable name for the unwrapped value than for the original optional one (as in the example above).
 2. When you encounter an instance of optional binding in code that you find, rewrite the `if let`-statement by checking for a value (using `!= nil`) and force unwrap it in case the `if` statement succeeds (just as in the code example right above).
*/


/*:
 Sometimes, it can be convenient to tell the compiler that a property of a class is not there at _initialization time_ (i.e. after any initializer was called) but will definitely have a value later on when it is first being used (recall that Swift requires you to initialize all properties of an object when the object gets instantiated). In such a case, where a value for a property can not be specified at initiliazation time but will definitely be there later on when it is needed and first being accessed, we need to declare the property as being `Optional`. However, now, even though we can definitely say that it will have a value when being accessed, we need to adhere to the `Optional` syntax and unwrap the `Optional` every time which causes some syntactical overhead. In these cases, we want to use **Implicitly unwrapped optionals**. This is a way to tell the compiler a variable is `Optional` but still allows us to access it directly without unwrapping. The syntax for implicitly unwrapped optionals is as follows:
 */

var actualString4: String!
//print(actualString4) // crashes

/*:
 *Attention*: Use implicitly unwrapped optionals with great care!!! You have the same issue as with force unwrapping where every time you use this, your app might potentially crash!
*/

//: [Next - Challenges](@next)


// Material below here is to help with this playground


enum NilError: Error {
    case nothing
}
