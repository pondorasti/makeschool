# JavaScript and the DOM

Use JavaScript to access and modify element in the DOM. 

## Learning Objectives

1. Use CSS Position Absolute
1. Use CSS Position Relative
1. Use top, right, bottom and left with `absolute` and `relative` position
1. Compare and contrast `relative` and `absolute` position
1. Use JavaScript to add and remove class names from elements
1. Use interaction to modify the content and appearance of a page

## CSS position relative and absolute

- CSS Position
  - What is `absolute` position?
    - Positions an element based on the top, right, bottom, and left
    - Absolute elements look for a **positioned ancestor** for their context
  - What is `relative` position?
    - Positions an element **relative to where it would normally be placed**
  - Use Absolute and relative position together
    - Using these together let you define a context for elements using  `absolute` position

## `document.querySelector()` and `document.querySelectorAll()`

Use these to select elements in the DOM with a wider variety of options than just id names. 

- `document.querySelector()`
  - Use any valid CSS selector
  - returns the **first** matching element!
    - This is similar to getElementById()
    - or returns null if nothing matches
- `document.querySelectorAll()`
  - Uses any valid CSS selector 
  - Returns a NodeList of all matching elements
    - NodeList is not an array! It can be converted to an array
    - Use `for in` or `forEach` to loop through a collection of elements

- Best practices
  - Use id for unique elements
  - Use `querySelector()` when you have groups of elements or elements that don't have id names or where creating id names is impractical
  - Use `querySelectorAll()` when you need to select a group of elements or want to act on a group of elements. 

## Adding and Removing class names with JS

Class names are a powerful way to control your applications. 
They can be used to define state in a declarative way. 

The idea is to assign a class name to the DOM in a way that declares clearly what the state of the application is. 

Adding a class name describes the state an element should present without actually describing the appearance. This is great for the separation of concerns. 

Important! Styles can be applied based on the structure of the DOM. This means a style can be applied to an element where the **ancestor** has a matching description. 

- Adding a class to the body tag
  - The body is the root element for everything else on the page. Adding a class name here acts as an overarching control. 
- Using the body classes to control UI
  - Style rules follow the hierarchy of the DOM. Rules can be applied when 

- Managing class names with JavaScript
  - Every element has a `classList` property that is a collection containing all of the class names assigned to that element. 
  - The classList is an Object with methods that allow you to manage the list of class names. 
    - `add(String [, String [, ...]])` - Adds a new class name or list of class names
    - `remove(String [, String [, ...]])` - Removes a class name or list of class names
    - `toggle(String [, force])` - Adds a class name if it doesn't exist or removes it if it does
    - `contains(String)` - Checks if a specific class exists in the list
    - `replace(oldClass, newClass)` - Replaces old class with new class
  - https://developer.mozilla.org/en-US/docs/Web/API/Element/classList

## Dialog Box 

- Make a dialog box
  - Use Absolute position to position and display a dialog box
  - Use the `visible` property to hide and show the dialog box

## Overview TT III

- Manipulating the DOM with JavaScript
  - Use JavaScript to add and remove class names
    - What's this good for? 
      - CSS is the best way to control the appearance of a page. 
      Adding and removing classes is easy and provides much control. 
      It also keeps the separation of concerns which allows future changes to be easily applied. 

## In Class Activity II 

- Elements have a classList which supports methods
  - add
  - remove
  - toggle
- Use JavaScript to open and close the dialog box by adding and removing a class name

## After Class

- Stretch Challenge: Clicking a user in the list displays the user's information in a modal popup. 
- Use Mockaroo to generate another custom data set that you invent. Import and display that in a web page. 
- Create a template function that generates HTML. 

## Additional Resources

1. https://developer.mozilla.org/en-US/docs/Web/API/Element/classList
1. http://getbem.com
1. https://www.mockaroo.com
1. https://wesbos.com/template-strings-html/

