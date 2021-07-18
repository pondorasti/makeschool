
/*:
 Enumerations (`enum`s) are a very powerful and useful construct in the `Swift` language. They help you to express the _semantics_ of your code very explicitly and let the compiler help you to enforce them.
 
 Generally, `enum`s are a way to model a type that can only contain a limited range of values. Let's step back and consider for a second what that means. A _type_ in a programming language describes a range of _values_. Let's consider a few examples:
 
 The type `Bool` that you all know has 2 different values, namely `true` and `false`. `UInt8` in Swift has as values all _unsigned integers_ that can be created out of 8 bits, more precisely, the range of values will be all integers from 0 to 255 (because 8 ones and zeros can create 256 (= 2^8) combinations).
 
 The type `String` in Swift describes all possible sequences of characters, so it has an _infinite_ range.
 
 A custom type `Person` that looks like this
 ```
 struct Person {
 let name: String
 }
 ```
 can describe any person with any `name` (which is a `String`, so again we will have an infinite range of values for the type `Person`).
 
 So, `enum`s work particularly well whenever we want to model a type of which we know that it has a limited amount of values and we want to express this in our code.
 */

// bad model: name could be any string and the compiler can't know help us identfying invalid ones
//struct FirstQuarterTechnicalCourse {
//  let name: String
//}

// better model: we have exactly 5 Coursees in the first quarter that are known upfront; now the compiler will only allow valid coursees to be created
enum FirstQuarterTechnicalCourse {
    case python
    case frontend
    case ruby
    case iosAdvanced
    case iosAccelerated
}

// creating enum values requires an explicit type annonation of the enum's type
let course1 = FirstQuarterTechnicalCourse.python
let course2: FirstQuarterTechnicalCourse = .frontend
//var w3 = .ruby // doesn't work because the compiler doesn't know the enum type

// you can do regular comparisons with enums using if:
if course1 == course2 {
    print("these two are the same")
}
else {
    print("these two are different")
}

// but what's even better to use a switch statement and do pattern matching:
func getCourseName(course: FirstQuarterTechnicalCourse) -> String {
    var courseName: String
    switch course {
    case .python: courseName = "Back-end Web: API Services with Python & Flask"
    case .frontend: courseName = "Front-end Web: Interactive Websites with JavaScript"
    case .ruby: courseName = "Full-stack development with Ruby"
    case .iosAdvanced: courseName = "Advanced Topics in iOS & Swift"
    case .iosAccelerated: courseName = "Mobile Apps with iOS & Swift"
    }
    return courseName
}

let courseNameForCourse1 = getCourseName(course: course1)
print("The course is called: \(courseNameForCourse1)")

// switch statements can also bundle multiple cases
func getCourseType(course: FirstQuarterTechnicalCourse) -> String {
    var courseType: String
    switch course {
    case .python, .frontend, .ruby: courseType = "Web"
    case .iosAccelerated, .iosAdvanced: courseType = "Mobile"
    }
    return courseType
}
let courseTypeForCourse1 = getCourseType(course: course1)
print("The course is of type: \(courseTypeForCourse1)")

func isMobileCourse(course: FirstQuarterTechnicalCourse) -> Bool {
    switch course {
    case .iosAdvanced, .iosAccelerated: return true
    default: return false
    }
}

let isMobile = isMobileCourse(course: course1)
print("The course is a mobile course: \(isMobile)")


/*:
 ### Challenges
 
 1.
 a. Model a type called `Weekday` that represents the different days of the week.
 
 b. Write a function called `getWeekdayName` that takes a `Weekday` returns the name of each weekday as a `String`, e.g.: `"This weekday is called Sunday."`
 
 c. Write a function called `isItFinallyWeekend` that takes a `Weekday` and returns a `String` indicating whether the argument is a weekend weekday, e.g.: `"Monday is a regular workday."` or `"Wuhuuuu, it's SATURDAYYYYYYYY."`
 
 */


//: [Next](@next)
