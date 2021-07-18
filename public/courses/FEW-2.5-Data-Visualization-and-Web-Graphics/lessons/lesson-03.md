# FEW 2.5 - Lesson 3

Making data visible with HTML, CSS, JavaScript. 

<!-- Put a link to the slides so that students can find them -->

<!-- ➡️ [**Slides**](https://make-school-courses.github.io/FEW-2.5-Data-Visualization-and-Web-Graphics/Slides/Lesson-4.html ':ignore') -->

<!-- > -->

## Overview

In the last lesson you organized and extracted values from a dataset. The next step is to make this data visible. The goal now is take all of the values and tunr them into something that can be displayed. 

<!-- > -->

## Why is this important?

Turning data into something that people can easily understand is why we make websites! 

<!-- > -->

## Learning Objectives

- Create HTML elements with JavaScript 
- Use JavaScript to style elements
- Use Map to transform data into HTML elements

## Infographic vs Data Visualization

Your goal is to make a **data visualization**. This is an or visual representation of data. It's not an info graphic or generative art though all three are related. Take a look at the two articles below for examples of info graphics and data visualizations. 

Take a look at these examples:

- [Info Graphic](https://venngage.com/blog/what-is-an-infographic/)
- [Tableau Best Data viz examples](https://www.tableau.com/learn/articles/best-beautiful-data-visualization-examples)

More Examples: 

- Data visualizations Examples
  - [What is data visualization](https://www.tableau.com/learn/articles/data-visualization)
  - [Best Data Visualizations 2018](https://visme.co/blog/best-data-visualizations/)
  - [James Round](https://www.jamesrounddesign.com)
  - [Data visualization](https://datavizcatalogue.com)
  - [Examples](https://www.maptive.com/17-impressive-data-visualization-examples-need-see/)
- Generative art and Data: 
	- https://www.ted.com/playlists/201/art_from_data
	- https://joshuadavis.com
	- https://www.theatlantic.com/entertainment/archive/2015/05/the-rise-of-the-data-artist/392399/
	- https://techcrunch.com/2016/05/08/the-digital-age-of-data-art/

## Modules

Whats' a module?

A module is a block of code that defiens it's own scope. 

What's scope? 

Scope defines where a varaible is visible to the rest of the program. 

How to use a module in a browser project? 

In the browser you'll use the script tag and the type attribute to define a module. 

```HTML
<!-- This script is a module -->
<script type="module"></script>
<!-- This script is not a module -->
<script></script>
```

Why use a module?

Code in the browser in past has always been global. Variables defined in any script were seen all other scripts. This creates bugs and errors. It also led to a lot of strange looking constructs to avoid global variables while still allowing code to be shared across scopes. 

Here is an example of a problem. Imagine there were two different scripts in your project. These could in different files. Imagine that one or more of your files was imported from somewhere else and you don't know what's in it. 

```HTML
<!-- Imagine there are two different scripts in your project -->
<script>
	var data = [...]
	function getData() { ... }
</script>
<!-- Imagine this second file you are writing and you happen to use 
the names that have already been defined in another script! -->
<script>
	var data = { ... }
	function getData() { ... }
</script>
```

In a module code would not "escape" it's module. Take a quick read about modules here: 

https://javascript.info/modules-intro

Challenge: Fix the code here by making some modules: 

https://repl.it/join/xmpbhmez-mitchellhudson

Hint: add `type="module"`

### import, export, and default 

Separating code into separaste files is good but sometimes you need to share code across files. Modules allow this with the keywords: `import`, `export`, and `default`

- `import` - imports an export from another module
- `export` - exports a value from a module
- `default` - declare a single export as the "default" export for easier importing

## Making Data Visible

The goal of this section it display the Titanic data with HTML, CSS and JS. You'll do everything with the code you write. Later we will use code libraries to to more. Writing the code yourself is important to understand programming, problem solving, and a step along the way to writing you writing your own libraries.

These examples can be applied and tested in this Repl.it:  

https://repl.it/join/gnjigkyl-mitchellhudson

## Creating HTML elements

You cna generate HTML elements with code! 

```JS
// Creates a new <div>
const el = document.createElement('div')
```

An element is not displayed unless it is added to the DOM

```JS 
// Add the element to the body
document.body.appendChild(el)
```

## Styling HTML Elements 

All CSS styles can be applied in via code. All CSS style properties are available through JavaScript. 

Set any property on an elements style property. All CSS property names convert to camel for their JS name. 

Since CSS values usually include a unit you'll always use a string when setting the value in JS. 

```JS
// set the width and height
el.style.width = '100px'
el.style.height = '200px'
// Set the background-color
el.style.backgroundColor = '#f0f'
// Make an element display as a grid
el.style.display = 'grid'
el.style.gridTemplateColumns = 'repeat(6, 100px)'
el.style.gridGap = '2px'
```

### What types of styles?

- `backgroundColor` 
- `opacity`
- size: `width` and `height`
- `border`, width, color, style, radius

What can you draw with these properties? It seems limitted but there are lots of possiblities. You can use different properties to represent different aspects of the data.

## Turning data into HTML elements

HTML elements are objects native to the browser that can be displayed. This is a transformation. Use Map! 

You can do this with a loop for an array of data: 

```JS 
// Imagine we have an array of objects
const data = [{}, {}, ... ]

// Imagine there is an element in the DOM with this id name
const titanic = document.querySelector('#titanic')

// Loop over your data and make an array of passenger elements 
const passengers = data.map(passenger => {
	return document.createElement('div')
})

// Let's loop over the passengers appeand them to the DOM and add some styles
passengers.forEach((p, i) => {
	// Append each to the titanic element
	titanic.appendChild(p)

	// Set some styles
	p.style.width = '10px'
	p.style.height = '10px'

	// We can match each element to some data by it's index data[i]
	if (data[i].embarked === 'S') {
		p.style.backgroundColor = 'cornflowerblue'
	} else if (data[i].embarked === 'C') {
		p.style.backgroundColor = 'orange'
	} else if (data[i].embarked === 'Q') {
		p.style.backgroundColor = 'limegreen'
	} else {
		p.style.backgroundColor = 'black'
	}

	// Use a ternary to set a property to one of two values 
	p.style.borderRadius = data[i].sex === 'male' ? '0' : '50%'
})
```

## Break 

Take a 10 minute break.

## Lab 

Use this Repl.it as a starting place to test the ideas from earlier. 

https://repl.it/join/gnjigkyl-mitchellhudson

## After Class

- https://github.com/Make-School-Labs/FEW-2-5-Titanic-Visualization


## Video lessons

- https://youtu.be/BgCRqcwZ4TA
- https://youtu.be/iwYmA0HISSQ
- https://youtu.be/SxNpz23yaKs
- https://youtu.be/lNPbtl0K860

<!--

## Minute-by-Minute

| **Elapsed** | **Time**  | **Activity**              |
| ----------- | --------- | ------------------------- |
| 0:00        | 0:05      | Overview and Learning Outcomes                |
| 0:05        | 0:15      | Distributions                  |
| 0:20        | 0:10      | Sorting       |
| 0:30        | 0:10      | Filtering                     |
| 0:40        | 0:15      | Holding Elements      |
| 0:55        | 0:15      | Animations      |
| 1:10        | 0:15      | CSS Transforms      |
| 1:25        | 0:10      | Closures      |
| 1:35        | 0:10      | BREAK      |

-->