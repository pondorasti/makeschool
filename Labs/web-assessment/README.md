# FEW Assessment

Take this diagnostic if you have previous experience coding in [Javascript]. If you don’t, or this challenge is way too difficult, that is OKAY. We will eventually teach you these skills. The diagnostic helps staff gauge your skill level to identify who might place out of the intro level material. You will be notified if this placement-out applies to you. Skip this diagnostic if the material is way too challenging for you.

This assessment is to measure your skills and determine whether you should take Web 1.0. While it can't test everything, solving the problems here will show that you have requisite knowledge to skip Web 1.0. 

There is no point inflating your abilities since moving ahead without the requisite skills will leave you behind in future classes. 

This assessment is meant measure your skills in these areas: 

1. HTML
2. CSS
3. JavaScript

Your goal taking the assessment is to create the project pictured below:

![Screen Shot](screen-shot.png)

To create this you'll need to use HTML and CSS.

This web page has some functionality pictured in the animated Gif below. You'll use JavaScript to create this functionality. 

![Example](example.gif)

You won't use any libraries or frameworks for this project. It should completed wholley with vanilla HTML, CSS, and JS. 

The whole problem should solved with HTML elements, CSS, and JavaScript. You won't need to use canvas, WebGL, SVG or anything than standard tags! 

## Submission Instructions

To submit this project for evaluation fill out this [form](https://docs.google.com/forms/d/e/1FAIpQLSfGNcBEbVi3IvjXcM57AT9_3Z8DMA_OLKGq0PVS7m7pKDwjnA/viewform?usp=sf_link) with your information.

In your submission also include a short screen capture video of you explaning your code like you would if you were demoing a project in class (you don't need to live code, just finish your work and then make the video).

Here are some [instructions](https://support.apple.com/en-us/HT208721) about how to use Quicktime to record a video. 

## Challenge 1 - HTML

1. **Create an html** file with the default HTML markup. This should include: 
	1. doctype, html, head, title, and body tags
2. **Add four sections** to your page. You'll be adding different content and styling each of these sections as described below. 
3. **Add content** to each of your sections. Refer to the images above for a visual guide to what you need to have. 
	1. The first section (upper left) should display your name as a heading followed by "FEW Assessment"
	2. This section (upper right) should contain three inputs each with a label. Each input should have a label. The first two inputs should take numbers as input, and the last should input a color. 
		1. Label: Width, input type: number
		2. Label: Height, input type: number
		3. Label: Color, input type: color
	3. (Lower left) Should display some fixed headings and some dynamic values that you will add with JavaScript. 
		1. Title: Width
		2. Title: Height
		3. Title: Color 
	4. The last section (lower right) will display a box. The size and color of the box will controlled by JavaScript. 

## Challenge 2 - CSS

You should write the CSS here yourself, do not use Bootstrap or other CSS library. Your goal is to style the mark up you wrote in the last challenge to look like the images above. 

1. Set the font for all elements to Helvetica. 
2. Arrange the four sections into a grid. Each section should 200px by 200px with a 1px solid black border.  
3. Position all four elements in the center of the page. 
3. Use Flex Box to arrange the contents of each section/box in a column and centered.
4. The inputs should all have a 1px border and 0.5em of padding.  

## Challenge 3 - JavaScript

You should use vanilla JS for this section. Don't use any libraries or extra code. 

The goal of this section is write JavaScript that will create the functionality shown in the animated gif above and described below. 

**Overview:** Changing the values in the inputs in the upper right should display those values in the in the lower left, and change the width, height, and color of the box in the lower right. Watch the animated gif example it shows the features in use live. 

- Use JavaScript to reference DOM elements. This is a general instruction. You'll need a reference to the inputs and display elements. 
- Use event listeners to display values entered in the form elements in the box in the lower left. See the example above. 
	- Changing the width in the width input should display the value of the width followed by px in the box in the lower left. 
	- Changing the height in the height input should display the value in the lower left.
	- Changing the color should display the color value in the lower left.
- When the values are entered in the upper right the the box in the lower right should display a rectangle at the size of the numbers entered in px, and the color of the color entered.

