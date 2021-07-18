# Class - FEW 2.3 - Assignment 4

## Description 

The goal of this assignment is to take the ideas from the previous two classes and use them to improve your portfolio project.

Class 1 you made components, displayed the components and applied styles to them. Class 2 you rendered lists of products, filtered the list, transformed the list of data into Components and rendered these components. 

The goal of this assignment is create a list of JavaScript Objects that your app will render as components. You can take this concept further by adding buttons to filter project by their type/category. 

### Why this assignment?

The problem you are solving in this assignment is a problem that you will face in every React project you create. You need to solve it now and own it. Managing arrays and dictionaries and turning these into veiws that are displayed is one of the most common tasks a front end developer will work with. 

## Project requirements

Your Portfolio should display projects from a data object. Originally all of the Projects were hard coded. The goal here is to make them dynamic.  

Instead of doing this:

 ```JS
// Hard coded values: BAD!
<div className="PageContent">
  <Project title="Tetris Dots" image="/images/kitten-0.jpeg" link="#" />
  <Project title="Zombie Server" image="/images/kitten-1.jpeg" link="#" />
  <Project title="Amazing Colors" image="/images/kitten-2.jpeg" link="#" />
  <Project title="Flip Toggle" image="/images/kitten-3.jpeg" link="#" />
  <Project title="121 Second St" image="/images/kitten-4.jpeg" link="#" />
  <Project title="Slide Shows" image="/images/kitten-5.jpeg" link="#" />
</div>
```

Do this: 

```JS
// Define an array of objects with the data
const projects = [
  {title:"Tetris Dots", image: "/images/kitten-0.jpeg", link: "#" }, 
  {title:"Zombie Server", image: "/images/kitten-1.jpeg", link: "#" },
  {title:"Amazing Colors", image: "/images/kitten-2.jpeg", link: "#" },
  {title:"Flip Toggle", image: "/images/kitten-3.jpeg", link: "#" },
  {title:"121 Second St", image: "/images/kitten-4.jpeg", link: "#" },
  {title:"Slide Shows", image: "/images/kitten-5.jpeg", link: "#" }
]

// Map data into Project components
projects.map((item) => {
  return <Project title={item.title} image={itme.image} link={item.link} />
})

// You could deconstruct
projects.map(({ title, image, link }) => {
  return <Project title={title} image={image} link={link} />
})

// Or how about this
projects.map((item) => {
  return <Project {...item} />
})
```

### Challenges 

Define a data object that represents a project you will put in your portfolio. 

At minimum this should be: 

- `title`: Title of the project
- `image`: Image url for the project image or screenshot
- `link`: Url to the project live or on GitHub

There is all sorts of information you might want to show. Take your Make School portfolio for example. The make School portfolio displays:

- `title`: Title of the project
- `description`: Description of the project 
- `tech`: An array of key words
- `image`: Image url for the project image or screenshot
- `github`: Url to the project live or on GitHub
- `link`: Link to the live project

You can expand this with a lot of other info: 

- `date`: Date the project was added
- `resume`: link
- `linkedin`: Linked in link
- `social`: An object with social media links 
  - instagram
  - facebook
  - github

Look at the suggestions above. THink about your portfolio project and what you want it to display, then define a data object for each portfolio item and put these all in an array. 

Mock up your data with placeholder values for now.  

Render this data in your React portfolio. 

## Challenges 

- Use dynamic data to render your portfolio data
  - Create an array of data objects that will displayed as Project components 
  - Extend the current values that you are using to inlcude new info (see the section above)
- Work on your stylesheet. 
- Inlcude a property that is a type or category for each project. Filter your projects based on this value. 
  - Each project data should have a property for category
  - Create a list of buttons where there is one button for category
    - Hint: You can use `Array.reduce()` to generate this list
  - Clicking a category button should filter the list of projects to show only projects with that category

### Deliverable

 Link to your React Portfolio. 

### Due date

Class 5

## Assessing the assignment

[Assignment 4 Rubric](./Assignment-04-rubric.md)


