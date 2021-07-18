# FEW 2.2 - Advanced CSS - Frameworks

## Review

- 

## Why you should know this?

You should be able to write CSS that could be used anywhere. This is where you would start if you were working on a large project building a library that covers a wide range of situations rather than each element! 

## Learning Objectives 

1. Write CSS that covers a wide range of elements
1. Use CSS Selectors 
1. Use CSS to define typographical styles

## Rember those CSS frameworks?

Take another look at these CSS frameworks. Look for the things that you can implement in your framework!

- https://getbootstrap.com
- https://get.foundation
- https://bulma.io
- https://tailwindcss.com
- https://getuikit.com
- https://milligram.io
- https://purecss.io

## Make your Framework

The goal for you is to make your framework. It won't be as extensive as the frameworks we looked at earlier. Your framework needs to define some base styles that might be useful in any project.

## Start Your Framework

Give your framework a name. 

Create a repo for your framework. 

Defines some base typographic styles. Style the following: 

- Base font style. Use a website like GitHub or Medium as a guide. 
- Adjust the font sizes for the headings h1-6
- Style the anchors 
- Style: blockquote, code, small, ???
- Style buttons and input

What to turn in? Create a sample page that shows off the styles of your framework.

## Challenge: Create your framework and add some base styles

Define some base styles for your framework. Link it to the CSS Zen Garden HTML. This way you'll be able to see the font styles as they are applied to the page. 

Do the following: 

```CSS
body {
  font-family: /* Define the font stack */;
  line-height: /* Adjust the line height */;
}
```

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

Assigning a value is like setting the value of a property in CSS.`:root` is a special selector that represents the root of your CSS scope. All other elements descendants `:root`. Defining variables here make them accessible to all other elements. Think of this as a global scope. 

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

Otherwise declaring a custom property on an element makes it available to that element and inherited by the element's descendants, but unavailable to its ancestors. 

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

### Use Custom Properties in your framework

These custom properties are amazing. You should use a few right now! 

Move the `font-family` to a custom property. 

```CSS 
:root {
  --font-family: /* Your font family here */;
}

body {
  font-family: var(--font-family);
}
```

Define a style for the anchor tag. Your links need a dcent style and that default blue is kinda ugly. We'll do this by creating definitions for a couple useful colors: 

```CSS 
:root {
  --font-family: /* Your font family here */;
  --bg-color: /* your background color */;
  --fg-color: /* Your foreground color */;
}

body {
  font-family: var(--font-family);
  color: var(--fg-color);
  background-color: var(--bg-color)
}
```

### What colors do other frameworks use? 

Take a look at Bootstrap, what colors are they using: https://getbootstrap.com/docs/4.0/utilities/colors/

This is a pretty good idea. They have a list of common colors that all look good together.

These colors include colors for important things, light text, and dark text. 

You should define a few of these you will store them in CSS custom properties. This will make them easier to use! 

You can add or modify this list. You can use any colors you like. If you're not sure what to use for colors take a clue from Bootstrap or one of the other frameworks we looked at in class. 

```CSS
:root {
  --font-family: /* Your font family here */;
  --bg-color: /* your background color */;
  --fg-color: /* Your foreground color */;
  --color-primary: /* */;
  --color-success: /* */;
  --color-danger: /* */;
  --color-primary: /* */;
  --color-dark: /* */;
  --color-light: /* */;
}
```

Let's use the primary color for links: 

```CSS
a {
  color: /* primary color here */;
}
```

## Design a Button

Your framework needs some buttons. 

The default button style is not very interesting it's also pretty small. Giving the button some color and making it a little larger will make it easier to use. 

```css
button {
  padding: 0.5rem 0.75rem;
  background-color: #fff;
  border: 1px solid;
  color: cornflowerblue;
  border-radius: 0.5rem;
  font-size: 1rem;
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

  padding: 0.5rem 0.75rem;
  background-color: var(--bg-color);
  border: 1px solid;
  color: var(--fg-color);
  border-radius: 0.5rem;
  font-size: 1rem;
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

Now you can change the colors of all buttons and other elements that use the `--primary-color`, or change the color of any button by changing its `--bg-color`. 

## After Class

Continue working on your CSS Framework. Use the ideas from this lesson to add some button styles! 

Work on your CSS Framework. be sure to use as many ideas from the class discussion above as you can! 

Your framework should support these features:

- Use CSS Custom properties! Any value that might need to be customized should use a custom property! 
- Has a base font and typographical styles this includes line-height, font-family, and font-size
- Defines heading styles: h1-6
- Defines colors. 
  - primary
  - success
  - danger
  - dark
  - light
- styles the link (anchor tag: `<a>`)
- styles the button

## Additional Resources

- https://css-tricks.com/a-complete-guide-to-custom-properties/

