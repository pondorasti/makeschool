# FEW 2.2 - Assignment 5 - Start your Framework: Fonts 

## Description 

This is the first step in the larger goal of creating CSS framework. 

The goal of this first step is explore CSS frameworks and start deciding what you'd like to include in your framework. 

### Why this assignment?

The web is dominated by text content. To get noticed and make sites that people enjoy reading your type should look good. If you're making web sites having some consistent styles that you can easily apply without having to write all of the styles from scratch will speed up your work flow. 

## Getting Started 

Start by exploring CSS frameworks. The framework we will be making will make use of all of the things we have covered in class. 

- SASS - It can be written in the scss language. Remember it will need to be compiled into CSS form! 
- CSS Custom properties - Use variables to make your framework easily cusomizable
- CSS Grid - Where Frameworks like Bootstrap dedicate a lot of code to layout with a grid we will be using CSS grid and **won't** be including CSS that defines grid. This will have the advantage of making your framework smaller and easier to manage. 

Explore some existing frameworks.

- https://getbootstrap.com 
  - https://getbootstrap.com/docs/4.3/components/alerts/
  - https://getbootstrap.com/docs/4.3/examples/
- https://bulma.io
  - https://bulma.io/documentation/
- https://tailwindcss.com
  - https://tailwindcss.com/components
- https://semantic-ui.com
  - https://semantic-ui.com/elements/button.html
- https://foundation.zurb.com
  - https://foundation.zurb.com/develop/building-blocks

Look through the code in the frameworks above. Look particularly 

- What the components and features of the framework look like?
- How they implement the features 
  - These frameworks use class names combined with an html structure to create many of the standard UI elements you might find on any website. Exmine these closely you will be implementing your own set of UI elements. 

## Project requirements

You need to create a repo for your framework. Think of a name for your framework. This is a software product it needs a name! Here are a few I thought of: 

- Frmwrk
- Framwërk
- Chonky CSS
- Ninja CSS
- CSSS - Chonky Styles Solidly Served
- CSSSS - CSS Served with Solid Sagacious Style 
- CSSSSS - Colorful Simple Seamless Safely Served Styles 

The goal for this assignment is to start your framework by defining styles that define good looking typography. 

You need to define typographic styles for your framework. Think about making a legible, easy read, and good type. You should style all of the default text. Style the color and the background color. Make sure the contrast meets the [guide lines](https://webaim.org/resources/contrastchecker/). 

### What should you style? 

Copy this file, add a stylesheet and apply styles: [sample HTML doc from class 5](../lessons/lesson-05.html). Read the page and follow the instructions for each challenge. They all involve adding styles.

### Use Custom Properties 

Move as many values as practical into CSS custom properties in an easily accessible location of your stylesheet. 

Use CSS Custom Properties. Set all of the things that should adjustable in a custom property and move it to the top. 

Consider using a separate stylesheet for all of the custom properties. By putting these into a separate file you can can create multiple files that define different themes. For example linking to 'chonky-dark.css' and 'chonky.css' would give you the dark theme. 

### Deliverable

Link to your repo.  

### Due date

Class 6

## Assessing the assignment

| Expectations | Does not meet              | Meets                 | Exceeds                          |
|:-------------|:---------------------------|:----------------------|:---------------------------------|
| Completion   | You have only completed some of the items described in the homework description | The changes you have made feel complete and cover all of the important elements on the page: headings, body copy, footers, links, blockquotes, etc. | Besides you making changes to typography you have shown your work to others and incorporated their feedback. Your framework could be applied to a future project and would apply a reasonable set of styles |
| Quality      | The styles don't improve on the default styles applied by the browser | Applying your stylesheet to the sample document makes the test read well **without applying more styles**  | When using your stylesheet and no other styles the sample document looks as good as any of the other frameworks listed above. |
| Comprehension | Can't explain how and why you are making this CSS framework | Can explain the rationale behind making the framework and offer insight as to where and when it would be good to use a CSS framework. | You have a plan for this framework and see a path through to making something that could be applied to almost any website |
| Work ethic   | few massive commits | Commits outline progress. Your repo has a readme that explains the purpose of the work | The progress of your work is clearly outlined by commit messages. |
