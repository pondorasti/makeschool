# WEB 1.0 - JS and the DOM

## Description 

JavaScript is used in a wide variety of applications none is greater than creating web pages. Understanding how JavaScript interacts with HTML and CSS is key to make amazing websites and experienes. 

### What is the DOM?

The DOM or Document, Object, Model is the structure defined by your HTML code. 

The HTML code your write creates a document that is structured and organized. This means your code can access elements based on the structure, or influence or control elements based on the their position in the DOM and their relation to other elements. 

Every element is an Object. An Object in computer terms is a collection of functions and variables. 

Imagine you have a web page that looks like this: 

```HTML
<html>
  <head>
    <title>Hello</title>
  </head>
  <body>
    <h1>Hello World</h1>
    <p>Foo bar</p>
  </body>
</html>
```

We could also describe the structure here in print like this: 

- html
  - head
    - title
  - body
    - h1
    - p

Imagine the diagram as an inverted tree. Here are a few pictures: 

- http://watershedcreative.com/naked/html-tree.html
- https://eloquentjavascript.net/1st_edition/chapter12.html

Here the nest lists show the structure. From the diagrams above we can talk about the elements and describe them based on their position in the tree. 

For example, we could say that html is the root of the tree, and head and body were it's children. 

You could say that h1 and p were siblings, they share the same parent. 

You could also say that h1 and p were children of body and html was their ancestor. 

You can also work your way around the DOM using code. This is something you'll do often in one form or another. You'll need to do this when you write code that needs to change the content or style of a DOM element. For example when someone clicks a button you might want to make an element visible by changing it's style, and display a message by changing the text inside side the tag (innerHTML.) You might do this to create an animated dialog box.

Here is an example:

```JS
const h1 = document.querySelector('h1') // selects the h1 tag
h1.innerHTML = 'JS FTW!' // Changes the text content of the tag
```

In the above example the first line finds an h1 tag using `document.querySelector()`. You provide a description of the element you're looking for, I used the tag name, and querySelector returns first tag that matches that description. 

Here we stored the tag in a variable with a descriptive name for convenience. 

On the second line you set the innerHTML property of the tag. We used the dot syntax. Use dot syntax to access the property of an object. `h1` (the `<h1>Hello World</h1>` in the DOM tree) is an object with properties that describe it. One of these properties is `innerHTML` this property sets the text content between the opening and closing tags.

Let's review. DOM is the Document, Object, Model. It's a tree structure where each element in the tree is an Object. All of these objects have properties that we can access using JS. 


















### Why this assignment?

This tutorial has many of the elements that you would use everyday as a JS developer. This includes: 

- Variables 
  - constants
  - let
- Functions 
  - IIFE
  - callbacks
- Strings 
  - template strings
- Arrays
  - accessors
  - push
  - splice
- JS 
  - scope and closure
  - setInterval
- Flow control 
  - if else 
  - for loops
- JS and the DOM
  - getElementById
  - querySelector
  - querySelectorAll
- CSS 
  - transform: translate3d
  - position: relative/absolute

Beyond the list above this project looks at how to create JS code that can deployed anywhere in an project that plays well with other developer code. This an important subject since JS code by default defines 

## Project requirements

Follow the tutorial: [https://www.youtube.com/watch?v=TV1WbQdusdU&list=PLoN_ejT35AEgjsI-YEuiif2BfpToamnGz](https://www.youtube.com/watch?v=TV1WbQdusdU&list=PLoN_ejT35AEgjsI-YEuiif2BfpToamnGz)

You can view a live version of the tutorial here: 

[https://github.com/soggybag/js-tutorial-slide-show](https://github.com/soggybag/js-tutorial-slide-show)

- You should watch all of the videos in the playlist. 
- Follow the tutorial videos and create the slide show
- Note any questions you have about the concepts covered. 
- Be prepared for a short low stakes quiz on the concepts covered in the following class. 

## Deliverable

- You should have completed the videos and have a functioning slideshow project from the tutorials. 
- A list of questions on the concepts covered

Submit this as a zip file or GitHub repo to Gradescope!

## Stretch Goals

- See the GitHub repo for this tutorial for Stretch challenges: https://github.com/soggybag/js-tutorial-slide-show

## Due date

Class 11, Thu Sept 24

