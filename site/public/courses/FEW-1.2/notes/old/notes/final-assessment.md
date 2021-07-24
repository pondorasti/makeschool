# FEW 1.2 Final Assessment 

Your fianl assignment will be turned in as a single HTML file. Create a new text file and add a `<script></script>` tag and put your answers to the questions below in the script tag. 

Don't push this to GitHub. 

## Question 1 - Define Task properties (10pts)

Define a class object that represents a Task. It should have the following properties: 

- `title`: String
- `isComplete`: Boolean
- `date`: Date

The `isComplete` property should have a default value of `false`. 

The `date` property should have the valeu of a JS Date Object. Make a new date with `new Date()`. You can make a specific date by passing a string with a reasonably formatted date. For example: 

- `new Date('Nov 17 2019')` Makes a date object for Nov 2019
- `new Date('9/26/1965')` Makes a date object for Sept 26 1965 
- `new Date()` with no parameter you get todays date

The `date` property should be assigned a default value of the current Date you can do this by making a new date with `new Date()`.

Test your work by defining a new task: 

```JavaScript
const myTask = new Task('complete question 1', true)
console.log(myTask)
```

## Question 2 - Define Task.formattedDate() (10pts)

Add a new method to the Task Class that will format the date to something short and human readable. Call the new method: `formattedDate()`. 

Hint: use `Date.toString()` to easily convert a date to a string.

This new method should return a formatted date. 

To format a date object call the `toDateString()` method on that object. 

https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/toDateString

Test your work by logging the date of your task to the console. 

```JavaScript
console.log(myTask.formattedDate()) // should show todays date
```

### Extra credit - (2pts)

Use `toLocaleDateString()` to format the date for english US. 

https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/toLocaleDateString

## Question 3 - Define Task.completed() (10pts)

Add another method, `completed()` that displays the `isComplete` property, which is a Boolean as a human readable string. It should return "completed" when `isComplete` is true and "not completed" when `isComplete` is false. 

This method should return a string.

For example: 

```JavaScript
const feedCat = new Task('Feed socks')
feedCat.completed() // not completed
```

Test your work: 

```JavaScript
console.log(myTask.complete()) // completed
```

## Question 4 - Define Task.toString() (10pts)

Add a new method to the Task class called `toString()`. The `toString()` method should return a string that describes the Task. The return string should read: 

`"<title> | <formattedDate> | <completed>"`
	
For example calling `toString()` on a task might return the following string: 

"Feed socks | Jul 28 1993 | not complete"

Test your work: 

```JavaScript
console.log(myTask.toString()) // complete question 1 | Thu Mar 07 2019 | completed 
```

## Question 5 - Define TaskList (10pts)

Your next job is to write a class that will manage an array of Tasks, call this new class: TaskList. TaskList should define a property: `tasks`, which will hold an array of Tasks. 

- `tasks`: Array

You only need to deifne this property at this step. 

## Question 6 - Define TaskList.addTask() (10pts)

Add a method to TaskList that adds tasks to the list. Call the new method: `addTask()`. This method should create a new task and add it to the tasks array. 

The method must accept the title, date, and isCompleted params. 

Test your work: 

```JavaScript
const myTaskList = new TaskList()
myTaskList.addTask('Question 6', true)
console.log(myTaskList.tasks) // Something like: [{ Task }]
```

## Question 7 - Define TaskList.showTasks() (10pts)

The TaskList needs a method to display the list of tasks.  `showTasks()`. This method should loop through the array of tasks and call `toString()` on each task in the list and print the returned string to the console. 

Test your work:

```JavaScript
myTaskList.showTasks() // Question 6 | Thu Mar 07 2019 | completed 
```

## Question 8 - Adding some Tasks (10pts)

Use the code below to add some tasks to your TaskList. Copy and paste this into the top your document. 

Notice some of the sample data is missing dates or isCompleted properties. Your code should handle these situations with default values when they occur. 

```JavaScript
const taskData = [
	{ title: 'Feed cat', date: '11/17/19' },
	{ title: 'Call mom' },
	{ title: 'Practice JS', isCompleted: false },
	{ title: 'Bake Cake', date: '3/3/19', isCompleted: true }
]
```

Write a loop that will add all the objects in the array to the the Task List by calling `addTask()` for each. 

## Question 9 - Display Tasks (10pts)

Call `showTasks()` on your task list to display all of the tasks. The tasks should display in the console something like: 

```
Feed cat | Nov 17 2019 | not complete 
Call mom | Mar 4 2019 | not complete
Practice JS | Mar 4 2019 | not complete
Bake Cake | Mar 3 2019 | completed
```

## Question 10 - Show completed/not completed tasks (10pts)

Add a method `showCompleted(completion)` this method takes a boolean `completion`, when true it displays all of the completed tasks, false and it shows the not completed tasks. The method should loop through the list and call `toString()` on each task that matches the completion param. 

Bonus: Give completion a default value of true so it shows all completed tasks when the paramter is not present. 

Call the method so it prints the a list of completed tasks. 

Call the method with `showCompleted(false)` to show the tasks that have not been completed. 

# Total 100pts

## Extra Credit (0 - 30pts)

Build a user interface with HTML that allows me to do the following: 

- add a new task to the list
- show all tasks in the list
- show completed tasks
- show not completed tasks 
- mark a task as completed
- remove a task from the list