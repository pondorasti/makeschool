## In Class Activity I

### Test No. 1

Sometimes we need to test things that are part of processing data (business logic, persistence, networking, etc.)

Test the following method:

```Swift
func vowelsInAString(string: String) -> Int {
       let vowels: [Character] = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
       var numberOfVowels = 0
       for character in string {
           if vowels.contains(character) {
               numberOfVowels +=  1
           }
       }
       return numberOfVowels
   }
```

Add the method to you view controller and then write a test for it.

### Test No. 2

We want to have a function that given a title, it formats it to have each word capitalized to become a title.

```Swift
func makeTitle(string: String) -> String {
    let words = string.components(separatedBy: " ")

    var headline = ""
    for var word in words {
        let firstCharacter = word.remove(at:word.startIndex)
        headline += "\(String(firstCharacter).uppercased())\(word) "
    }

    headline.remove(at:headline.endIndex)
    return headline.dropLast()
}
```

Write a test to make sure this works.
