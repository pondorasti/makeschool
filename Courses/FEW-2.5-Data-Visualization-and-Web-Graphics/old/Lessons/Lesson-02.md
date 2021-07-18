# Displaying Data graphically 

This class you will take the values generated in the previous class and turn them into shapes on the screen. 

## Why do you need to know this? 

Displaying data is interesting and useful. You can convey a lot more information that is easier to grasp and show relations with images in some cases these would not be apparent with numbers. 

Beyond data science being able to draw shapes in HTML is a key skill to creating interesting and copelling user interfaces. Everything covered here can be used in almost all aspects of web application development. 

## Learning Objectives

- Create elements with JS
- Build basic visualizations with JS
- Use JS to apply CSS styles
- Create elements dynamically
- Normalize data for graphic representation

## Overview 

The goal of this lesson is to create DOM element and apply styles. The values applied to styles will come from the Titanic data. 

### Normalization 

Values are almost always associated with a unit. For example 

- $ dollars
- bpm beat per minute 
- Miles

To display things on the screen we need to convert units link $ into px or another unit used in CSS. 

To do this it's best to normalize data into a decimal value from 0 to 1. 

To do this it's often necessary to know the max value of your dataset and the range.

To normalize values divide all of the values in a dataset by the max value.  

For example: 

88 / 100 is 0.88 that is 88 is 88% of 100

This works for any numbers. 

56 / 121 is 0.4628099174 in other words 56 is ~46% of 121. 

The two values above could now be used to create values that display on the screen. For example: 

```JavaScript
const maxValue = 100
const value = 88
const normalizedValue = value / maxValue

el.style.width = `${normalizedValue}%` // Convert to a percent
el.style.height = `${normalizedValue * 500}px` // convert to px
el.style.color = `hsl(${normalizedValue * 360}`, 50%, 50%)` // Convert to a color
```

## Drawing shapes with HTML and CSS

There is a limit to what can be drawn with HTML and CSS, a wide range of shapes is possible. With a single div you can create a rectangle. With the rectangle you have the following options

- round the corners
- set a stroke
- rotate
- skew

## Rectangles 

The default shape is the rectangle. Anything you create on the computer is going to be a rectangle. 

Draw a rectangle: 

<div style="width: 100px; 
height: 100px; 
background-color: red;">
</div>

```CSS
width: 100px; 
height: 100px; 
background-color: red;
```

The most common way data is displayed after showing it numerically is by drawing bar graphs. A bar graph is easioly created with HTML and CSS. 

<div style="width: 200px; height: 200px; border:1px solid; display: flex; flex-direction: row; align-items: flex-end">
	<div style="width: 20px; height: 37%; background-color: red; margin: 5px"></div>
	<div style="width: 20px; height: 48%; background-color: red; margin: 5px"></div>
	<div style="width: 20px; height: 66%; background-color: red; margin: 5px"></div>
	<div style="width: 20px; height: 55%; background-color: red; margin: 5px"></div>
	<div style="width: 20px; height: 77%; background-color: red; margin: 5px"></div>
	<div style="width: 20px; height: 90%; background-color: red; margin: 5px"></div>
	<div style="width: 20px; height: 85%; background-color: red; margin: 5px"></div>
</div>

This block draws a group of rectangles and sizes the height wiht %. They are arranged horizontally using flex.

```HTML
<div style="width: 200px; height: 200px; border:1px solid; display: flex; flex-direction: row; align-items: flex-end">
	<div style="width: 20px; height: 37%; background-color: red; margin: 5px"></div>
	<div style="width: 20px; height: 48%; background-color: red; margin: 5px"></div>
	<div style="width: 20px; height: 66%; background-color: red; margin: 5px"></div>
	<div style="width: 20px; height: 55%; background-color: red; margin: 5px"></div>
	<div style="width: 20px; height: 77%; background-color: red; margin: 5px"></div>
	<div style="width: 20px; height: 90%; background-color: red; margin: 5px"></div>
	<div style="width: 20px; height: 85%; background-color: red; margin: 5px"></div>
</div>
```

Besides setting the height and width what else can you do?

## Transform 

CSS transform is a powerful tool that provides methods to translate (move, left right, up or down), rotate, skew, and scale elements. When using transform you combine all transforms on same line for example: 

`transform: translate(10px, 30px) rotate(45deg) skew(10deg) scale(1.5);`

### Transform Rotate

Use transform: rotate to create other shapes from a rectangle like a diamond. 

<div style="width: 100px; 
height: 100px; 
background-color: red; 
transform: rotate(45deg)">
</div>

Here the div is rotated with `transform: rotate(45deg);` Rotation works with units of radians (`rad`) or degrees (`deg`). There is also [Gradians](https://en.wikipedia.org/wiki/Gradian) (grad).  

```CSS
width: 100px; 
height: 100px; 
background-color: red;
transform: rotate(45deg);
```

### Make more complex shapes by rounding the corners

Any of the four corners can have a radius. Round them all and you get a circle. Round a combination of the corners to get other shapes. 

#### Circles 

Round all four corners to get a circle. 

<div style="width: 100px; 
height: 100px; 
background-color: red; 
border-radius: 50%">
</div>

```CSS
width: 100px; 
height: 100px; 
background-color: red;
border-radius: 50%;
```

#### Eyes, Droplets and Leaves

Rounding two or three corners to get shapes that look like eyes, lemmons, leaves, droplets, or map pointers. 

In this case you may also want to rotate the element to orient the shape corrently. 

<div style="width: 100px; 
height: 100px; 
background-color: red; 
border-radius: 50% 0">
</div>

```CSS
width: 100px; 
height: 100px; 
background-color: red;
border-radius: 50% 0;
```

<div style="width: 100px; 
height: 100px; 
background-color: red; 
border-radius: 50% 0 0 0">
</div>

```CSS
width: 100px; 
height: 100px; 
background-color: red;
border-radius: 50% 0 0 0;
```

<div style="width: 100px; 
height: 100px; 
background-color: red; 
border-radius: 50% 50% 50% 0">
</div>

```CSS
width: 100px; 
height: 100px; 
background-color: red;
border-radius: 50% 50% 50% 0;
```

<div style="width: 100px; 
height: 100px; 
background-color: red; 
border-radius: 50% 50% 50% 0;
transform: rotate(135deg)">
</div>

```CSS
width: 100px; 
height: 100px; 
background-color: red;
border-radius: 50% 50% 50% 0;
transform: rotate(135deg);
```

<div style="width: 100px; 
height: 100px; 
background-color: red; 
border-radius: 50% 50% 50% 0;
transform: rotate(-45deg)">
</div>

```CSS
width: 100px; 
height: 100px; 
background-color: red;
border-radius: 50% 50% 50% 0;
transform: rotate(-45deg);
```

<div style="width: 100px; 
height: 100px; 
background-color: red; 
border-radius: 50% 0 50% 0;
transform: rotate(45deg)">
</div>

```CSS
width: 100px; 
height: 100px; 
background-color: red;
border-radius: 50% 0 50% 0;
transform: rotate(45deg);
```

## Strokes 

Add a stroke to add some dimension to your shapes. 

<div style="width: 100px; 
height: 100px; 
background-color: red; 
border-radius: 50%;
transform: rotate(45deg);
border: 12px solid">
</div>

```CSS
width: 100px; 
height: 100px; 
background-color: red;
border-radius: 50%;
transform: rotate(45deg);
border: 12px solid;
```


<div style="width: 100px; 
height: 100px; 
background-color: red; 
border-radius: 50% 0 50% 0;
transform: rotate(45deg);
border: 12px solid">
</div>

```CSS
width: 100px; 
height: 100px; 
background-color: red;
border-radius: 50% 0 50% 0;
transform: rotate(45deg);
border: 12px solid;
```

## Compound Shapes 

Nest a one shape inside another for more complex images. A nested element will always render on top of it's parent. If the parent it rotated the position of the inner element will be effected. 

If you need to make a lot of these better to make a function that returns the structure and all of the base styles, or pass colors and size parameters to the function and get a configured object. 

<div style="width: 100px; 
height: 100px; 
background-color: red; 
border-radius: 50% 0 50% 0;
transform: rotate(45deg);
border: 12px solid;
display: flex;
justify-content: center;
align-items: center">
	<div style="width: 50px; 
	height: 50px; 
	background-color:#000;
	border-radius:50%;
	border: 10px solid #fff;">
		<div style="width:20px; 
		height: 20px;
		background: #fff;
		border-radius:50%;
		position: relative;
		left: 15px;
		top:-5px"></div>
	</div>
</div>

```CSS
/* Outer "eye" shape */
width: 100px; 
height: 100px; 
background-color: red; 
border-radius: 50% 0 50% 0;
transform: rotate(45deg);
border: 12px solid;
display: flex;
justify-content: center;
align-items: center;

	/* Inner "pupil" shape */
	width: 50px; 
	height: 50px; 
	background-color:#000;
	border-radius:50%;
	border: 10px solid #fff;

		/* Inner inner "highlight" */
		width:20px; 
		height: 20px;
		background: #fff;
		border-radius:50%;
		position: relative;
		left: 15px;
		top:-5px
```

## Generating dynamic elements

**Your goal is to generate all of this HTML with JavaScript** and abstract the process into functions that do the work for you. This way you can just supply a dataset, usually an array of values and have the your function do the work of creating DOM elements and assigning CSS styles.

### Creating DOM elements

Use `document.createElement('div')` to create a new DOM element. 

// <div></div>

`const el = document.createElement('div')`

Remember **to be visible an element must be the child of an element that is a descendant of the body tag**. Add an element as a child of another element with `parent.appendChild(el)`. For example: 

`parent.appendChild(el)`

### Interview Questions 

Think in terms of interview questions. How would what we are doing in class translate to an interview problem? 

- Easy 
	- Generate one element for each record in the Titanic Dataset
	- Create one element for each male passenger
	- Create one element for each female passenger
- Moderate 
	- Create two elements that show the ratio of passengers who survived vs those that didn't. (easy solution make a bar graph)
	- Create elements showing the ratio of passengers by `pclass` (easy solution make a bar graph)
- Hard
	- Show the ratio of men and women who survived vs men and women who did not survive.
	- Show the ratio of passengers who survived vs those that did not by embarkation.

### Styling elements

All CSS styles of an element are accessible through that element's `style` property. The styles are named with a camelCase version of the CSS style name. For example:

```JavaScript
el.style.width = '20px'
el.style.height = '160px'
el.style.backgroundColor = 'red'
...
```

NOTE! Almost every CSS property requires a unit. You must inlcude these when setting a value with JS. This means usually the value will be a string with a value and a unit. 

Notice CSS `background-color` becomes `backgroundColor` is JS. 

## Absolute Position

To position elements anywhere on the screen with numeric values you'll want to use CSS `position: absolute`. Absolute position lets you set the a position using `left`, `top`, `right`, and `bottom`. The easiest way to work with these is to work `left` and `top` and imagine you are setting the position of an element measuring it's position from the top left of the screen. 

Sometimes you'll want to position an element using coordinates of a parent. In other words you want to measure top and left from the top left of the parent. To do this set the parent's position to `position: relative`. 

Here is an example: 

<div style="width: 200px; height: 200px; border:1px solid; position: relative">
	<div style="position: absolute; left: 10px; top: 6px; border-radius: 50%; width: 20px; height: 20px; background-color: red;"></div>
	<div style="position: absolute; left: 35px; top: 40px; border-radius: 50%; width: 20px; height: 20px; background-color: red;"></div>
	<div style="position: absolute; left: 62px; top: 60px; border-radius: 50%; width: 20px; height: 20px; background-color: red;"></div>
	<div style="position: absolute; left: 90px; top: 50px; border-radius: 50%; width: 20px; height: 20px; background-color: red;"></div>
	<div style="position: absolute; left: 116px; top: 85px; border-radius: 50%; width: 20px; height: 20px; background-color: red;"></div>
	<div style="position: absolute; left: 152px; top: 80px; border-radius: 50%; width: 20px; height: 20px; background-color: red;"></div>
	<div style="position: absolute; left: 170px; top: 120px; border-radius: 50%; width: 20px; height: 20px; background-color: red;"></div>
</div>

```HTML
<div style="width: 200px; height: 200px; border:1px solid; position: relative">
	<div style="position: absolute; left: 10px; top: 6px; border-radius: 50%; width: 20px; height: 20px; background-color: red;"></div>
	<div style="position: absolute; left: 35px; top: 40px; border-radius: 50%; width: 20px; height: 20px; background-color: red;"></div>
	<div style="position: absolute; left: 60px; top: 60px; border-radius: 50%; width: 20px; height: 20px; background-color: red;"></div>
	<div style="position: absolute; left: 85px; top: 50px; border-radius: 50%; width: 20px; height: 20px; background-color: red;"></div>
	<div style="position: absolute; left: 110px; top: 78px; border-radius: 50%; width: 20px; height: 20px; background-color: red;"></div>
	<div style="position: absolute; left: 135px; top: 99px; border-radius: 50%; width: 20px; height: 20px; background-color: red;"></div>
	<div style="position: absolute; left: 160px; top: 120px; border-radius: 50%; width: 20px; height: 20px; background-color: red;"></div>
</div>
```

Notice each of the circles is a div with a style of `border-radius: 50%`. This makes them circles. 

The container div has been assigned the style `position: relative`. This makes the descendants use this div to determine where left, top, right, and bottom is. 

Each of the child divs has `position: absolute` with this the left and top can set to position the element. 

I wrote this code by hand and it was a lot of work and not very accurate. You want to automate this as much as you can. You will need to write code sets the style of an element on property at a time but if you can try to do this once when possible. 

## After Class 

- Finish Data [Visualization 1](https://github.com/Make-School-Courseshttps://make-school-courses.github.io/FEW-2.5-Data-Visualization-and-Web-Graphics/blob/master/Assignments/Visualization-1.md)

## Resources 

- [Visualization with HTML, CSS, and JS](https://github.com/MakeSchool-Tutorials/FEW-2-5-Data-Visualization-with-HTML-CSS-JS-Tutorial)
- [document.createElement()](https://developer.mozilla.org/en-US/docs/Web/API/Document/createElement)
- [Node.appendChild()](https://developer.mozilla.org/en-US/docs/Web/API/Node/appendChild)
- [HTMLElement.style](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/style)
- [CSS border-radius](https://developer.mozilla.org/en-US/docs/Web/CSS/border-radius)
- [CSS position](https://developer.mozilla.org/en-US/docs/Web/CSS/position)

