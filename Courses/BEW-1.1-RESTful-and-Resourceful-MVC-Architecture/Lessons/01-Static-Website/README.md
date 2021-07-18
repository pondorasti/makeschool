
<!-- .slide: data-background="./../Images/header.svg" data-background-repeat="none" data-background-size="40% 40%" data-background-position="center 10%" class="header" -->
# Static Websites

### [Slides](https://make-school-courses.github.io/BEW-1.1-RESTful-and-Resourceful-MVC-Architecture/Slides/01-Static-Website/README.html)

### [Demo](https://github.com/Make-School-Courses/BEW-1.1-RESTful-and-Resourceful-MVC-Architecture/tree/master/Lessons/01-Static-Website/demo)


<!-- > -->

## Agenda

1. [Learning Outcomes](#learning-outcomes)
1. [HTML Essentials](#html-essentials)
1. [HTML Page Elements](#html-page-elements)
1. [Activity: Form Elements](#activity-form-elements)
1. [Developer Tools](#developer-tools)

<!-- > -->

## Learning Outcomes

By the end of today, you should be able to…

1. Recognize the most common HTML tags and their standard formatting
1. Make a static web page using HTML
1. Create a form to collect user data using HTML
1. Use a browser’s developer tools to examine and change the HTML of a website

<!-- > -->

## Warm Up (5 minutes)

Write a list of every HTML element you know, and its purpose. Write as many as you can!

- E.g. `head`, `body`, `img`, etc

<!-- > -->

# HTML Essentials

<!-- v -->

## What is HTML?

- **H**yper**T**ext **M**arkup **L**anguage
  - Not a programming language! No loops, conditionals, etc
- Tells your browser how to structure content (text, images, links, etc)

<!-- v -->

## Elements

The fundamental building block of HTML is an **element**.
  - Can have an opening and closing tag
  - Or only a single tag

Tags are enclosed in angle brackets ( `<` and `>` )

<!-- v -->

## The Document Type Declaration

At the top of every HTML page, we need to tell the browser what type of markup to expect.

```html
<!DOCTYPE html>
```

- The **doctype** tag is technically not an element.

<!-- v -->

## The `html` element

All page content must go inside of the `html` start/close tags.

```html
<!DOCTYPE html>
<html>
</html>
```

<!-- v -->

## The `head` element

Content that doesn't directly relate to the way the page is laid out - including the styles and title - go inside of the `head` element.

```html
<!DOCTYPE html>
<html>
    <head>
        <title>My Awesome Page Title</title>
    </head>
</html>
```

<!-- v -->

## The `body` element

The body contains all of the elements that will be displayed on the page itself.

```html
<!DOCTYPE html>
<html>
    <head>
        ...
    </head>
    <body>
        This will appear on the page.
    </body>
</html>
```

<!-- v -->

## Demo

Let's put it all together! Save the code snippet below and open it in your browser.

```html
<!DOCTYPE html>
<html>
    <head>
        <title>My First Web Page</title>
    </head>
    <body>
        Hello, World!
    </body>
</html>
```

<!-- > -->

# HTML Page Elements

<!-- v -->

## Anatomy of an HTML Element

![](assets/basic-anatomy-of-xhtml-elements.png)

<!-- v -->

## Header Tags

Headers are used to set apart page, section, etc. headers.

`h1` is a top level heading. We can use `h1` to `h6` for different sized headers.

```html
<body>
    <h1>Why Dogs are Cool</h1>
    <p>Dogs are cool because...</p>
</body>
```

<!-- v -->

## Paragraph Tags

The paragraph tag `<p>` is used to indicate a paragraph of text.

```html
<body>
    <h1>Why Dogs are Cool</h1>
    <p>Dogs are cool because...</p>
</body>
```

<!-- v -->

## The Address Tag

The address, or `<a>` tag, links to another web page.

- `href` is an **attribute** that indicates the destination.

```html
<a href="http://www.aspca.org">Adopt a Dog!</a>
```

<!-- v -->

## The Image Tag

The `img` element is a **self-closing tag**. We often end it with `/` to indicate such.

- Images must also have an **alt** attribute which describes the image in text.

```html
<img src="http://makeschool.com/images/dog" alt="cute dog" />
```

<!-- v -->

## Line Breaks

We can add a **line break** like so:

```html
<br />
```

<!-- v -->

## Bold and Italics

We can specify that text should be **bold** with the `strong` tag, or *italic* with the `em` (emphasize) tag.

```html
<p>
    Dogs are <strong>fluffy</strong> and <em>playful</em>.
</p>
```

<!-- v -->

## List Items - Unordered

We can make a bulleted **unordered list** with the `ul` tag, and add list items with the `li` tag.

```html
<p>
    I like dogs because they are...
    <ul>
        <li>fluffy</li>
        <li>playful</li>
    </ul>
</p>
```

<!-- v -->

## List Items - Ordered

We can also make an **ordered list**, starting from 1, with the `ol` tag.

```html
<p>
    My favorite dogs (in order) are:
    <ol>
        <li>Husky</li>
        <li>Chocolate Lab</li>
        <li>Shiba Inu</li>
        <li>Golden Doodle</li>
    </ol>
</p>
```

<!-- > -->

## Break [10 minutes]
<!-- .slide: data-background="#087CB8" -->


<!-- > -->

# HTML Forms

<!-- v -->

## Why use forms?

1. Collect data about the user<!-- .element: class="fragment" -->
1. Ask the user a question<!-- .element: class="fragment" -->
1. Login or registration forms<!-- .element: class="fragment" -->

<!-- v -->

## A Simple Form

```html
<form action='/results' method='GET'>
  What is your name?
  <input type='text' name='firstname'>
  <br>
  <input type='submit' value='Submit!'>
</form>
```

<!-- v -->

## Anatomy of a Form

Form attributes:

- `action`: What URL am I sent to when I submit the form?
- `method`: Is it a GET or a POST request?

```html
<form action='/results' method='GET'>
```

<!-- v -->

## Anatomy of a Form

Form element attributes:

- `type`: What type of data am I collecting (e.g. number vs. text), and in what format?
- `name`: What *label* am I putting on the data? *Hint*: This is kind of like a variable name!
- `value`: What is the *default value* of the form element?

```html
<input type='text' name='favorite_color' value='blue'>
```

<!-- > -->

# Activity: Form Elements

<!-- v -->

## Jigsaw Activity [30 min]

Get into groups of 4 or 5 and research a *specific* form element. Within your group, do the following:

- Test out the form element in your browser. How does it work?
- What *attributes* (such as `name`, `value`, etc) are required to use this form element? What do they do?
- What *query string* results when you submit the form?

*Every* person in the group *must* be able to present the findings!

<!-- v -->

## Form elements

- [select/option](https://www.w3schools.com/tags/att_select_form.asp)
- [datalist](https://www.w3schools.com/tags/tag_datalist.asp)
- [radio buttons](https://www.w3schools.com/tags/att_input_type_radio.asp)
- [checkbox](https://www.w3schools.com/tags/att_input_type_checkbox.asp)
- [date](https://www.w3schools.com/tags/att_input_type_date.asp)
- [color](https://www.w3schools.com/tags/att_input_type_color.asp)


<!-- v -->

## Jigsaw Activity Pt. 2

Form expert groups around your table. Fill in the rest of your worksheet for *at least four* input elements.

<!-- > -->

# Developer Tools

<!-- v -->

## Demo

<!-- > -->
<!-- .slide: data-background="#087CB8" -->

## Homework

- [Homework 1](https://make-school-courses.github.io/BEW-1.1-RESTful-and-Resourceful-MVC-Architecture/#/Assignments/Weekly-Homework?id=homework-1): Due Monday, Oct. 28


<!-- > -->

## Resources

- [HTML Basics](https://www.w3schools.com/html/html_basic.asp)
- [HTML Form Elements](https://www.w3schools.com/html/html_form_elements.asp)
- [Chrome Developer Tools](https://developers.google.com/web/tools/chrome-devtools)