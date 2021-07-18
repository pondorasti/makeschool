# FEW 2.2 Lesson 3 - Box Model Flex

## Review 

- What is: `-apple-system`
- What is: `BlinkMacSystemFont`
- What is: `em`
- What is: `rem`

Read the CSS below:

```CSS
body {
	font-size: 14px;
}

body > div {
	font-size: 2em;
}

body > div > h1 {
	font-size: 2.5rem;
}

body > div > p {
	font-size: 1em;
}
```

- How big is the h1 in px?
- How big is the p in px?

## Learning Objectives 

- Use the box model
- Calculate the size of a box 
- Use padding, border, and margin

## Video Lessons

https://www.youtube.com/playlist?list=PLoN_ejT35AEhF_M9vBuZgW0E4PiDb19oX

Watch videos: lesson 03 1-6

## The Box Model

The box model describes how everything is sized on the CSS. 

The Box Model applies to all **block** elements. Looking at any element on a page it will either display as inline or block. 

Think of inline elements like words in a block of text. The flow is left to right and wrap when they reach the extent of their container. 

Block elements stack one on top of the previous. You can set the width and height of a block element. 

Block elements should always contain inline elements. Not the other way around!

Try this on the Zen Garden Page. The following sets a style for all anchor tags on a page. The anchor tag displays as inline by default! 

```CSS
a {
	width: 100px;
	height: 100px;
	border: 1px solid;
	margin: 1em;
	padding: 1em;
}
```

Notice the results. While all of the elements show the border and the border is pushed away by the padding the size of the element doesn't affect the surrounding elements! **This is because this is an inline element!**

Add this: 

```CSS
a {
	...
	display: block;
}
```

Now every anchor is a block and creates a box that stacks with the other boxes. 

The following are all block elements:

- `div`
- `p`
- `h1` - `h6`
- `section`

### Width and height

Set the width and height of an element. 

### Padding

Sets the space between the content and the border. 

### Border

Sets the border around an element. 

The border has many styles. At the minimum, you need to set the border style! 

```CSS
div {
	border-style: solid;
}
```

The default border color is the foreground color.

### Challenge:

Turn each link into a button. Use the padding border and margin. You can set the display of these elements to `block` or `inline-block`.

```CSS
a {
	display: inline-block;
	padding: 0.5em 1em;
	margin: 0.5em;
	border: 3px solid #5599f3;
	border-radius: 0.5em;
	color: #ffffff;
	text-decoration: none;
	background-color: #7bb1f6;
}
```

Challenge: make all of the anchor tags in the footer display as buttons. 

### Button Formula

Buttons can vary widely in design and solutions can be very creative. What is presented here is a good starting place for a wide variety of buttons:

- Display block or inline-block - buttons will almost always display as a block
- Padding - Add space around the text content of the button. This usually better than setting the width and height but you might do that if you wanted your buttons to be a specific size. 
- Border - Buttons often have a border, but not always! You can also set the border on any of the sides. For example, you might have a border only on the left or bottom, or have borders on the left and right or top and bottom. 
- Background color - Give the button background color to make it pop out and look clickable!

## Float 

Float is a property used to wrap text around an image. A floated element moves to the left or the right and everything else tries to wrap around it. 

Try this, here image each of the links on the Zen Garden page was an image. 

```CSS
a {
	width: 100px;
	height: 100px;
	border: solid;
	margin: 1em;
	padding: 1em;
	display: block;
	float: left;
}
```

Challenge: float every other tag to the right. 

## Flex

Flex is a tool that arranges elements along an axis. The axis can be horizontal or vertical. 

Flex is a property that arranges the child elements. This is the core concept! All of the other flex properties apply to the children and determine how the children are arranged. 

Solve the problems here: https://flexboxfroggy.com

Submit your answers to GradeScope!

## Creating Cards

The idea of a "Card" in web design is a box with information. Usually, this box has something to delineate it from the area around it. This might be a border or a shadow.

A card often contains text content and might also contain an image. 

A card presents one complete idea. you could think of this as a paragraph. Examples might be a product, a personal profile, a reminder, a review, a single post or comment. 

Card example:

- https://www.awwwards.com/play-your-cards-right-exploring-the-cards-trend-in-web-design.html

Some ideas to try: 

### Some Cards ideas

Here some ideas to get you started designing your cards. These ideas were applied to the Zen Garden page so they are limited in that they work without changing the mark up found there. 

**Turning the footer into a card**

Here I styled the links in the footer like a card. This element doesn't give us much to work with there is only the link. 

```CSS
footer > a {
	display: block;
	border: 1px solid;
	flex: 1;
	height: 200px;
	margin: 10px;
	box-shadow: 0 0 12px rgba(0, 0, 0, 0.392);
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 48px;
	text-decoration: none;
}
```

Arrange all of the footer "Cards" in a row with flex. 

```CSS
footer {
	display: flex;
	justify-content: space-around;
}
```

**Turn each list item in Select a Design into a card**

Here is an example of styling each list item in the `div.design-selection` section as a card. 

Start with the `li` this will be the card container:

```CSS
.design-selection ul > li {
	display: flex;
	flex-direction: column;
	align-items: center;
	border: 1px solid;
	padding: 10px;
	font-size: 40px;
	margin: 5px;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.317);
}
```

Here we have a couple of items to play with. There are two links and some text, the word "by" inside each `li`. Let's put the first link at the top, the second link at the bottom, and put the word "by" near the center. 

The style above made all of the text large, so here we will make the links smaller so only the word "by" is larger. 

First style both anchors:

```CSS
.design-selection ul > li > a {
	font-size: 1rem;
	text-decoration: none;
	margin-bottom: 1em;
	height: 3em;
}
```

Then style the last child, which is the second anchor. 

```CSS
.design-selection ul > li > a:last-child {
	align-self: flex-end;
	margin-top: 1em;
	margin-bottom: 0;
}
```

You could also have used the class names: `a.design-name` and `a.designer-name`.

**Turn the Resources section into a Card**

Start with a container. Use flex here to arrange the contents in a column. 

```CSS
.zen-resources {
	display: flex;
	flex-direction: column;
	border: 1px solid;
	width: 200px;
}
```

Next, add a header to the card. 

```CSS
.zen-resources h3 {
	margin: 0;
	text-align: center;
	padding: 1em;
	margin-bottom: 1em;
	background-color: #000;
	color: #fff;
}
```

Now style the list. Notice I remove the bullet points from the ul.

```CSS
.zen-resources ul {
	list-style: none;
	margin: 0;
	padding: 0;
	margin-bottom: 1em;
}
```

Last style the anchors. 

```CSS
.zen-resources a {
	text-decoration: none;
	padding: 0.25em 1em;
	display: block;
}
```

## After Class

Use the box model and flex to style your Zen Garden page. Do the following things: 

- Create a card of one or more of the sections on the Zen Garden page. Take a look at some of the Zen Garden pages for ideas. Look for "cards" there to see what others have done. Here are a few ideas:
	- Any of the sub-sections under: `section.intro` or `div.main` would be good candidates for Cards. Making three cards for: `div.explanation`, `div.participation`, and `div.benfits`. You can arrange these in a row using flex.
	- The lists of links at the bottom of the page, `div.design-selection`, `div.design-archives`, and `div.zen-resources`, could also be good candidates for cards.
	- The `div.design-selection` contains a list with each list item containing two links, one the link to the design and a link to the designer. Each of these list items could be a card!
- Create a button style and use it somewhere on your page. The style of your buttons is up to you but the style you give must make stand out something that invites user interaction! Here are few ideas: 
	- Style the links in the `footer` like buttons. You can use the flexbox here.
	- The `div.design-archives` section contains two links that more designs. These two links would be great candidates for buttons! 
	- The `div.zen-resources` section contains 5 links that would also be good candidates for a button!

Submit your work to GradeScope! 

## Resources 

- [Guide to Flex Box](https://css-tricks.com/snippets/css/a-guide-to-flexbox/)
- [Card Design](https://www.awwwards.com/play-your-cards-right-exploring-the-cards-trend-in-web-design.html)
- [Styling Links](https://css-tricks.com/css-basics-styling-links-like-boss/)
- [Flex Box Froggy](https://flexboxfroggy.com)

