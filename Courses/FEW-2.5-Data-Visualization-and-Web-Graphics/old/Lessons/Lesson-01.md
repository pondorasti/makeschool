# FEW 2.5 Intro to Data Visualization

The goal of this lesson is to get started with data visualization. You will look at the features of making information visible and represented graphically using HTML, CSS, and JavaScript. 

## Why do you need to know this?

Being able to display things on the screen is a core feature of computer software. It's what connects people to the computer. Having this skill in your back pocket is important for making software that is engaging and compelling to your users. 

The skills learned to make data visualizations will translate to making you a better programmer and give you new ideas on how to approach visual problems on the computer.

If you are interested in data, what it means, and how it communicates to people this class will give you an opportunity to explore and create.

## Learning Objectives

- Define data visualization
- Load Data from JS
    - Identify and avoid CORs problems
- Identify values in the Titanic dataset
- Extract data and derive relevant values 
    - map, filter, reduce
    - min, max, average
- Display data in the DOM

## Overview

- What is data visualization?
    - Some examples of Data visualization
- Titanic Dataset
    - What does it contain?
    - How can this be visualized? 
        - min, max, average
    - Styles 
        - width
        - height
        - backgroundColor
        - Using Flex 
        
## Infographic vs Data Visualization

Let's clarify what you are expected to make.

- An infographic provides information in the form of an image. These are often more comic strip and less abstract. The goal is to inform. 

- [Info Graphic](https://venngage.com/blog/what-is-an-infographic/)

- A data visualization is more abstract showing data in visual form. 
    - tl;dr - It's mostly about coverting numbers into pictures

**Data visualizations examples**

- [Data visualization](https://datavizcatalogue.com)
- [Examples](https://www.maptive.com/17-impressive-data-visualization-examples-need-see/)
- [What is data visualization](https://www.tableau.com/learn/articles/data-visualization)
- [Tableau Best Data viz examples](https://www.tableau.com/learn/articles/best-beautiful-data-visualization-examples)
- [Best Data Visualizations 2018](https://visme.co/blog/best-data-visualizations/)
    - [James Round](https://www.jamesrounddesign.com)
	
### Activity

Use the links above to answer the questions

- What is data visualization? 
- What is data?

## Getting started 

- JSON 
	- All of the sample data is JSON
	- What is JSON?
	- Validating and formatting JSON
	- Loading JSON with Fetch
	 - CORS
		- What is CORS
		- How to deal with it

## What's Data? 

Most fo th time it's numbers but data can be almost any collection of information. 

For today we'll take a look at the Titanic data set. 

## The Titanic Dataset

Take a look at the [Titanic Dataset](https://www.kaggle.com/c/titanic/data). This link points to the Titanic dataset on Kaggle. There is also a copy in the tutorial repo. 

Take a look at the data, ask yourself what you see? 

- There is a record for each passenger
- Each passenger has fields for a range of data points
    - age, fare, pclass, sex, etc. 

What values can you find here? What would you want to know from this? 

Pair and discuss. Come up with a list of things you find interesting. List as many things as you can. 

Write the list on the board. 

### Examining Data

Data usually ends up in one of several forms:

- Boolean 
    - survived (Yes, No)
- Fixed choices 
    - pclass (1,2,3)
    - sex (M, F)
    - embarked (C, Q, S)
- Numbers 
    - fare 
    - parch (number of parents/children)
    - sbsp (number of siblings/spouses)
    - age 
- Arbitrary string (could be anything)
    - ticket (eg. "Fa 265302")

Booleans and Fixed Choices can be mapped to values for example: gender could be mapped to colors. 

### Normalizing 

Numbers need to be normalized. This is the process of converting values from their original ranges into a common range that can be displayed. 

For example imagine you want to graph the ages of passengers on the Titanic? The youngest was 0 years and the oldest was 80 years. While these are nice numbers, they don't translate well to the screen. You could make a bar 0 pixels and 80 pixels tall. This is not very flexible, 80 pixles tall might be too big or too small, and 0 is not visible. 

Before you display anything you want to normalize your data. Do thi by finding: 

- min value 
- max value 
- range (max - min)

Create a common range by dividing the value by the max value. This gives a range of 0 - 1. This normalized range can be scaled to fit any other range.

Imagine you need to graph the ages of passengers and the bars need to be 500px tall. 

- Watt, Mrs. James (Elizabeth \"Bessie\" Inglis Milne)
- age 40

`40 / 80 * 500 = 250`

- Bengtsson, Mr. John Viktor
- age 26

`26 / 80 * 500 = 162.5`

### Counting

Some times you need to know how many of something that occurs. This is good for finding an average for example. 

`totalAge / numberOfPassengers = averageAge`

Or you might want to know how many passengers got on at an embarkation point.

### Aggregrating 

Aggregating data is adding it all up to get the sum. For example you might want to know the total money spent on tickets or get the total siblings and spouses. 

### Filtering 

Sometimes you'll want to look at a subset of your data points. For example you might want to look at the male, female, or passengers that got on at one embarkation point. 

### Cleaning data 

Data sets are not always perfecxt. Often there will be missing values. Not every record will have all all values or some values will be something other than the number you were expecting. 

Other times values might be interpreted as a string but it's actually a number. 

You'll need to look for these problematic values and decide how to work with them. 

- Ignore them
- Use a default value like 0
- Or use a random value from within the range of possible values

## Loading Data 

Load the JSON data with fetch. 

```JS
fetch('titanic-passengers.json')
    .then(res => res.json())
    .then(json => handleData(json))
    .catch(err => console.log(err.message))
```

If you're loading data from your desktop you'll run into CORS errors at some point. 

### CORS

CORS - Cross Origin Resource Sharing, is a a security feature built into the browser. It's also a headache for developers. In a nutshell it prevents JavaScript in the browser from reading files on your file system. 

The easy solution for you is to run your work from a local server. This is the solution that will work for all of the work in this class and will usually solve common CORS errors. 

- Use a plugin like Liver Server 
- Local server like nodemon

For more info read these articles.
	
- https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS
- https://medium.com/@baphemot/understanding-cors-18ad6b478e2b
 
## Exercise

Pair up and count, aggregate, normalize, and filter your data! 

Using the Titanic dataset

- Load the data set

```JS
fetch('titanic-passengers.json')
    .then(res => res.json())
    .then(json => handleData(json))
    .catch(err => console.log(err.message))

function hanldeData(data) {
    ...
}
```

- Count the passengers
- Count the male and female passengers
- Count the survivors

### Interview Questions 

These questions are a lot like the types of questions you might see at an interview. 

- Count the passengers -> Number
- Count male and female passengers -> [Number, Number]
- Count the survivors -> Number
- Count the non-survivors (diers?) -> Number
- Get the average age -> Number
- How many passenger classes -> Number 
- How many passengers in each class -> [Number, ... ]
- How many died in each class -> [Number, ... ]
- Get all of the ages from the Titanic Dataset -> [Number, ...]
    - Filter datapoints where the age is missing
- How many passengers from Queenstown
- How many people travelled with a nanny?
- How many passengers had siblings? -> Number
- What is the survival rate of siblings vs only children? -> Number
    - Aggregate passengers with siblings 
    - Count the survivors with siblings 
    - Divide by the passengers with siblings count
    - Repeat for passengers without siblings

## Display things on the screen

- document.createElement()
- element.appendChild()
- element.style
    - height, width
    - backgroundColor
    - border
    - borderRadius

**Challenges**

- Make make a div for each passenger
    - Give it a height, width, and background-color

## After Class

Start on [Visualization 1](Assignments/Visualization-1.md). Your goal is to make one visualization per week. The first week will use the Titanic Dataset. 

Before you can visualize data you need to have data. Follow this [Tutorial](https://github.com/MakeSchool-Tutorials/FEW-2-5-Data-Visualization-Working-with-Data/tree/master) and solve all of the challenges. 

## Additional Resources

- [Array.map()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/map)
- [Array.filter()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/filter)
- [Array.reduce()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/Reduce)
- [Math.max()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/max)
- [Math.min()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/min)
- [document.createElement()](https://developer.mozilla.org/en-US/docs/Web/API/Document/createElement)
- [Node.appendChild()](https://developer.mozilla.org/en-US/docs/Web/API/Node/appendChild)
- [HTMLElement.style](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/style)
