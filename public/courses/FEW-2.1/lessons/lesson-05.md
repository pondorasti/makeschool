<!-- .slide: data-background="./Images/header.svg" data-background-repeat="none" data-background-size="40% 40%" data-background-position="center 10%" class="header" -->
# FEW 2.1 - Date Lab

<small style="display:block;text-align:center">API Libraries</small>

<!-- Put a link to the slides so that students can find them -->

<!-- ➡️ [**Slides**](/Syllabus-Template/Slides/Lesson1.html ':ignore') -->

<!-- > -->

## Why you should know this or industry application (optional) (5 min)

Dates are important they appear in one form or another in almost every application you might create and they are a core part of programming. 

<!-- > -->

## Learning Objectives (5 min)

1. Identify the components of a problem
1. Prioritize the steps to solutions
1. Writing psuedo code

<!-- > -->

## Date review

- What is a date?
- What is the Unix Epoch?
- What is UTC? 
- What is minimum unit of time in a JS Date?
- Which of these is correct?	
	- `new Date()`
	- `new Date(0)`
	- `new Date('9/26/65')`
	- `new Date(1983, 09, 31)`

<!-- > -->

## Data Library

<!-- > -->

## Getters and setters

Getters and Setters are class methods that act like properties. Using a getter/setter outside of a class it looks like a property. Using a getter/setter inside the class it looks like a method. 

<!-- > -->

Precede the method definition with the keyword `get` or `set`.

<!-- > -->

```JS
class Example {
	get something() {
		return this._name
	}
	set something(name) {
		this._name = name
	}
}
```

A getter must return a value. Getters can not accept parameters!

<!-- > -->

Create a getter and setter for the `year`. 

You need a short year also. Create a getter for `yr`. This should return the two digit year. Use `%` to get this: 

```js
1983 % 100 = 83
```
<!-- > -->

```JS 
class D {
	...
	constructor() {
		this._day = 0
	}

	// Getters can only return a value, they can not take parameters
	get year() {
		return this._date.getFullYear()
	}
}

const date = new D() 
console.log( date.day ) // 88 
console.log( date.year ) // call the getter
```

<!-- > -->

Setters must accept a single parameter. A setter can not return anything:

<!-- > -->

```JS 
class D {
	...
	// Setters must take only a single parameter, and can not return anything.
	set year(n) {
		// ...is n a number?
		this._date.setFullYear(n)
	}
}

const date = new D() 
date.x = "99" // Not calling a function
date.year = 1975 // calls a function
```

Now make a getter for `month` and `mon`. The first should return the full month for example: `January` the other should return the short month: `Jan`

Since `getMonth()` returns the index of the month you'll need the months spelled:

```JS
const months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']
const monthsShort = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
const days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
const daysShort = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
```

<!-- > -->

## Date format

You're date lib really needs a good formatter. The format function will use the idea of a 'mask'. The mask is a string that describes the date. Your format function will replace special characters with components of the date. See the homework description for more details. 

<!-- > -->

The general solution is to create a string by looping over each character in the mask string. With each iteration look at the current character or the mask string if it matches one of the special characters append the date component otherwise append the character. 

<!-- > -->

For example, image the mask string is: 'y/m/d'

```JS
const d = new D()
d.format('y/m/d') // 20/Nov/10
d.format('M d, Y') // January 10, 2021
```

1. 'y' -> replace with the short year '20'
2. '/' -> not special append it '20/'
3. 'm' -> replace with the short month '20/Nov'
4. '/' -> not special append it '20/Nov/'
5. 'd' -> replace with the date '20/Nov/10'

Use the helper methods you created earlier rather than reproducing code that generates the short year etc. 

Your function should take in a formatting string. 

```JS
class D {
	...
	format(str) {
		...
	}
}
```

Psuedo code: 

- Define a variable to hold the ouput string. This should start as an empty string.
- Loop over each character in your format string.
- If the character matches one of the formatting characters: `y, Y, m, M, d, D, ...` append the date element to the output string. If there's no match append that cahracter to the output string. `if else` or `switch case` will work here. 
- Return the output string.

<!-- > -->

Define your method. Takes the mask string as a parameter. Define the output string. 

```JS
	format(mask = '') {
		let dateStr = ''
		// ...
		return dateStr
	}
```

<!-- > -->

Loop over each character inb the format string: 

```JS
	format(mask = '') {
		let dateStr = ''

		// loops for once for each character in mask
		for (let i = 0; i < mask.length; i += 1) {
			
		}

		return dateStr
	}
```

<!-- > -->

Check for special characters. One strategy is to use an object:

```JS
// Define an object
const special = {
	Y: this.year, // gets the full year from your class
	y: this.yr    // gets the short year from your class
	...
}

special['Y'] // 2021
special['y'] // 21
special['?'] // undefined
```

<!-- > -->

Use a conditional statement to get a date valeu or use the character: 

```JS
if (special[mask[i]] !== undefined) {
	dateStr += special[mask[i]]
} else {
	dateStr += mask[i]
}
```

<!-- > -->

## when() method 

The when method will require you to look at a date and provide a human readable string describing relative time between dates. It should return something like: '1 year ago' or 'three weeks from now'. 

To do this you'll need to calculate the difference between two dates. You need the difference in years, months, and days. This way you can ask:

- Is the difference in months greater than 11 if so this date is years ago.
- Is the difference in days more than 30 if so the date is months ago.
- Is the difference in days more than 1 than the date is days ago.

Psuedo code: 

- Make a new date that is the current date
- Get the differnce between the two dates in...
	- years
	- months
	- days
- Check the differences: 
	- diff months > 11 the date was years ago
	- diff months < -11 is years from now
	- diff days > 30 the date was months from ago
	- diff days < -30 the date is months from now 
	- diff days > 0 the date was days ago
	- diff days < 0 the date is days from now

Here are a few things to think about: 

Consider: Dec 23, 2020 and Jan 1, 2021 are these dates 1 year apart? One month apart? Or just 9 days? It doesn't like a year, it could be a month, 9 days does feel pretty accurate. The correct answer may depend on your industry or business. You should decide which is correct and keep the answer in mind as you work. Potential ouput might be: 

- 1 year ago
- 1 month ago
- 9 days ago

Considering the output above, when the number of years, months, days, difference is 1 the output should read: 

- n year ago
- n month ago
- n day ago

When the difference is greater than 1 the output should read: 

- n years ago
- n months ago
- n days ago

When you subtract the date in question from now if the answer is positive the that date is in the past. If the number is negative the date is in the future. This means your output should read (past dates): 

- n year/s ago
- n month/s ago
- n day/s ago

Or (for future dates)

- n year/s from now
- n month/s from now
- n day/s from now

Create a date for now: 

```JS
class D {
	...
	when() {
		// Create a new date
		const now = new Date()
		...
	}
}
```

You can use these same ideas to calculate the difference in months and days. 

Once you've got the differnece you can start putting together the relative date string. 

The best tactic to is to calculate the difference in months. From here you can check if the total months is more than 12 and reply with "years ago." If the total months is less than 12 you can reply with "months ago." 

Here is a rough idea of calculating the difference in months. 

```JS
const a = new Date(2019, 8, 26)
const b = new Date()
const dy = (b.getFullYear() - a.getFullYear())
const dm = b.getMonth() - a.getMonth()
const totalmonths = dy * 12 + dm

console.log(dy, dm) // 1 year, 2 months
console.log(totalmonths) // 14 months
```

Note! Here the possible values for months would be 0 (Jan) to 11 (Dec). That means the difference in months between Feb (1) 6 2021 and Dec (11) 23 2020 would be -10 (1 - 11) while the difference in years would be 1 (2021 - 2020).

To get a real count of the of the months add 12 times the difference in years.

```JS
const totalmonths = dy * 12 + dm
```

You can calculate the total days between two dates like this: 

```JS
// 86400 = 60 * 60 * 24
const dd = (b - a) / 86400 / 1000
console.log(dd)
```

Get the difference between the dates and divide by one day or 86400 seconds then divide by milliseconds. 

Using this method you'll have the number of days difference. With this you can ask questions like: 

- Are days difference greater than 365.25?
- Are days difference greater than 30?
- Are days difference greater than 7?

Note! This method might miss a leap year since a year is technically 365.25 days in length. It also misses months with fewer or greater than 30 days which may or may not be noticed as a discrepency by picky horologists. 

### Forming the output sentence

Here is an approach you might use. 

Use `Math.abs()` to get the absolute value. You'll need this since you won't want to print `-6 days ago`, `Math.abs(-6)` = 6. 

`Math.abs(daysDifference) < 7` would be true if `daysDifference` were -6 or +6.

You can use ternary operator to decide when to add an 's'. For example: 

```js
const dd = -4
// if the absolute value of `dd` is greater than 1 we add an s after day
console.log(`${Math.abs(dd)} day${Math.abs(dd) > 1 ? 's' : ''}`)
```

Here is more of a solution: 

```JS
// Check if absolute number of days is less than 7 
if (Math.abs(dd) < 7) {
	//           `${number} day${s?} ${ago or from now}`
	//             6 days ago
	return `${Math.abs(dd)} day${Math.abs(dd) > 1 ? 's' : ''} ${dd < 0 ? 'ago' : 'from now'}` )
} else if (Math.abs(dw) < 4) {
	return `${Math.abs(dw)} week${Math.abs(dw) > 1 ? 's' : ''} ${dw < 0 ? 'ago' : 'from now'}`)
} else if (...) {
	...
}  
```

## After class 

Continue the current assignment.

[Assignment 7 - Date Lib](../assignments/assignment-07.md)
