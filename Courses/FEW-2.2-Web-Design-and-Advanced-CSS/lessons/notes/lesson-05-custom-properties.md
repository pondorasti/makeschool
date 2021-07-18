# FEW 2.2 - Advanced CSS - CSS Custom Properties 

CSS Custom properties are a feature that allows you to define variables that you can use in CSS. Custom properties are native in the browser. 

## Why you should know this?

CSS Custom Properties are a new game-changing feature. This expands what you can do with the CSS language immensely. 

Besides making your CSS code skills up to date it will empower your projects with cutting edge CSS tech, save you time and make your CSS more flexible and powerful. 

## Learning Objectives

1. Explain CSS Custom Properties their features and use cases 
2. Use CSS Custom properties in real-world applications
3. Use Math operations in CSS with calc()
4. Use Reset CSS to remove browser inconsistencies

## Styling buttons 

Before we start styling buttons we need to answer these questions:

- What's a button? 
- When do we use them? 
- What do they look like? 

Before you start to design your buttons it's good to take a look at what other people are doing. Take a look at these: 

- https://getbootstrap.com/docs/4.5/components/buttons/
- https://get.foundation/sites/docs/button.html
- https://material.io/components/buttons

Now answer these questions:

- What properties do you see here? 
- What different styles are offered?

### Making your buttons

Let's start by emulating the ideas in Bootstrap, Foundation, and Material. These are part of a larger language of what people consider "buttons". 

Start with this Repl. 

https://repl.it/join/evglxucp-mitchellhudson

Using the Repl above create a style for the button. 

## CSS Custom Properties

CSS Custom Properties let you define variables in CSS. You're defining a new CSS property, hence the name. In use, it feels like variables that you are familiar with from other languages. 

### Defining a custom property

Properties names must begin with `--`, rest of the name can be anything that would normally work in CSS (think: kabob-case). 

CSS Custom properties must be defined in a block. 

```CSS
--color_primary: rgba(123, 37, 44, 1.0); /* BAD! */


body {
  --color_primary: rgba(123, 37, 44, 1.0); /* Good! */
}
```

The block where a custom property is defined determines the scope of that property. 

```CSS 
body {
  /* Accessible to body and it's descendants */
  --color-primary: rgba(123, 37, 44, 1.0); 
  --font-size: 18px;
}

h1 {
  /* Available to all h1 and their descendants */
  --font-size: 2em;
}
```

Assigning a value is like setting the value of a property in CSS.`:root` is a special selector that represents the root of your CSS scope. All other elements descendants `:root`. Defining variables here make them accessible to all other elements. Think of this as global scope. 

```CSS
:root {
  --color: red;
  --primary-color: rgba(123, 37, 44, 0.7);
  --size: 121px;
  --base-font-size: 16px;
  --large-font-size: 1.85em;
  --number-of-columns: 4;
  --golden-ratio: 1.618;
}
```

### Values 

Any value that would work in CSS can be assigned to a property. 

```CSS
:root { /* Define custom properties on :root */
  --golden-ratio: 1.618; /* number no unit */
  --base-font-size: 16px; /* number with a unit */
  --bg-color: #333; /* Color */
  --base-font: Helvetica; /* Name or string */
}
```

## What's `:root`?

`:root` is a pseudo-element that matches the root element of the document tree. This is identical to the `<html>` element. `:root` has a higher [specificity](https://developer.mozilla.org/en-US/docs/Web/CSS/:root).

By declaring custom properties on `:root` they become global and available everywhere. 

Otherwise declaring a custom property on an element makes it available to that element and inherited by the element's descendants, but unavailable to it's ancestors. 

### Accessing custom property values

To access the value of a custom property use the `var()` function.

```CSS
.some-class {
  width: var(--size);
  color: var(--color);
  background-color: var(--bg-color);
}
```

For example, you might define some values in `:root` then use those values throughout the rest of your stylesheet. 

```CSS
:root {
  --golden-ratio: 1.618;
  --base-font-size: 16px;
  --large-font-size: 1.85em;
  ...
}

.main {
  --number-of-columns: 4;
  ...
  grid-template-columns: repeat(var(--number-of-columns), 1fr);
}

.alert {
  --color: red;
  --size: 121px;
  ...
  color: var(--color);
  width: var(--size);
  ...
}
```

### Design a Button 

Using your button take the ideas below to use custom properties to make your button code more flexible. 

The default button style is not very interesting it's also pretty small. Giving the button some color and making it a little larger will make it easier to use. 

```css
button {
  padding: 0.5em 0.75em;
  background-color: #fff;
  border: 1px solid;
  color: cornflowerblue;
  border-radius: 0.5em;
  font-size: 1em;
  transition: 300ms;
}

button:hover {
  background-color: cornflowerblue;
  color: #fff;
}
```

Here you have a button with a base style and a simple hover. 

```html
<button>Hello World</button>
```

Some custom properties will make this easier to manage. The button uses the same color for the background and foreground but switches these on hover. 

```css
button {
  --bg-color: #fff;
  --fg-color: cornflowerblue;

  padding: 0.5em 0.75em;
  background-color: var(--bg-color);
  border: 1px solid;
  color: var(--fg-color);
  border-radius: 0.5em;
  font-size: 1em;
  transition: 300ms;
}

button:hover {
  background-color: var(--fg-color);
  color: var(--bg-color);
}
```

Now the colors can be edited in one location. 

You'll often want buttons with different colors for different purposes. Look at the button styles in Bootstrap. Your goal is to emulate some of these. 

To change the colors and other styles of buttons using custom properties become very flexible. 

Using a class name: 

```css
button.warning {
  --fg-color: tomato; /* Red button */
}

button.action {
  --fg-color: yellowgreen; /* Green button */
}
```

```html
<button>Login</button>
<button class="warning">Delete</button>
<button class="action">Buy Now!</button>
```

**In your button example create classes for:**

- Success 
- Alert 
- Dark

What if you want to have an inverted style for your buttons? Using custom properties you can add a class that switches where the colors are applied. 

Here the `.invert` class just sets the `color` and `background-color` properties but swaps which color is used where. **These rules override the other since a selector with the class is more specific.**

```css
button.invert {
  color: var(--bg-color);
  background-color: var(--fg-color);
}

button.invert:hover {
  background-color:var(--bg-color);
  color: var(--fg-color);
}
```

```html
<button class="warning invert">Delete</button>
```

**Add an inverted style to your button styles**

What if you want to customize the color of the button? You could write another class or you could set color properties inline.

```html
<button style="--bg-color: violet; --fg-color: #fff">Use Locaton</button>
```

If your code defines colors as a theme you can use those inside your buttons by assigning their value to the properties used by the button. 

```css
:root {
  --primary-color: cornflowerblue;
  --foreground-color: #fff;
}

button {
  --bg-color: var(--foreground-color);
  --fg-color: var(--primary-color);

  ...
}
```

Now you can change the colors of all buttons and other elements that use the `--primary-color`, or change the color of any button by changing it's `--bg-color`. 

### Challenges

For all of the challenges here add an example and sample code to your CSS framework sample. 

Take a look at the buttons defined in Bootstrap. They have 9 styles: 

- Primary
- Secondary
- Success
- Danger
- Warning
- Info
- Light
- Dark
- Link (this is not a button)

Your goal is to define a style for all of these using custom properties. You'll need to define colors for each and think of a style. Don't overthink this. It's more important to get this done than it is to create new and innovative button styles. If you're having trouble thinking of styles copy Bootstrap! 

Your buttons should have the following features: 

- hover 
- transition
- Uses custom properties
- Has an inverted or outline class/style

**Stretch Challenge**

Take a look at the Bootstrap button it has a large and small size. 

https://getbootstrap.com/docs/4.0/components/buttons/#sizes

Implement large and small button sizes in your CSS framework. 

Sometimes buttons are disabled. Bootstrap does this. 

https://getbootstrap.com/docs/4.0/components/buttons/#disabled-state

Implement a disabled state in your framework. 

### Math with CSS calc()

CSS supports basic math through the `calc()` method. You can use `+`, `-`, `*`, and `/`. 

```CSS
.heading {
  font-size: calc(16px * 1.85);
}

.input[type=text] {
  padding: calc(1em * 1.5);
}

.alert {
  margin: calc(1em + 5px);
}
```

The beauty of `calc()` is the ability to mix units! It may not seem like much but ask yourself what you would need to do to make this calculation: 

```CSS
calc(1em * 1.5px + 2%)
```

This is more complicated than it looks. Before you could solve the math above you need to convert all values to a common unit! With `calc()` this happens automatically, like magic!

Custom properties work with `calc()`. 

```CSS
.heading {
  --size: 16px;
  font-size: calc(var(--size) * 1.85);
}

.input[type=text] {
  --scale: 1.5;
  padding: calc(1em * var(--scale));
}
```

Pro tip! If you have a value that is just a number without a unit you can convert it to a number using `calc()` like this:

```CSS
.box {
  --size: 100;
  height: calc(var(--size) * 1px);
}
```

The code sample above changes the value of `--size` from a unitless value of `100` into `100px`.


## Fallback values 

Use a fall back value when a property may not exist. 

```CSS
.box {
  background-color: var(--bg-color, '#2478fe');
}
```

You can use a custom property as a fallback value! 

Imagine `--background-color` is sometimes defined inline. When it is you want to use it. When it is not you want to use `--primary-color` defined in `:root`. 

```CSS
:root {
  --primary-color: #2478fe;
}
...
.box {
  background-color: var(--background-color, var(--primary-color));
}
```

```html
<div class="box"></div><!-- '#2478fe' -->
<div class="box" style="--background-color: #ff8534"></div><!-- '#ff8534' -->
```

In the above example, the fallback value allows you to have a value that may not exist first div.box and use-value when it does exist in the second div.box. 


## Setting Custom properties with JS

With JS you can set any CSS property on an element. 

```JavaScript
const box = document.getElementById('box')
box.style.width = '100px'
```

All CSS properties work here. Names are converted to camelcase. 

```JavaScript
box.style.borderWidth = '1em' // border-wdth
box.style.borderColor = 'red' // border-color
```

An alternate method is to use: `element.setProperty()`

```JavaScript
const box = document.getElementById('box')
box.setProperty('width', '100px')
box.setProperty('border-width', '1em')
box.setProeprty('border-color', 'red')
...
```

Custom properties don't exist in the standard JS world and even if they did you couldn't use the `--` in the name. So `element.style.--size` is not going to work. Use `element.setProperty()` for setting custom properties. 

```JavaScript
const box = document.getElementById('box')
box.setProperty('--primary-color', '#ff8844')
box.setProperty('--size', '230px')
box.setProeprty('--font-family', 'Helvetica')
```

You can also get the value of a custom property, or any property via JS. 

```JavaScript
const box = document.getElementById('box')
const size = box.getProperty('--size') // get a custom property
const color = box.getProperty('color') // get a standard property
```

## Reset CSS

The reason HTML that you write looks the way it does is because the browser applies default CSS styles to elements. 

These styles are not always consistent across browsers. While the [W3C](https://www.w3.org) defines the standards for the web it's browser makers that implement those standards. There are a lot of moving pieces and things are not always consistent across browsers and platforms. 

This can be a problem for you as a web developer. You want your products to look consistent across browsers where quirks and inconsistencies create small but sometimes important differences. 

A good strategy to eliminate some problems is to eliminate some or all of the default styles applied by the browser.

Take a look at the default styles used by browsers: 

https://bitsofco.de/a-look-at-css-resets-in-2018/

Read the article above and discuss it with your pair. 

Q: Why use a reset style sheet?
Q: How would you apply this to your work? 
Q: What are the differences between these different resets?

Choose one of the stylesheets and apply it to the example code. 

## Apply CSS Custom properties to your work

Take your CSS logo and move all of the values into CSS custom properties. Anything that is a value can be a property. Move these to a location in your code where it makes them easier to access. 

Is this an improvement? 

Take it a step further. Look at the cade and find values that are calculated from other values. Use `calc()` and custom properties to figure these values. 

Discussion: 

Q: What happened here? 
Q: Was it useful? 
Q: Does this make a better CSS code?

## Homework: Start your Framework - Fonts 

The goal of this assignment is to start your CSS Framework. This assignment will continue through the next few classes. You'll be adding features with each new assignment until it is complete. 

[Start your Framework: Fonts ](../Assignments/assignment-05-framework-fonts.md) 
Clarify what you are doing by looking at what other people are doing who are doing the same thing. Check out this awesome list of CSS Frameworks. 

- https://github.com/troxler/awesome-css-frameworks

## Additional Resources

1. https://www.sitepoint.com/css-theming-custom-properties-javascript/
1. https://codeburst.io/css-variables-explained-with-5-examples-84adaffaa5bd
1. https://css-tricks.com/css-custom-properties-theming/
1. https://github.com/troxler/awesome-css-frameworks

## Minute-by-Minute [OPTIONAL]

| **Elapsed** | **Time** | **Activity** |
| ----------- | --------- | ------------------------- |
| 0:00 | 0:05 | Objectives |
| 0:05 | 0:15 | Overview |
| 0:20 | 0:45 | In Class Activity I |
| 1:05 | 0:10 | BREAK |
| 1:15 | 0:45 | In Class Activity II |
| TOTAL | 2:00 | |

