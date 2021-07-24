# Class 8 Challenges

Your new start up is doing great you've managed to amass one
thousand users so far! You've been tasked with creating a 
dashboard that displays all of the users. 

Each user has the following information:

- id: A number that is unique to that user
- prefix: A prefix that appears before a users name
- first_name: The user's first name
- last_name: The user's last name
- email: The user's email
- rating: A rating that user has earned using the system
- high_score: The users current highest score as a number
- date: An SQL date, indicted when the user joined
- image: A small, 50x50, avatar image

The user data is stored in data.js. It's been assigned to a 
global variable: `data`. Consider this like data received from 
an API in JSON format. 

Your job is to put the data in a better format and then display 
the data in a page. 

## Challenges 

### Challenge 1: Understanding data

The first challenge is to understand the data. While this won't 
put anything on the screen it will give a picture of what you are
working with and how to access it. 

1. Examine the data in data.js
  - Identify the structure, an array of objects
  - Identify the properties of the objects and key names
  - Notice date is a timestamp, it is also a number and a string
  
### Challenge 2: Loop and test

The sample code provided, in main.js, prints the first name of 
every user to the console. Modify the code to format and print
the prefx first and last names to the console. 

From here you can start thinking about how you are going to get
all of this to display in the browser. 

### Challenge 3: Display it in the browser

Display the list of user names to the browser. First think of an 
HTML structure that you want to use for each user. Next identify 
where the content for each user will go. 

For example: You might use a definition list `<dl>` with the name
in the defintion title `<dt>` and other info in the definition
`<dd>`. 

```
<dt>Ms Sol Antonias</dt>
<dd>
  <span>santonias0@51.la</span> 
  Joined: <span>2016-10-26 01:11:53</span>
</dd>
```

Identify where the data will go

```
<dt>prefix first_name last_name</dt>
<dd>
  <span>email</span> 
  Joined: <span>date</span>
</dd>
```

Insert user data into this string with the string template 
literal. https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Template_literals

Something like this: 

```
str += `<dt>${data[0].prefix} ${data[0].first_name} ${data[0].last_name}</dt>
<dd>
  <span>${data[0].email}</span> 
  Joined: <span>${data[0].date}</span>
</dd>`
```

Loop through the data appending your HTML snippet to a another string. When the
loop is finished set the user data as the content for a DOM element with 
`innerHTML`.
  
### Challenge 4: Working with the date

Your next goal is to create a human readble date in a nice format. 

The date is provided as SQL date time. You would prefer this as a JavaScript 
Date Object. The JavaScript Date Object has many methods and properties that 
will make it possible to display the date different ways. 

Currently the date provided looks like this: `2016-10-26 01:11:53`. 

Lucky for you the JS Date Object will automatically convert this format 
into a valid date. Make a new Date like this: 

`const date = new Date(data[0].date);`

To get a human readable date in a nice format you can use: 

`date.toDateString()`

The Date Object has many properties and methods that allow you to format 
dates and times in any way you can think of. Read more about JS Date here: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date

### Challenge 5: Display all the data for every user

Modify your template string so that all of the user data is displayed for each 
user. 

You may want to include tags around various elements and class names to 
identify element for style that will come in the future. 

The img is a url string that points to an avatar image file. This will 
have to be set as the `src` attribute for an `<img>` tag. 

Read the notes below and address each. 

- id: Don't displays on the page, set it as an attribute in the parent element that contains a user.
- prefix, first_name, last_name: Display these together
- email: display this wrapped in an anchor tag. It's value should be set as the content of the tag, and in the `href` attribute prefixed with `mailto:`. The tag might look like this for each user: `<a href="mailto:user@email.com">user@email.com</a>`
- rating: Display this somewhere appropriate
- high_score: Display this appropriately
- date: Convert this to a date Object and format into something nice to read
- image: A small, 50x50, avatar image
  
### Challenge 6: Style your work

Now that the data is displayed you should make it look nice. Add a stylesheet 
to your project. Break this challenge down into two areas. 

1. The style of all records. How will you display 1000 records? You can use a list
or a grid, or columns. It's up to you. Think about how people might browse the 
list. 
2. The style of each individual user. This needs to be legible. Style hierarchy 
into the typography. Use at least three type styles. Think about the function 
of each piece of data. Each different type of data should have it's own font style. 

  
### Challenge 7: Displaying things in a new way

Rating is a good for internal reference, externally its hard for people to understand. Your job is to think of a list names you can use to describe users based on their rating. Rating ranges from 0.0 to 100.0. 

- 25 < : Civilian
- 40 < : Rebel
- 50 < : Paduan
- 75 < : Jedi
- 90 > : Jedi Master

make up your own list of names and rankings. Display the ranking in place of the rating number. 

### Challenge 8: Graph high scores

You need to show a graphof the high scores. The problem is the range is open ended. You'll need to find the highest high score. Write a function that does this. 

Get the highest high score. By dividing each user's high score by the highest value you will get a range of 0 to 1. You can use this value to create a bar graph each user's score. 