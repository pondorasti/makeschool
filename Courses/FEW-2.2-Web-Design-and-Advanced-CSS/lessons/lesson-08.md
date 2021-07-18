# FEW 2.2 - Advanced CSS - NavBars and Layout

CSS Grid is amazing. It needs no abstraction! Flexbox is also amazing and needs no abstractions. This lesson will take a look at both of these and how they can be used in your CSS framework.

## Why you should know this?

To create the layouts that you envision you'll need to use both of these tools. 

## Learning Objectives

1. Create one-dimensional layouts with flexbox
1. Arrange elements on an axis
1. Create a navbar
1. Create a footer

## Slides

https://docs.google.com/presentation/d/1yItvH_ADMhnE4bEWmGb4jrb4xFDhs3Wh_e7EmO66gdY/edit?usp=sharing

## Elements with Class 

Your framework uses selectors to apply styles to elements. Using the tag name allows selectors to apply broadly with little effort. In this way, all of the links and headings will look the same. 

Sometimes you'll want a link or a heading or a div to look different than others. In these cases use a class name. 

Take a look at how [Boostrap](https://getbootstrap.com/docs/4.5/getting-started/introduction/) and [Foundation](https://get.foundation/sites/docs/) use class names. 

Headings, display, and muted text Bootstrap use a few classes to provide alternative typographical styles. In the cases of headings, no class is needed. 

- [Display](https://getbootstrap.com/docs/4.5/content/typography/#display-headings)

```CSS
.display-1 {
  font-size: 6rem;
  font-weight: 300;
  line-height: 1.2;
}
```

- [Muted](https://getbootstrap.com/docs/4.5/utilities/colors/#color)

```CSS
.text-muted {
  color: #6c757d!important;
}
```

[Foundation](https://get.foundation/sites/docs/) (an alternative CSS framework) similarly uses class names. 

- [Text align](https://get.foundation/sites/docs/typography-helpers.html#text-alignment)

```CSS
.text-right {
  text-align: right;
}

.text-center {
  text-align: center;
}
```

- [Subheader](https://get.foundation/sites/docs/typography-helpers.html#subheader)

```CSS
.subheader {
  margin-top: 0.2rem;
  margin-bottom: 0.5rem;
  font-weight: normal;
  line-height: 1.4;
  color: #8a8a8a;
}
```

- [Lead Paragraph](https://get.foundation/sites/docs/typography-helpers.html#lead-paragraph)

```CSS
.lead {
  font-size: 125%;
  line-height: 1.6;
}
```

These classes modify the existing styles and give us new ways to express ourselves with muted aligned displays and subheadings! 

## Challenge: Typographic styles

Add some classes to your framework CSS that support these styles: 

- Display headings. Define 6 styles. Use the [Bootstrap display headings](https://getbootstrap.com/docs/5.0/content/typography/#display-headings) as a guide. 
- Test align classes. Again you can use [Bootstrap text-align](https://getbootstrap.com/docs/5.0/utilities/text/#text-alignment) as a guide. Make a class for text-align right and center. 
- Make a "lead" style. This a style for the first paragraph in a story or article. Usually, the text is a little larger and might be a different color. Could also use some other styles, it's up to you. Use [Bootstrap lead](https://getbootstrap.com/docs/5.0/content/typography/#lead) as a guide. 
- Use CSS Custom properties where you can here! Here are a few places where you might use a custom property:
  - `font-family`
  - `line-height`
  - `color`
  - `margin` and `padding`

## Nav Bars

Navbars are common on all web pages. What makes a good nav bar? 

Look at some navbars. 

- Bootstrap - https://getbootstrap.com/docs/4.0/components/navbar/
- Foundation - https://foundation.zurb.com/sites/docs/v/5.5.3/components/topbar.html

A Navbar is made of a set of several elements that work together. A good approach here is to use a parent element declared with a class name and apply styles to this element's descendants with child and descendant selectors. 

The formula is roughly: 

```CSS
.navbar {
  /* styles for the navbar container */
}

.navbar > ul {
  /* Group elements in a list */
}

.navbar a {
  /* All links in the navbar should have a special style */
}
```

## Markup

The first step is to define some markup that will represent a navbar. The navbar will share markup with other elements to separate it and identify it as unique use a class name. 

```HTML
<div class="navbar">
  ...
</div>
```

Links items on the bar should probably be grouped. A list makes a lot of sense. 

```HTML
<div class="navbar">
  <ul>
    <li></li>
    <li></li>
    <li></li>
  </ul>
</div>
```

The bar is used for navigation so each list item should contain an anchor.

```HTML
<div class="navbar">
  <ul>
    <li><a href="#">Link 1</a></li>
    <li><a href="#">Link 2</a></li>
    <li><a href="#">Link 3</a></li>
    <li><a href="#">Link 4</a></li>
  </ul>
</div>
```

### Title 

Almost always you'll have a title in the navbar. You need to single this out as unique to give it a style that works with the navbar. 

Use a class name. 

```HTML
<div class="navbar">
  <ul>
    <li><h1 class="title">TITLE</h1></li>
    <li><a href="#">Link 1</a></li>
    <li><a href="#">Link 2</a></li>
    <li><a href="#">Link 3</a></li>
    <li><a href="#">Link 4</a></li>
  </ul>
</div>
```

## Styles 

The navbar will need some styles to make it look like a navbar. The colors will be different from what is on the main part of the page but should use colors from your palette of colors. 

Document your code showing the expected structure of the navbar. You can use the child and descendant selectors to your advantage. 

```CSS
.navbar { /* styles for navbar */ }
.navbar > ul { /* style lists in a navbar */ }
.navbar a { /* style anchor in a navbar */ }
```

The navbar links should have interactions. The styles applied to these will interact with styles applied to your general link style. You may need to override some of the styles you defined earlier. 

```CSS
.navbar a:link { /* navbar link */ }
.navbar a:visited { /* navbar vidsited */ }
.navbar a:hover { /* navbar hover */ }
.navbar a:active { /* navbar active */ }
```

You may not have to style some of these. 

### Removing base styles 

The ul and li come with a lot of base styles. Your reset styles may remove some or all of these, you'll need to take care of anything that wasn't covered by reset. 

The ul has the following default styles: 

- padding 
- margin
- list-style

```CSS
.navbar > ul {
  margin: 0;
  padding: 0;
  list-style-type: none;
}
```

## Flexbox 

Use flexbox to arrange things in the navbar. At the top level, you'll want to arrange groups of links on the left and right. 

```CSS
.navbar {
  display: flex;
  justify-content: space-between;
  flex-direction: row;
  align-items: baseline;
}
```

Use `space-between` and `row`. This should place the first list on the left. If there is a second list it should appear on the right. 

Within a ul, you'll also want to arrange elements in a row. 

```CSS
.navbar > ul {
  /* Remove the default styles */
  margin: 0;
  padding: 0;
  list-style-type: none;
  /* Arrange all of the links in a row */
  display: flex;
  flex-direction: row;
  justify-content: flex-start;
  align-items: baseline;
}
```

https://cssreference.io/flexbox/

Set the color and background colors for your navbar. 

```CSS
.navbar {
  ...
  background-color: #222;
  color: #eee;
}
```

### Style links on the navbar

Links on the navbar should be styled. Be sure to include a hover style.

```CSS
.navbar a {
  color: rgb(130, 242, 231);
  text-decoration: none;
  display: inline-block;
  margin: 0.5em;
}

.navbar a:hover {
  color: #fff;
}
```

## Challenge: Navbar

The goal of this assignment is to add a navbar to your CSS Framework. 

Define a navbar style. Use the example code above as a starting point. Feel free to customize this as much as you like! 

- Use a class name for the navbar. `navbar` might be a good choice since anyone can guess this! 
- Be sure to use flex for the layout. 
- Think about the background color and the text color. 
- Navbars will have links. Think about these will appear in the navbar. 
- Include a title style. 

Submit your CSS Framework to GradeScope. 

## After Class

This class will be adding new styles to your CSS framework. Submit your framework with the new styles added. 

Check the work on your CSS framework. So far your framework should have the following: 

- Base font styles 
- Use custom properties
- Button styles 
- Card style 
- Typographic styles covered in the [challenges here](#challenge-typographic-styles)
- Navbar style [covered in the challenges here](#challenge-navbar)

## Additional Resources

1. https://cssreference.io/flexbox/
