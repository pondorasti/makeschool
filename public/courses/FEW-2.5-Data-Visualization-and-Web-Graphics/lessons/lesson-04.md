
# FEW 2.5 - Lesson 4 

Sorting data. 

<!-- Put a link to the slides so that students can find them -->

<!-- ➡️ [**Slides**](https://make-school-courses.github.io/FEW-2.5-Data-Visualization-and-Web-Graphics/Slides/Lesson-3.html ':ignore') -->

## Video 

- https://youtu.be/m8K1LxEemG4
- https://youtu.be/CswNWqXgnrE

<!-- > -->

## Overview

Arranging data to make the facts and meanings more visible. 

## Why do you need to know this?

Managing data in arrays is an important skill. The way data is ordered can also reveal hidden meaning. 

## Learning Objectives

- Use Array sort
- Use Array filter
- Apply sort and filter to your visualizations

## Array.sort()

Take a quick look at the documentastion: 

https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/sort

<!-- > -->

- Sorts values in place (doesn't make a copy)
- Sorts values based on String value
- Optional Compare function
    - Takes two params a, b
    - Return value determines how a and b are indexed
    - less than 0 a is indexed lower than b
    - greater than 0 b is indexed lower than a
    - 0 and the index of a and b is unchanged

<!-- > -->

Sort values less than 10 

```JS 
const a = [4,3,1,7,6,2]
a.sort() // [1,2,3,4,6,7]
```

<!-- > -->

Sorting larger numbers

```JS 
const a = [4,13,1,7,6,12]
a.sort() // [1, 12, 13, 4, 6, 7]
```

<!-- > -->

Use a compare function

```JS 
const a = [4,13,1,7,6,12]
a.sort((a, b) => {
  return a - b
}) // [1, 4, 6, 7, 12, 13]
```

<!-- > -->

What about non numeric data?

```JS
const months = ['March', 'Jan', 'Feb', 'Dec'];
months.sort(); // ["Dec", "Feb", "Jan", "March"]
```

<!-- > -->

What about Titanic data?

```js
fields.sort((a, b) => {
    return a.survived === 'Yes' ? -1 : 1
})
```

Sorts survivors first. This example may not make sense without some background. 

Array.sort looks at the two values, `a` and `b` in the example code snippet, and does one of three things: 

- places `a` before `b`
- places `a` after `b`
- does not change the order

If you're sorting something more complex than an array of strings you'll probably need to include a sorting function. Here are a few examples: 

Sort titnaic data on fares. These are numbers so `a - b` is will work: 

```JS
fields.sort((a, b) => {
    return a.fare - b.fare // 
})
```

This would work for other numeric values like age and pclass. 

Without a callback the values are compared numerically. Every character has a numeric value. You can see a few of the value in the list below. The numbers 0 - 9 have values 48 to 57. These come before the uppercase letters A to Z (65 - 96), later are lowercase letters a to z (97 to 122). 

Without a callback Array sort compares these numeric values. This is why 111 and would come before 99. Looking at the first character, 1 has a value of 49 and 9 has a value of 57.

Character codes: 

- `0` : 48 Digits 0 to 9
- `1` : 49
- `2` : 50
- `3` : 51
- `4` : 52
- `5` : 53
- `6` : 54
- `7` : 55
- `8` : 56
- `9` : 57
- ...
- `A` : 65 Uppercase letters A - Z
- `B` : 66
- `C` : 67
- `D` : 68
- ...
- `Z` : 90
- ... 
- `a` : 97 Lowercase letters a - z
- `b` : 98
- `c` : 99
- ...
- `z` : 122

Check the whole list here: https://www.w3schools.com/charsets/ref_html_ascii.asp

What about names? These are all strings but they are on a property. Since uppercase letters have a lower numeric value than lowercase character they will sort first.

```JS 
fields.sort((a, b) => {
  if (a.name < b.name) {
    return -1
  } else if (a.name > b.name) {
    return 1
  }
  return 0
})
```

To make this case insensitive convert the stringds you're comparing to upper or lowercase before comparing them. 

```JS 
fields.sort((a, b) => {
  const aName = a.name.toLowerCase()
  const bName = b.name.toLowerCase()
  if (aName < bName) {
    return -1
  } else if (aName > bName) {
    return 1
  }
  return 0
})
```

Sort is really just comparing each character agains it's number in the list to determine how it is sorted. Numbers are sorted much like you would sort a word by starting with the first character. 

Sort also takes a callback function to determine the sorting order. This callback receives two of the elements from the array. Let's call these a and b. You don't know where in the array they came from. Sort expects the callback to return a number less than 0 if a should come before b, a number greater than 0 if b should be sorted before a, and return 0 if the place of the two elements should not change. 

Try this out in the Repl.it: https://repl.it/join/mnsudqlm-mitchellhudson

<!-- > -->

### Challenges - Array.sort()

- Sort fields on sex
- Sort fields on survived
- Sort fields on embarked

Using this Repl.it: https://repl.it/join/gnjigkyl-mitchellhudson Sort the passenger data. 

Challenges: 

- Set the color of each square based on gender. Then sort the data based on sex. 
- use two colors one for survivors and the other for casualities. Sort on survived. 
- Use three colors one for each of the embarked values. Sort on embarked. 

<!-- .slide: data-background="#087CB8" -->
## BREAK

Take a ten minute break

<!-- > -->

## Array.filter()

Take a look at the doce for array.filter(). 

https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/filter

<!-- > -->

Array.filter() is similar to map() and reduce() it returns a new array. 

Array.filter() takes a filter function. This function receives the element as a parameter and returns true if the element is included or false if not. 

<!-- > -->

```JS 
const a = [4,13,1,7,6,12]
const b = a.filter((val) => val < 5)
// [4,1]
```

<!-- > -->

Using the Titanic data

```JS
const fieldsMen = fields.filter((p) => p.sex === 'male')
const fieldsWomen = fields.filter((p) =>  p.sex === 'female')
```

<!-- > -->

### Array.filter() challenges 

- display only women
- display only men
- display only pclass 1, 2, or 3
- display only the passengers whos embarkation is undefined

<!-- > -->

## Color

Color can be represented in a few ways in JS:

- hex colors: `#0f0` or `#00ff00`
- keyword colors: `red` or `blue`
- rgb: `rgb(0, 255, 0)`
- rgba: `rgba(0, 255, 0, 0.5)`
- hsl: `hsl(120, 50%, 77%)`
- hsla: `hsla(120, 50%, 77%, 0.6)`

In all cases, it comes down to string manipulation. For any color you want to generate, you'll need to generate a string similar to one of the strings above and assign that to a style property.

If you're generating colors in sequence, HSL has the advantage that the hue is separate from the other color components. Hue has a range of 360 degrees.

```JavaScript
// This generates 12 colors equally spaced around the color wheel:
const numberOfColors = 12
const step = 360 / numberOfColors
for (let i = 0; i < numberOfColors; i += 1) {
    const hue = step * i
    const colorString = `hsl(${hue}, 70%, 50%)`
    ...
}
```

Use RGBA or HSLA when you need to transparent colors. The last value is the alpha (transparency) of the color.

<!-- > -->

## Color Activity

For the same Titanic dataset, create a bar graph that shows the number of passengers from each of the 3 `embarked` cities (C = Cherbourg, Q = Queenstown, S = Southampton). Make sure each bar is a different color

<!-- > -->

## After Class

Continue working on the current assignment. 

<!-- 

## Minute-by-Minute

| **Elapsed** | **Time**  | **Activity**              |
| ----------- | --------- | ------------------------- |
| 0:00        | 0:05      | Overview + Learning Outcomes |
| 0:05        | 0:30      | Buttons |
| 0:35        | 0:20      | Colors |
| 0:55        | 0:20      | Motion |
| 1:15        | 0:10      | BREAK |
| 1:25        | 1:15      | Lab |
| 2:40        | 0:05      | Wrap up + Homework Overview |
| TOTAL       | 2:45      | - |

-->