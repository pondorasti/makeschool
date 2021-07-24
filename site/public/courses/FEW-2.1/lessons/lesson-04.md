<!-- .slide: data-background="./Images/header.svg" data-background-repeat="none" data-background-size="40% 40%" data-background-position="center 10%" class="header" -->
# FEW 2.1 - JavaScript Dates

<small style="display:block;text-align:center">Dates and Date Lib</small>

<!-- > -->

Time for another library! This time you'll make a library that works with Dates.

<!-- Put a link to the slides so that students can find them -->
<!-- 
➡️ [**Slides**](/Syllabus-Template/Slides/Lesson1.html ':ignore') -->

➡️ [**Slides**](https://docs.google.com/presentation/d/1zBpVfNByDj5u4Bsg1EtW_zx3qm_6oEm85BStYOyKlDk/edit?usp=sharing ':ignore')

## Video Lessons 

- https://youtu.be/Yo-AKuJ7-fw
- https://youtu.be/DZi7Cdahfzc
- https://youtu.be/UA9p5kvW8rg
- https://youtu.be/1xgbcqUtlk0
- https://youtu.be/a2zzi8wf5YY
- https://youtu.be/obKWiV57zk0
- https://youtu.be/hx64NZYRBjs
- https://youtu.be/Lcl0xb5XaHE
- https://youtu.be/seHP41DsUlU
- https://youtu.be/gbKwrr94rbw
- https://youtu.be/JeIe7hbITEc

Playlist: 

https://www.youtube.com/playlist?list=PLoN_ejT35AEioZ_5TEk0h3LVqzT-EoM2M

<!-- > -->

## Why you should know this?

Practice is the best way to solidify your skills and knowledge.

Working with dates will expand your knowledge of JS. 

<!-- > -->

## Learning Objectives

1. Define the Date Object and its important methods
1. Use the Date Object to generate dates and times, and format dates and times. 
1. Construct methods that build and expand the core functionality of the Date object

<!-- > -->

Open this Repl: https://repl.it/@MitchellHudson/date-object

<!-- > -->

## UTC and JS Date

<!-- > -->

What's a Date? 

<!-- > -->

A date is the day of the month and year specified as a number. 

<!-- > -->

In JS this will also include the year and the time. 

It pinpoints a point in time down to a millisecond as a number. 

<!-- > -->

Dates in JS are represented as the number of milliseconds since 1970

<!-- > -->

**UNIX Epoch**

What is this? Also known as a timestamp. It's a number that represents the number of seconds since **Thursday, 1 January 1970**. The premise is that each day takes 86,400 seconds. 

<!-- > -->

Dates before the epoch can be expressed as a negative number.

<!-- > -->

Are there any weird things about dates in JS?

<!-- > -->

Plenty, just think of leap years?

<!-- > -->

Can you do Math with this stuff? 

<!-- > -->

Yes! The Date Object, like the Number Object, is a wrapper around a primitive value. 

JS will convert a date to a number when needed. 

<!-- > -->

Make a new date with `new Date()` this returns a new date which represents the moment in time when the command was executed. 

```JS 
const a = new Date()
```

Try this in the console: 

```JS
// Make a date object
var a = new Date()
// Make another Date object
var b = new Date()
// Subtract one from the other
b - a // 5009 ms between dates
console.log(a) // Jul 27 3:45 pm ...
```

<!-- > -->

**Internally a Date is a number in Milliseconds**

Try this with your birthday. You can initialize a date with almost any human readable date string. For example: 

```JS 
var age = new Date('9/26/65')
var now = new Date()
console.log(now - age) // 1698830617401
```

<!-- > -->

Challenge: Find the number of:

- seconds
- minutes
- hours
- days 
- years

Since your birthday. 

<!-- > -->

- **Q:** Is the number accurate? 
- **Q:** What's the difference? 
- **Pair up:** and discuss your solutions

<!-- > -->

Initialize a with Year, month, and date. 

```JS 
const newYears = new Date(2020, 0, 1)
// Wed Jan 01 2020 00:00:00 GMT-0800 (PST)
```

Notice the month starts with a 0 index. 

```
0 - Jan
1 - Feb
2 - Mar
3 - April 
4 - May
5 - June 
6 - July 
7 - Aug
8 - Sept
9 - Oct
10 - Nov
11 - Dec
```

<!-- > -->

## Date methods 

The Date object has many instance methods most are getters and setters. There are a few class methods also.

<!-- > -->

### Getters 

These mostly get at components of a date such as a year, month, day, hours, minutes, etc. Some format the date in a variety of ways. 

<!-- > -->

- Date Components 
  - `new Date().getFullYear()  // 2019`
  - `new Date().getMonth()     // 6` July
  - `new Date().getHours()     // 10` 10 AM

<!-- > -->

- Formatted Dates 
  - `new Date().toLocaleString()` 7/27/2019, 10:15:36 AM
  - `new Date().toDateString()` Sat Jul 27 2019

<!-- > -->

### Setters 

Setters change the value of various components of a date. 

<!-- > -->

- `myDate.setMonth(6)` Sets the month to July
  - January === 0

<!-- > -->

- `myDate.setMinutes(30)`

<!-- > -->

_Never mutate source object always make a copy and mutate that to avoid side effects._

```JS
const d = new Date(2019, 0, 10)
const newDate = new Date(d) // Make a new Date from a date
newDate.setMonth(5)

console.log(d) // 10 January 2019
console.log(newDate) // 10 June 2019
``` 

<!-- > -->

### Class Methods 

Date provides a couple of class methods. 

Class methods are methods that are called from the class (class methods are not called from an instance)

<!-- > -->

- `Date.now() // 1564251902406` the ms at the current moment
- `Date.UTC(year, month, day, hour, min, sec, ms)` create date from UTC parameters 
- `Date.parse(string)` creates a date from date string or returns NaN if unable to parse the string. 

<!-- > -->

## Timezones 

- Local time refers to the timezone set on your computer.
- UTC is synonymous with Greenwich Mean Time (GMT) in practice.

By default, almost every date method in JavaScript (except one) gives you a date/time in local time. You only get UTC if you specify UTC.

https://css-tricks.com/everything-you-need-to-know-about-date-in-javascript/

<!-- > -->

## Offset dates

An offset date tells you the time between two dates, the distance to a future or past date. 

<!-- > -->

```JS
const date = new Date() // Get today 7/27 (or any date)
const startDate = new Date(date) // copy the date
const dueDate = new Date(date)   // copy the date

// Start date have been 7 days ago
startDate.setDate(date.getDate() - 7) // 7/20

// Due date is 3 days from now
dueDate.setDate(date.getDate() + 3) // 7/30
```

<!-- > -->

Here is an alternate approach

```JS 
var a = new Date()
var b = new Date(a.getYear(), a.getMonth(), a.getDate() - 7)
var c = new Date(a.getYear(), a.getMonth(), a.getDate() + 3)
```

Here b and c have lost the hours, mins, secs, ms. These could have been included if they were needed. 

<!-- > -->

**Delta/difference in dates**

```JS
a.getDate() - b.getDate() // 7
a - b // 59958877622077
```

<!-- > -->

You can also do the math! 

```JS
const date1 = new Date('7/13/2019');
const date2 = new Date('7/15/2019');
// const diffTime = Math.abs(date2.getTime() - date1.getTime());
const diffTime = date2 - date1;
const diffDays = diffTime / (1000 * 60 * 60 * 24); 
console.log(diffDays);
```

It's probably best to stick with the built-in methods over math. 

<!-- > -->

## Activity 

Pair up, you and your pair will be reponsible for solving the problems from the list below. 

We will spend the first part of the class solving the problems after which each group will present their solutions. 

<!-- > -->

**Problem 1** Schedule future dates

Given a date return a list of dates separated by a time.

Write a function that given a date returns an array of date objects that are offset by a number of days.

For example given a start date of 1/1/2019, repeat count of 4, and an interval of 3 days.

`consecutiveDates(new Date(2019, 0, 1), 4, 3) `

<!-- > -->

Outputs an array of dates: 

1. 1/1/2019
2. 1/4/2019
3. 1/7/2019
4. 1/10/2019

```JS 
function consecutiveDates(startDate, repeatCount, daysOffset) {
  // 
}
```

<!-- > -->

Expand the idea above by supplying an option that sets the unit of time for the offset. Support offset units of: 

- year
- month
- day

`consecutiveDates(new Date(2019, 0, 1), 3, 1, 'year')`

<!-- > -->

Outputs an array dates: 

1. 1/1/2019
2. 1/1/2020
3. 1/1/2021

```JS 
function consecutiveDates(startDate, repeatCount, offset, offsetUnit = 'day') {
  // 
}
```

<!-- > -->

**Problem 2** Measure execution time

_Using `Date`_ calculate the number of milliseconds used to execute. 

Use a loop that executes a number of times.

```JS
function wasteTime(n) {
  let widget = 0
  for (let i = 0; i < n; i += 1) {
    widget += Math.atan(Math.random() / Math.PI)
  }
}
```

<!-- > -->

Stretch make this a generic method that could be included in an project to measure the execution time of any method. 

<!-- > -->

**Problem 3** Order dates

Given an array of dates return an ordered array of dates. 

```JS 
function orderDates(dates) {
  // orders the dates 
  // returns a new array of ordered dates
}
```

<!-- > -->

Stretch: Return an object containing three keys each holding an array of dates. The keys are: 

- past: array of dates that happened before today
- present: all dates that happen today
- furture: all of the dates that will occur in the future

<!-- > -->

**Problem 4** What's next?

Given an array of dates find the date that will happen next. You need to find the date that is closest to now but not before. 

**Problem 5** When's your birthday?

Birthday planner. Write a function that takes a date (your birthday) and a year, and returns the day of the week for that date in that year. 

For example: 

```JS
new Date(2020, 8, 26).getDay() // 6 - Lucky me my birthday is Saturday!
```

<!-- > -->

## Show your solutions

Your group shows their solutions for the problems. 

<!-- > -->

### Homework

[Assignment 7 - Date Lib](../assignments/assignment-07.md)

<!-- > -->

## Wrap Up

- Review Dates
- Review challenges 
- Review Homework

<!-- > -->

## Additional Resources

1. https://javascript.info/rest-parameters-spread-operator
1. https://javascript.info/date
1. https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/Global_Objects/Date
1. https://javascript.info/object-toprimitive

<!-- > -->

## Minute-by-Minute [OPTIONAL]

| **Elapsed** | **Time**  | **Activity**              |
| ----------- | --------- | ------------------------- |
| 0:00        | 0:05      | Objectives                |
| 0:05        | 0:15      | Overview                  |
| 0:20        | 0:30      | In Class Activity I       |
| 0:50        | 0:10      | BREAK                     |
| 1:00        | 0:45      | In Class Activity II      |
| 1:45        | 0:05      | Wrap up review objectives |
| TOTAL       | 1:50      | -                         |
