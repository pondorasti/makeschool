# FEW 2.2 Final Assessment 

Your job is to style the color.com website. Do your best. Use your CSS framework as a starting point. You don't have to write all of the styles from scratch! 

Feel free to modify the HTML markup on the page in any way that you wish. You must not break the functionality! Two things happen here: 

1. Color swatches are generated in `div.swatches`. 
2. Clicking swatches adds colors to the cart. 

Use your CSS framework! Your framework styles should cover much of the problems here. You will have to write some CSS to fill in some details.

Problems 5 and 7 will not be covered by your framework. You'll need to solve these from scratch. 

## 1 Typography

Set the font style for text and headings. All fonts on the page should be styled. I should not see the default Times New Roman anywhere! 

**What do to** Style the text including the headings. 

## 2 Style The Navbar 

Style the navbar and links. The navbar should include the links and the page title.

**What to do:** Create a navbar along the top of the page. It should be a horizontal bar containing the links in `section#nav`

**Extra credit:** Make the navbar sticky. A sticky navbar always stays at the top of the page even when the page scrolls. 

## 3 Style cards 

These cards have an image and text. **The cards should sit in a horizontal row.** 

**What to do:** In `section#popular` there are three divs each containing an image and a paragraph. Style these so that look like cards. The cards should be arranged in a horizontal row, use flex. 

## 4 Style Colors

The color swatches don't have any color at the moment. Your goal is to style them. Give them a background color and/or a border. You should arrange these with CSS grid. The size and number of columns and rows are up to you. 

**What to do:** Arrange the color divs in the #swatches section in a grid. 

### 5 Genereate 100 colors

There are 100 color swatches but there are no colors. You need to generate 100 unique colors and display them in the swatches. You can do this in any way you like. 

Note that all colors have an inline style set to a custom property named: --color-0 to --color-99. Generating 100 colors programmatically might be a good solution. 

Possible solutions for this problem would be to use JS or SASS. 

1) JS solution would need to assign an inline color to each color swatch. 

2) The SASS solution would require using a loop to generate style rules for all 100 color properties. The output should look like this: 

```CSS
--color-0: hsl(0, 100%, 50%);
--color-1: hsl(3, 100%, 50%);
--color-2: hsl(6, 100%, 50%);
--color-3: hsl(9, 100%, 50%);
...
```

**What to do:** Generate 100 colors. Make sure each color swatch has a unique color. 

## 6 Shopping cart 

Clicking a color swatch adds it to the shopping cart. The cart is a list and each row is made up of some text, buttons, and an input. **You should style these.**

In this step, your goal is to style the form elements that show up in the shopping cart. 

The cart displays when you click a swatch. You won't see it unless you click a swatch to add a swatch to the cart! 

**What to do:** Style the shopping cart. There is text, input, and three buttons here. All three of these things should have a style! 

## 7 Style the contact form

At the bottom of the page is a contact form. Your goal is to style this. 

None of the elements should use the default styles and all elements should look the same. 

**What to do:** Style the form elements. There are several inputs and a button, style all of these. 

## 8 Ticker Tape 

Create a web component that animates the text inside with a ticker-tape effect. Use the ticker tape component at the top of the page to animate the text: `<h1>...Color.com is awesome...</h1>`. 

The ticker tape should move the text across the screen. You can take one of two approaches. 

1) Manipulate the string content. Use a timer to take the first character of the string and move it to the end of the string. Doing this over time you'll end up with: 

- Hello
- elloH
- lloHe
- loHel
- oHell
- Hello

2) Create an inner element containing the text. Transform this element from right to left. At the end of the animation Move it back to the right and start over again.

Taking this approach it would be easiest to use `@keyframes`. To do this in a web component you'll want to define this in a template. See the example [here](https://github.com/Make-School-Labs/simple-component/blob/master/simple-components-templates/01-counter-template/fancy-counter.js). Note the styles are in a string in a `<style>` tag. You could define your `@keyframes` block here along with other animation styles.

Notice that all of the styles here are defined in a template and the template is used in the component. 

```js
const tempNode = template.content.cloneNode(true)
this._shadowRoot = this.attachShadow({ mode: 'open' });
this._shadowRoot.appendChild(tempNode)
```

## Submit your work

Submit your work on GradeScope. 

