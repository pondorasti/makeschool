# Single Page Site Starter

This repo contains starter code for building your single page web site. 

The code here is shown in stages that walk through the process you might follow to if you were building a single page site from scratch. 

# Step 0 - index-0.html

The first step is define a subject and content, then divide the content into sections. 

For the subject you can think about your single page site similar to writing an essay. You'll have an introduction, supporting topics, and a conclusion. 

The difference between the web site and and essay is the website will have pictures and be lighter on text content. 

In [index-0.html](index-0.html) I've used the boilerplate HTML code along with a series of sectional tags to outline the content. 

```HTML
<main>
	<nav id="nav"></nav>
	<section id="banner"></section>
	<section id="topic-1"></section>
	<section id="topic-2"></section>
	<section id="topic-3"></section>
	<footer id="contact"></footer>
</main>
```

# Step 1 - index-1.html

In this stage I've added content and structure to each section. 

# Step 2 - index-2.html

This step adds a few styles to get the page to display as a series of sections in a single scrolling page. 

```CSS
body {
	margin: 0;
}
```

This block removes the default margin from the body element. Without this you'll a small gap around the edge and your content won't reach the edge of the page. 

```CSS
nav, main > section {
	overflow: auto;
}
```

Margins on elements like h1 and p extend outside their containers. This creates gaps between sections. This rule removes those gaps. Try commenting this out and viewing the code in the browser. 

```CSS
main > section {
	min-height: 100vh;
}
```

I wanted each section to be as least as tall as the size of the window. This rule says the minimum height should be 100% of the view height. 

`vh` is a unit that represents a percent of the browser window. `100vh` is 100% the height of the window. 

```CSS
#nav {
	background-color: #FF3B30;
}

#banner {
	background-color: #26B63E;
}

...
```

These rules apply to each content section through the unique ids assigned to each. Here a different  background color was applied to each section to make them standout. 

# Step 3 - index-3.html

This step takes look at the nav bar. I added some real content and renamed the links and ids for the sections. 

To divide the nav bar into two parts ocupying opposite sides you need two child elements. 

```CSS
#nav {
	display: flex;
	justify-content: space-between;
	align-items: baseline;
	...
}
```

Here I used `align-item: basline` to align all elements on the baseline. This way all of the text "sits" on the same line. 

In the example the right side of the nav is a ul with four items. Use flex again to align these list items in a row. 

```CSS
nav ul {
	display: flex;
	list-style: none;
}
```

The links should have a little more space. 

```CSS
nav ul a {
	padding: 1em;
}
```

# Step 4 - index-4.html

In this step you'll look at one section with a background image and some text content in the center. 

I renamed the ids so they made more sense to the subject of content. Here I'm going to style a section on Raymond Scott, you should look him up he created some very interesting music you migth recognize. 

The idea is to fill this section with a background image. 

I found some images searching the with Google. I made sure to choose an image that was at least 1200px wide if I could find one. If not use what you can get. 

I put my images in a folder named: `images`.

Set the id of the first section to #raymond-scott. 

Then I used these styles to make the image fill this section. 

```CSS
#raymond-scott {
	background-color: #26B63E;
	background-image: url(images/scott-1.jpg);
	background-size: cover;
}
```

Using `background-size: cover;` here makes the image fill the space and bleed off the edges. 

My section had heading and some other text. I wrapped the heading and text in a div tag so I could move them as a group. 

```HTML
<section id="raymond-scott">
	<div>
		<h2>Raymond Scott</h2>
		<p>Some Text...</p>
	</div>
</section>
```

The div a block tag, that has no semantic meaning. We use it to do computer stuff without saying anything about the content. 

```CSS
#raymond-scott {
	...

	display: flex;
	justify-content: center;
	align-items: center;
}
```

Center the children with flex. 

```CSS
#raymond-scott {
	...

	...

	font-size: 4em;
	color: #fff;
}
```

I wanted the text be big and visible. Choose a color that constrasts with the background image. 

```CSS
#raymond-scott h2, #raymond-scott p {
	margin: 0;
	text-shadow: 0 0 20px #000000;
}
```

To reduce the space between h2 and p tags remove the margin. 

The Text shadow migth help add some visual separation with the text and the background image. 

I wanted to push the content a little down and the to the right. 

```CSS
#raymond-scott > div {
	position: relative;
	left: -120px;
	top: 120px;
}
```

Setting `position: relative;` allows the element to be moved, `left: -120px;` moves the image 120px to the left, a positive number would move to the right, `top: 120px;` moves the image down.  

# Step 5 - index-5.html

This next section displays three cards side by side. 

Each card uses the following markup. This is what I used. 

I started with a list. 

```HTML
<ul>
	<li class="card"></li>
	<li class="card"></li>
	<li class="card"></li>
</ul>
```

Each list item `<li>` will be a card. The class name will help since not all list items will be cards. Using the class will allows to apply the card style to anything with the card class. 

Each list item looked like this: 

```HTML
<li class="card">
	<img src="images/moog-0.jpg">
	<h3>Bob Moog</h3>
	<p>The inovator...</p>
</li>
```

_Notice the paths! paths in CSS are always relative to the stylesheet!_ 

Remove the list default styles. 

```CSS 
#robert-moog ul {
	list-style: none;
	margin: 0;
	padding: 0;
}
```

Now use flex to arrange the list items in a row. 

```CSS 
#robert-moog ul {
	...

	display: flex;
	justify-content: center;
}
```

Define some card styles: 

```CSS
.card {
	width: 400px;
	margin: 1em;
	background-color: #eee;
}
```

Make the image fit the width of the card: 

```CSS
.card img {
	width: 100%;
}
```

# Step 6 - index-6.html

Here I wanted to make a content box that was 75% the width of the container but also not wider than 700px. If the lines of text are too wide it becomes hard to read. 

```CSS
#wendy-carlos > div {
	background-color:rgba(255, 255, 255, 0.44);
	padding: 1em;
	width: 75%;
	max-width: 700px;
}
```

The `background-color:rgba(255, 255, 255, 0.44);` is  a transparent white. The last value is the transparency. 

# Step 7 - index-7.html

This time arrange two elements side by side and set the proportional width of each. 

Set the background and flex.

```CSS
#suzanne-ciani {
	background-color: #461c3b;
	display: flex;
	color: #fff;
	background-image: url(images/sound-texture.jpg);
	background-size: cover;
}
```

Make the container 75% the width of the page. 

```CSS
#suzanne-ciani > div {
	display: flex;
	justify-content: center;
	width: 75%;
	margin: auto;
}
```

There are two children. One is an image the other has some text. 

```CSS
#suzanne-ciani > div > div:nth-child(1) {
	flex: 3;
	margin: 0 2em 0 0;
}

#suzanne-ciani > div > div:nth-child(2) {
	flex: 2;
}
```

Setting the flex property sets what proportion that element fills. Here the first element takes up 3 parts, and the second takes 2. So first takes up 3/5 or 60% and the second takes 2/5 or 40%.


# Step 8 - index-8.html

Time to look at the form. Forms have lots of details that need style attention. 

This is the structure I used for the inputs. 

```HTML
<label>
	<span>Name</span>
	<input type="text">
</label>
```

By putting the text of the label in a `<span>` tag I can target and style the label text seprately from the label as a whole which contains the text and the input. 

To arrange the text above the input use flex and direction column.

```CSS
#contact label {
	display: flex;
	flex-direction: column;
}
```

The inputs and text area should look the same. Might as well style both. Adding some padding will push the edge of the box away from the text that is input. 

Be sure to style the border. 

```CSS
input, textarea {
	border: 1px solid #000;
	padding: 0.5em;
	margin: 0 2em 0 0;
	width: 20em;
	font-size: 1em;
}
```

The teaxtarea is a multiline input setting the height in em will let you set the height to display a number of full lines. 

```CSS
textarea {
	height: 9em;
	margin: 0 0 0 0;
}
```

Using the box model, the teaxtarea should display 8 lines. That's height 9em, with padding of 0.5em. 

The submit button. 

```CSS
form button {
	width: auto;
	font-size: 1em;
	margin: 1em 0;
	align-self: flex-end;
	padding: 0.5em 1em;
	background-color:rgb(0, 0, 0);
	color: #fff;
	border: none;
}
```

The default button style adds a background and border. Be sure to style thesde. Give the button a contrasting color to make stand apart. You want people to see the button and know they can click it. 