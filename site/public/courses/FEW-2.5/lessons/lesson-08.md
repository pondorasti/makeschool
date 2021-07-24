
# FEW 2.5 - D3 Intro

<!-- Put a link to the slides so that students can find them -->

<!-- ➡️ [**Slides**](https://make-school-courses.github.io/FEW-2.5-Data-Visualization-and-Web-Graphics/Slides/Lesson-9.html ':ignore') -->

<!-- > -->

## Overview

D3 is a library that has been around for a long time. It's more of a toolkit for making visualizations with JavaScript. It's the first name that comes when conversation turns to making data visualizations with JS.

## Why you should know this

It's the tool that wrote the book on data visualization with JS. You can do just about anything with D3. It has huge flexibility and deep toolset. It also has a steep learning curve.

<!-- > -->

## Learning Objectives

- Identify use cases for D3
- Define data used by D3
- Create simple visualizations with D3

<!-- > -->

## D3

D3 - Data Driven Documents describes itself as:

> D3.js is a JavaScript library for manipulating documents based on data. D3 helps you bring data to life using HTML, SVG, and CSS. D3’s emphasis on web standards gives you the full capabilities of modern browsers without tying yourself to a proprietary framework, combining powerful visualization components and a data-driven approach to DOM manipulation.

What does it do? Data visualization! You could say D3 wrote the book on data visualization with JavaScript.

<!-- > -->

## How does it work?

D3 does so much it's hard to answer that. It draws things from data. It binds to data, meaning it will update when the data changes. It handles animation and interactions. It can load data and manipulate the DOM.

D3 is more of a toolbox with tools that are focussed on drawing things on the screen from a datasets.

<!-- > -->

## Explore D3.

Go to the [D3 hompage](https://d3js.org), and take a look at the examples on the D3 home and [examples pages](https://github.com/d3/d3/wiki/Gallery).

**Find an example that you think is interesting to show to the group and answer the question: _why is this interesting?_**

D3 is complex. With that complexity comes a lot of flexibility. Expect a steep learning curve!

<!-- > -->

## Getting started

Link to the library from the CDN:

`<script src="https://d3js.org/d3.v6.min.js"></script>`

You can find this link on the [D3 hompage](https://d3js.org)

It might be easier to find some info on their GitHub: https://github.com/d3/d3

### Displaying elements

Select an element to work with. You will be adding or modifying elements within this one. Here we are selecting the body:

```JS
d3.select('body')
```

<!-- > -->

Next select the elements you want to modify or create. In this case we are selecting divs. It doesn't matter that there no existing divs.

```JS
d3.select('body')
	.selectAll('div')
```

<!-- > -->

Next add some data. Data can be an array containing any type of data. Each element of the array will be processed. For this example I've used an array of numbers.

```JS
d3.select('body')
	.selectAll('div')
	.data([5,6,2,8,4,9,1])
```

<!-- > -->

Next call `enter()`. Calling this method tells D3 to add new elements if they don't exist.  

```JS
d3.select('body')
	.selectAll('div')
	.data([5,6,2,8,4,9,1])
	.enter()
```

<!-- > -->

Use `append()` to tell D3 what type of element to append.

```JS
d3.select('body')
	.selectAll('div')
	.data([5,6,2,8,4,9,1])
	.enter()
	.append('div')
```

### D3 Cheatsheet

Here's the forumula for getting started with D3. 

```JS
d3.select('body')        // select() an element to host 
	.selectAll('div')			 // selectAll() the elements you want to work with
	.data([5,6,2,8,4,9,1]) // define your data()
	.enter()               // enter() your data 
	.append('div')         // append() elements
```

- `d3.select('#someId')` - Select an element to host the elements you will create. This element will contain all of the elements d3 creates. This element should exist and you will probably want identify it with an id. 
- `.selectAll('someEl')` - Select all elements you will be working with. These elements don't need to exist and will be created if they don't exist. 
- `.data(someArray)` - Add an array of data
- `enter()` - Enter identifies elements that need to be added to the DOM when there is more data than elements. 
- `.append('someEl')` - Appends elements to the DOM for each piece of data.

<!-- > -->

## D3 Working with elements and data

Set the text of each new node. This method takes a function which receives one of the data values and should return the text to display in the node.

```JS
d3.select('body')
	.selectAll('div')
	.data([5,6,2,8,4,9,1])
	.enter()
	.append('div')
	.text((d) => d)
```

What happened here? You starrted D3. Pointed D3 to the body tag to work with as a container for dynamically generated elements. You selected all of the div tags (there are none at the moment.) You gave D3 an array of numbers to work with. Next you called `.enter()` this method identifies DOM elements that need to be added to a selection. Currently there are not divs but you have 7 numbers in your array, so we need to `.append()` some new divs. last, for each div you set the text of that div. Here text takes a callback that receives a piece of data from the array and is expected to return the value that you'd like to see. 

The end result is a list of divs each displaying one of the elements from the array. 

Try this: 

```JS
d3.select('body')
	...
	.text((d) => `$${d.toFixed(2)}`)
```

Here you took the data element in and converted to a string, added a $ and a decimal and some 0s. 

Stop a amoment and imagine the piece of data (`d`) was a passenger object from the Titanic. 🤔

<!-- > -->

### Styling Elements

The `style()` method takes two parameters. First is the style attribute to set, and second is either a function or a primitive value.

```JS
d3.select('body')
	...
	.style('padding', '1em')
	.style('background-color', 'red')
	.style('margin', '1px')
```

Use the `.style()` method to apply styles to each element. Style takes two parameters. The first is the style property name. The second is the value for that property. 

`.style('padding', '1em')` is equivalent to `padding: 1em`

This is good but in some cases you'll want the styles to be related to the dated value. In this case you can replace the second parameter with a callback! 

With these properties in place each row should have padding of 1em, a background color of red, and 1px margin. Things are starting to looking interesting. 

```JS
d3.select('body')
	...
	.style('width', (d) => `${d / 10 * 100}%`)
```

Here the you've added a callback. The callback takes the data as a parameter, and returns the value for the width property. 

With this in place the width of each bar is a percentage of the width of the screen.

<!-- > -->

## Loading Data

D3 has its own data loaders built in. D3 works with: JSON, CSV, and a few other data types. Read more [here](https://github.com/d3/d3/blob/master/API.md#fetches-d3-fetch).

See the loading data example below. Notice this uses a Promise:

Load a JSON Object:

```JS
d3.json('metal.json')
	.then(json => console.log(json))
```

Load a CSV object.

```JS
// CSV
d3.csv('metal_bands_2017.csv')
	.then(csv => console.log(csv))
```

A Promise is an object used by JS to handle async tasks. let's break the examples above into steps: 

```JS
d3.json('titanic-passengers.json')
	.then(json => console.log(json))
```

What happened here? You called `d3.json('titanic-passengers.json')` which returned a Promise. A Promise is an object something like: `{...}`. Let's put it in a variable: 


```JS
const p = d3.json('titanic-passengers.json')
p.then(json => console.log(json))
```

Here you put the promise in the variable p and then called the `.then()` method. The `.then()` takes a callback function which executed when the promise resolves. In this example the promise will resolve when the JSON data is loaded. 

The `then()` callback receives the data you are loading. 

`d3.json().then(data => ...)`

**Challenge**

Load the Titanic data!

```JS
d3.json('titanic-passengers.json')
	.then(json => {
		// Inside the callback!
		d3.select('body')
			.selectAll('div')
			.data(json)
			.enter()
			.append('div')
			.text(d => d.fields.name)
	})
```

Notice here you're taking the D3 example from earlier and putting into the callback in `d3.json().then()`. When the data is loaded you're using that data in place of the array that was used in the original example. 

The code above displays all of the name of the passengers in the Titanic data. 

**Challenge**

The next challenge is to style each of the names. 

- Add some padding to each name: 0.5em
- Add some margin to each name: 1px

**Challenge**

Set the background color based on the survived property. Passengers that has survived of 'Yes' should have a background color of `cornflowerblue` (yes, that's a color) and causalities should have a background color of `tomato`.

### D3 HTML Review 

What happened in the last couple challenges? You used D3 to load data from a JSON file. You also used D3 to create, style and set the content of HTML elemnents (divs) from data you provided. 

In this case D3 is creating HTML elements. All of the rules and features that apply to HTML elements apply here. All of the CSS styles and the effects those styles have will have the same effects here. 

Inspect the example above in your browser. To see what was generated by D3. It should look something like: 

```HTML 
<div style="padding: 0.5em 1em; margin: 1px; background-color: tomato; border-top-left-radius: 2em; border-top-right-radius: 2em; border-bottom-right-radius: 2em; border-bottom-left-radius: 2em;">Olsen, Mr. Ole Martin</div>
<div style="padding: 0.5em 1em; margin: 1px; background-color: cornflowerblue; border-top-left-radius: 2em; border-top-right-radius: 2em; border-bottom-right-radius: 2em; border-bottom-left-radius: 2em;">Watt, Mrs. James (Elizabeth "Bessie" Inglis Milne)</div>
<div style="padding: 0.5em 1em; margin: 1px; background-color: tomato; border-top-left-radius: 2em; border-top-right-radius: 2em; border-bottom-right-radius: 2em; border-bottom-left-radius: 2em;">Bengtsson, Mr. John Viktor</div>
...
```

So D3 generated a list of standard div tags and assigned some inline styles. You could have written this by hand if you had wanted to and had the time to spare. 

<!-- > -->

## SVG

SVG is Scalable, Vector, Graphics. It's used to draw things. Rather than display text and pictures and link pages of text together SVG is used to draw lines and shapes. 

SVG and HTML are closely related. Both languages share the same parent language and are written in much the same way with the same syntax. 

Where HTML has tags to create headings, paragraphs, images, and links. SVG has tags that create Rectangles, circles, paths, and polygons. 

SVG has the same syntax as HTML. SVG uses different tag names and the browser renders these following different rules. 

Here is a list of some of the SVG tags. 

- `<svg>` - The root element for an SVG document. 
- `<rect>` - A Rectangle, you know fours sides width and height
- `<circle>` - A Circle it round
- `<ellipse>` - An Elipse it's an oval
- `<g>` - A Group, groups elements
- `<line>` - A Line, a straight line
- `<path>` - A Path
- `<polygon>` - A Polygon
- and [many more...](https://developer.mozilla.org/en-US/docs/Web/SVG/Element)

**Pair up and explore a section of the SVG tag list.**

<!-- .slide: data-background="#087CB8" -->
## [**10m**] BREAK

### Making SVG happen

D3 writes SVG for us! While you can write your own SVG documents using D3 you will use D3 to write the SVG content for you. 

SVG tags have different names and many new and different attributes!

Try it for yourself with these challenges:

Make an SVG element. You can write SVG into your HTML documents just like you would write a div or other tag. Think of the `<svg>` element as a the root element. All of the svg tags must be inside of an `<svg>` tag. 

Make an svg tag:

`<svg id="svg" width="500" height="500"></svg>`

Inside an SVG tag you can add other tags but these need to be SVG elements. SVG has it's own tags/elements that are different from HTML tags/elements. 

SVG elements have their own attributes also. Try it yourself, make a circle. 

```HTML
<svg id="svg" width="500" height="500">
	<circle cx="250" cy="250" r="123" fill="#0ff"/>
</svg>
```

This should make a cyan circle in the center of the SVG document. 

- `cx` - center x
- `cy` - center y
- `r` - radius
- `fill` - fill color

Make a couple more circles for fun. 

### D3 and SVG Example

Time to make some SVG elements with D3. 

Make an array of objects. Give each object three properties, each assigned a random value.

This function takes a parameter `n` and returns an array of n objects. Each object properties a, b, and c with random values from 0 - 1. 

```JS
function makeRandomData(n) {
	const array = []
	for (let i = 0; i < n; i += 1) {
		array.push({ a: Math.random(), b: Math.random(), c: Math.random() })
	}
	return array
}
```

<!-- > -->

Use this function to generate random data for testing. 

```JS
const data = makeRandomData(11)
```

<!-- > -->

Select the SVG element by its id name and give it a CSS style.

```JS
// Select #svg
d3.select('#svg')
	// Style #svg
	.style('border', '1px solid #000')
```

Adding a border will help idenitfy where SVG is in the window. If you don't see the border check your work. 

<!-- > -->

Select all of the `circle`s. None exist yet. Add `data`. Then call `enter()` to start creating elements from the data.

```JS
d3.select('#svg')
	.style('border', '1px solid')
	// select all <circle>s in #svg
	.selectAll('circle')
	.data(data)
	.enter()
```

<!-- > -->

Set attributes on SVG `circle`. Below we've set the `cx`, `cy`, `r`, and `fill` to the values in the data.

```JS
d3.select('#svg')
	.style('border', '1px solid')
	.selectAll('rect')
	.data(data)
	.enter()
	// Style all <circle>s in #svg
	.append('circle')
	.attr('cx', (d, i) => i * 500 / data.length)
  .attr('cy', d => d.a * 500)
	.attr('r', d => d.c * 100)
	.attr('fill', d => 'green')
	.attr('opacity', () => 0.5)
```

Notice that the `.attr()` method takes two parameters. The first is a string and should the name of the attribute. The second is a callback function that receives one data element and returns the value you want assigned to that attribute. 

The callback also receives the index of the data element in it's array. The example above uses this to set the `cx` attribute to spread the circles evenly across the width of the svg container. 

Notice I've used an arrow function here, written on a single line the return is implicit. 

Here is a list of attributes you can use with svg elements: 

- `stroke` color of a stroke
- `stroke-width` size of the stroke in px
- `cx` the horizontal position of the element
- `cy` the vertical position of the element 
- `r` the radius of a circle
- `fill` the fill color of the element 
- `opacity` the transparency/opacity of the element

There are lots and lost of attributes. Some apply to some elements and not to others while some attributes apply to all elements. For example `r`/radius only applies to circles. To know which attribues apply you need to look up the element in the documentation. 

https://developer.mozilla.org/en-US/docs/Web/SVG/Element

<!-- > -->

### SVG and Sketch

Sketch can export SVG. Anything you draw in Sketch can be copied and pasted as SVG code. 

Try it out. 

- Open Sketch
- Draw something
	- If you drew multiple shapes group them together
- Right click on the object you drew and choose "Copy SVG Code"
- Paste this code into the body of your HTML document

You can now inspect the code and it will render in your HTML document. 

<!-- > -->

Try these challenges

- Change the color of all of the circles
- Change the opacity of the circle
- Make the radius of all circles 50
- Give each circle a stroke, you'll need to add two more attributes:
	- stroke - set a color 
	- stroke-width - set the width of the stroke in pixels

<!-- > -->

### Activity

Answer the following questions:

- What happened in the examples above?
- How would you incorporate data from another source?
- How would you modify the appearance?

<!-- > -->

## Lab - Part 1

Go to [make.sc/d3-challenges](https://make.sc/d3-challenges). Clone the repo, and work through the challenges in the `D3Intro` folder. You will find the challenges as comments in the corresponding HTML and JS files

<!-- > -->

## Lab - Part 2

The goal for the lab is to use the Titanic dataset with D3. You can also improve on the code above in a few ways. Try the challenges below:

<!-- v --> 

**Challenge** 

Create an HTML file and add the link to the D3 source code and another script for your code. Include a tag for SVG. 

```HTML
<!DOCTYPE html>
<html>
	<head>
		<title></title>
	</head>
	<body>

		<svg id="svg" width="500" height="500"></svg>

		<script src="https://d3js.org/d3.v6.min.js"></script>
		<script>
			// Your code here! 
		</script>
	</body>
</html>
```

<!-- v --> 

**Challenge**

Copy the `titanic-passengers.json` file into the folder where you are working. Here's link to the titanic data if you don't have it somewhere: 

https://github.com/MakeSchool-Tutorials/FEW-2-5-Data-Visualization-Working-with-Data/blob/master/titanic-passengers.json

Load the titanic JSON like this: 

```js 
d3.json('./titanic-passengers.json')
	.then(data => {
		// 
	})
```

<!-- v --> 

**Challenge**

To make things easier to work map all of the fields. Remember each passenger a fields properrty where all of the data is. This leaves you working with passengers like this: 

```JS
p.fields.name
p.fields.age
p.fields.fare
// etc. 
```

Better would be this: 

```JS
p.name
p.age
p.fare
```

Do this by mapping the fields to create your data array. It might good to also add a function to handle your D3 work: 

```js 
d3.json('./titanic-passengers.json')
	.then(data => {
		const fields = data.map(p => p.fields) // Map to an array of fields
		handleData(fields) // pass the fields to a function that will draw the data  
	})

function handleData(data) {
	// Do your D3 drswing here!
}
```

<!-- v --> 

**Challenge**

In the handledata function initialize a D3 drawing and display the titanic passengers. Here is some starter code that plans to draw some circles in the svg. 

```js 
...

function handleData(data) {
	d3.select('svg')
		.selectAll('circle')
		.data(data)
		.enter()
		.append('circle')
		.attr('cx', (p, i) => 500 / data.length * i) // set the position
		.attr('cy', 500 - p.fare * 0.9)
		.attr('r', 5) // set the radius
		.attr('fill', '#000')
}
```

This should create some small black circles that are spread evenly on the horizontal axis and positioned vertically based on the fare. 

<!-- v --> 

**Challenge**

This is a good start but needs some color. Rewrite the last line from the previous code snippet to set a different color for each passenger based on sex property. 

Replace the color string `'#00)'`with a callback that will handle figuring out what color a each passenger should be.  

```JS
...
.attr('fill', p => ... )
```

<!-- v --> 

**Challenge** 

Try these challenges: 

- set the opacity based on survived: 0.5 for No and 1.0 for Yes. 
- Set a stroke based on embarked. Use the `'stroke'` attribute to set the color and `'stroke-width'` to set the width or weight of the stroke.

<!-- > -->

## After class

- Finish D3Intro challenges


<!-- > -->
<!-- 
## Minute-by-Minute

| **Elapsed** | **Time**  | **Activity**              |
| ----------- | --------- | ------------------------- |
| 0:00        | 0:05      | Overview and Learning Outcomese                |
| 0:05        | 0:05      | D3 Intro                  |
| 0:10        | 0:10      | Explore D3       |
| 0:20        | 0:30      | Getting Started                     |
| 0:50        | 0:10      | Loading Data      |
| 1:00        | 0:30      | SVG      |
| 1:30        | 0:10      | BREAK      |
| 1:40        | 1:00      | Lab      |
| 2:40        | 0:05      | Wrap up review objectives |
| TOTAL       | 2:45      | -                         |
 -->
