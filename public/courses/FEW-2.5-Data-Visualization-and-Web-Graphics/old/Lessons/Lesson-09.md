# FEW 2.5 D3 Intro 

D3 is a library that has been around for a long time. It's more of a toolkit for making visualizations with JavaScript. It's the first namer that comes when conversation turns to making data visualizations with JS. 

## Why? 

It's the tool that wrote the book on data visualization with JS. You can do just about anything with D3. It has huge flexibility and deep toolset. It also has a steep learning curve. 

## Learning Objectives 

- Identify use cases for D3
- Define data used by D3
- Create simple visualizations with D3

## D3

D3 - Data Driven Documents describes itself as: 

> D3.js is a JavaScript library for manipulating documents based on data. D3 helps you bring data to life using HTML, SVG, and CSS. D3’s emphasis on web standards gives you the full capabilities of modern browsers without tying yourself to a proprietary framework, combining powerful visualization components and a data-driven approach to DOM manipulation.

What does it do? Data visualization! You could say D3 wrote the book on data visualization with JavaScript. 

## How does it work? 

D3 does so much it's hard to answer that. It draws things from data. It binds to data, meaing it will update when the data changes. It handles aniamtion and interactions. It can load data and manipulate the DOM. 

D3 is more of a toolbox with tools that are focussed on drawing things on the screen from a datasets. 

Explore D3. Take a look at the examples on the D3 home and examples pages. Find an example that you think is interesting to show to the group and answer the question: why is this interesting? 

D3 is complex. With that complexity comes a lot of flexibility. Expect a steep learning curve. 

## Getting started

Link to the library from the CDN

`<script src="https://d3js.org/d3.v5.min.js"></script>`

You can find this link on the [D3 hompage](https://d3js.org)

Select an element to work with. You will be adding or modifying elements within this one. Here we are selecting the body. 

```JS
d3.select('body')
```

Next select the elements you want to modify or create. In this case we are selecting divs. It doesn't matter that there no existing divs. 

```JS
d3.select('body')
	.selectAll('div')
```

Next add some data. Data can be an array containing any type of data. Each element of the array will be processed. For this example I've used an array of numbers. 

```JS
d3.select('body')
	.selectAll('div')
	.data([5,6,2,8,4,9,1])
```

Next call `enter()`. Calling this method tells D3 to add new elements if they don't exist.  

```JS
d3.select('body')
	.selectAll('div')
	.data([5,6,2,8,4,9,1])
	.enter()
```

Use `append()` to tell D3 what type of element to append. 

```JS
d3.select('body')
	.selectAll('div')
	.data([5,6,2,8,4,9,1])
	.enter() 
	.append('div')
```

Set the text of each new node. This method takes a function which receives one of the data values and should return the text to display in the node. 

```JS
d3.select('body')
	.selectAll('div')
	.data([5,6,2,8,4,9,1])
	.enter() 
	.append('div')
	.text((d) => d)
```

The `style()` method takes two parameters. First is the style attribute to set, and second is either a function or a primitive value. 

When the second parameter is a primitive value, the value is returned. Look at: padding, background-color, and margin. 

When the second parameter is a function, the function receives a data value and returns a value. See the width. Here the value is normalized and returned as a %. 

```JS
d3.select('body')
	.selectAll('div')
	.data([5,6,2,8,4,9,1])
	.enter() 
	.append('div')
	.text((d) => d)
	.style('padding', '1em')
	.style('background-color', 'red')
	.style('margin', '1px')
	.style('width', (d) => `${d / 10 * 100}%`)
```

## Loading Data

D3 has it's own data loaders built in. D3 works with: JSON, CSV, and a few other data types. Read more [here](https://github.com/d3/d3/blob/master/API.md#fetches-d3-fetch). 

Loading data example. Notice this uses a Promise. 

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

## SVG

The earlier example used HTML, created HTML elements, and set CSS styles on those elements. D3 is also happy to work with SVG. 

Scalable Vector Graphics (SVG) is a format written in the XML language. It looks a lot like HTML, the two are closely related. Imagine HTML as a language for sharing and displaying text documents, and SVG as a language for sharing and displaying graphical images. Both languages share the same parent language.  

SVG looks like HTML but it has it's own set of tags. Here are a few tags to get started: 

- rect - Rectangle
- circle - Circle
- ellipse - Elipse
- g - Group
- line - Line
- path - Path
- polygon - Polygon
- and [many more...](https://developer.mozilla.org/en-US/docs/Web/SVG/Element)

Take a look at the list of SVG tags what do you see there? 

Pair up and explore a section of the SVG tag list. 

### Making SVG happen 

These tags a are a little arcane to write from scratch. D3 writes SVG for us! 

SVG tags have different names and many new and different attributes!

Try it for yourself. Challenge problems: 

- Make an svg tag
	- `<svg id="svg" width="500" height="500"></svg>`
- Make an array of objects 
	- Give each object three properties each assigned a random value. 
	
Select the SVG element by it's id name and give it a CSS style. 

```JS
d3.select('#svg')
	.style('border', '1px solid')
```

Select all of the `rect`s. None exist yet. Add data. Then call enter to start creating elements from the dataset. 

```JS
d3.select('#svg')
	.style('border', '1px solid')
	.selectAll('rect')
	.data(data)
	.enter()
```

Set attributes on SVG rect. here you've se the height and width to the value at the c key in your data and used transform to move the rect x and y position based on the values at keys a and b. 

```JS
d3.select('#svg')
	.style('border', '1px solid')
	.selectAll('rect')
	.data(data)
	.enter()
	.append('rect')
	.attr('height', (d) => d.c * 50)
	.attr('width', (d) => d.c * 50)
	.attr('transform', (d, i) => `translate(${500 / 50 * i}, ${500 - d.a * 500})`)
```

- What happened here? 
- How would you incorporate data from another source? 
- How would you modify the appearance? 

## After Class

- Choose an example or tutorial from D3 site and recreate that example with your own dataset. 

## Resources 




























## Learning Objectives/Competencies

1. Identify and describe
1. Define 
1. Desgin 
1. Implement 

## Initial Exercise

- Funny comic
- Prime the Pump (e.g. think and jot, think pair share, etc)
- Productivity Tip/Tool
- Review of current event (e.g. tech news relevant to your track/topic)
- Quiz on homework or topic(s) of past class

## Overview/TT I 

- Why learn this? 
- Industry examples of usage
- Best practices
- Personal anecdote 

## In Class Activity I

- I do, We do, You do
- Reading & Discussion Questions in small groups
- Draw a picture/diagram
- Complete Challenges solo or in pair
- Q&A about tutorials
- Pair up and code review
- Pair program
- Formative assessment
- Form into groups
- etc (get creative :D)

## Overview/TT II (optional)

## In Class Activity II (optional)

## After Class

- Continue working on your current tutorial
- Complete reading
- Complete challenges

## Additional Resources

1. Links to additional readings and videos
