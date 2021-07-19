<!-- .slide: data-background="./Images/header.svg" data-background-repeat="none" data-background-size="40% 40%" data-background-position="center 10%" class="header" -->
# FEW 1.1 - CSS Intro

<div>CSS Intro</div>

<!-- Put a link to the slides so that students can find them -->

➡️ [**Slides**](/Syllabus-Template/Slides/lesson1.html ':ignore')

<!-- > -->

### Learning Objectives

1. Describe CSS it's use and syntax
1. Use CSS styles to define the appearance of text on the screen
1. Use basic selectors to target styles to elements
1. Define a base font style for a document
1. Use flex box to arrange things in a page

<!-- > -->

### Why you should know this

CSS is powerful gives you full control of the appearance of everything you see on the screen. To be a front end engineer you need to be a master of CSS. 

<!-- > -->

### Download the sample Files

Take a look at the Android Phones & Tablets page. 

https://www.android.com/phones-tablets/

Download the source code from our example here: https://github.com/soggybag/learn-markup-level-2

<!-- > -->

Open the example file: **challenge-01-solution.html** in your browser and your code editor. We will make changes to the source code and view the changes in the browser. 

<!-- > -->

# CSS Intro

<!-- > -->

### In Context

CSS is part of the sepration of concerns that make up web development.

- **HTML** - Defines the structure
- **CSS** - Applies presentation 
- **JavaScript** - Handles the business logic

We have a separate language that is specialized for each purpose. 

<!-- > -->

### An Analogy

Here is an analogy. 

- **HTML** - The bones
- **CSS** - The Skin 
- **JavaScript** - The Muscles

<!-- > -->

### CSS - The Language

Styles are written in the CSS language. 

CSS code can be used in a few places.

- files with the `.css` file extention 
- in the `<style></style>` tag in an HTML document
- inline styles using the `style=""` attribute

<!-- > -->

**style.css**

Written in this file: 

```CSS
body {
  margin: 0;
  background-color: #eee;
}
```

<!-- > -->

use the style tag anywhere in your HTML document. 

```HTML
<style>
  body {
    margin: 0;
    background-color: #eee;
  }
  ...
</style>
```

<!-- > -->

Inline styles are written in the style attribute of the tag. This applies to any tag. 

```HTML
<h1 style="color:red; font-size:2.5em">Hello World</h1>
```

<!-- > -->

### Style Rules

<!-- > -->

### Example

CSS is written as style rules that might look like this:

```CSS 
body {
  margin: 0;
  font-family: Helevtica;
  font-size: 14px;
  background-color: #eee;
  color: #444;
}
```

<!-- > -->

### Selector

A rule begins with a selector

```CSS 
p { /* <-- Selector */
  ...
}
```

This is a selector. This rule applies to all `<p>` tags in a document. 

<!-- > -->

Selectors come in many different types. Selectors are almost a language to themselves!

```CSS
header { ... }   /* tag selector    <header>  */
.title { ... }   /* class selector  <h3 class="title">  */
#content { ... } /* id selector     <ul id="content">  */

#content a { ... }          /* descendant selector */
header > p { ... }          /* child selector */
ul li:nth-child(2n) { ... } /* complex selector */
```

<!-- > -->

#### DOM Tree

The DOM is a tree structure. It's important to understand this when talking about CSS selectors. Many of them work based on the tree. 

```HTML
<body>
    <header>
        <h3 class="title">
        <p>
    <p>
    <ul id="content">
        <li>
            <a>
        <li>
            <a>
        <li>
            <a>
```

<!-- > -->

### Selector Practice

CSS Diner - https://flukeout.github.io

<!-- > -->

### Break

Take a 10 minute break

<!-- > -->

### Properties and Values

These are properties and values. 

```CSS 
margin: 0;
font-family: Helevtica;
font-size: 14px;
background-color: #eee;
color: #444;
```

Properties and values are always separated by a colon. 

Property names in CSS are always kabob-case

**And end with a semicolon!**

<!-- > -->

### Units

There are variety of possible values some require a unit.  


<table><tr><td width="50%">

- `0` - doesn't need a unit
- `Helevtica` - Font Name
  - "Times New Roman" - When a value contains spaces use the quotes
- `14px` - Pixels
- `#eee` - hex color

</td><td width="50%">

- `1fr` - fraction
- `2em` - em (same as the font size)
- `4rem` - root em (based on root font size)
- `50%` - fifty percent
</td></tr></table>

<!-- > -->

### Example

A style rule starts with a selector. And contains a list of property value pairs. 

```CSS
selector {
  property: value;
  property: value;
  ...
}

p {
  font-size: 1em;
  color: #333;
}
```

<!-- > -->

# Putting CSS into Practice

<!-- > -->

CSS will take a long time to master. 

We will start with basic concepts which you can expand upon to build your skills. 

The web is mostly text. Controlling typography will be an important skill. 

<!-- > -->

Follow these steps: 

1. _Set a base font style_ on the body
1. Style the big things first
1. **Work your way to the details**

<!-- > -->

### Setting a base font style.

All other elements will inherit these styles.

```CSS
body {
  font-size: 16px;
  font-family: Helvetica;
  color: #333;
}
```

Other rules my effect how the inherited value is calculated.

<!-- > -->

### em

When we set `font-size` we often set the size in `em`s. This is a relative unit. It represents a multiple of the current font size. 

```CSS
body {
  font-size: 16px;
  font-family: Helvetica;
}

h1 { 
  font-size: 2em; /* 2 x 16px = 32px */
}
```

<!-- > -->

`em` as a unit is also good because it allows you to size elemnts in the same units used for type. This makes for pleasing design. 

<!-- > -->

### Activity

Take a look at this:  https://www.android.com/phones-tablets/

Open the sample code: https://github.com/soggybag/learn-markup-level-2

<!-- > -->

### Structure

- The entire page is in a section
- The page is divided into sections
- Each section begins with header
- Most sections ends with a footer

<!-- > -->

The page is divided into sections. Each section begins with header and the header contains an h2 followed by an h3. 

On the Android site h2 is smaller than the h3. 

<!-- > -->

Add some styles to this page. 

```css
body {
  font-family: Helvetica;
  font-size: 16px;
}

h1 { font-size: 1em; }
h2 { font-size: 1em; }
h3 { font-size: 4.5em; }
```

Changing the font size on the body will change the size of the fonts relatively on the other elements.

<!-- > -->



<!-- > -->

### Wrap Up (5 min)

- Work on the [Single Page Project](../assignments/assignment-03.md)

<!-- > -->

### Additional Resources

1. https://www.android.com/phones-tablets/
1. https://github.com/soggybag/learn-markup-level-2/blob/master/challenge-01-solution.html
1. https://flukeout.github.io

