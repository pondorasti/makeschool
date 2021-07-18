# CSS Challenges 2

Follow the comments in the challenge file. 

Open the work in your web browser make changes and refresh the browser to see the effect of each change as you work. 

**It's important to see the effect of each change you make!**

Pro tip! Install the Live Server extension for your code editor. This will allow you to open the web page from your code editor and automatically refresh the browser when your save your files. 

## Flex 

Flex is a property when applied to an element arranges the children of the element. For example: 

```HTML
<ul>
	<li></li>
	<li></li>
	<li></li>
</ul>
```

Look at the HTML above. The CSS below arranges the li tags. Notice the selector is the ul which is the parent. 

```CSS
ul {
	display: flex;
}
```

You apply Flex to the parent and it arranges the children. In the example above, applying flex to the ul would arrange the child li tags! 

_The challenge code will walk you through how to apply flex. Be sure to watch for changes to the web page in the browser as you edit the CSS._

Play with the challeneges then review the links below for information and explore the features of flex box.

- https://www.smashingmagazine.com/2018/08/flexbox-display-flex-container/
- https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Flexible_Box_Layout/Basic_Concepts_of_Flexbox
- https://www.w3schools.com/css/css3_flexbox.asp
- https://css-tricks.com/snippets/css/a-guide-to-flexbox/

## CSS Units

Units are important to CSS. Almost every numeric value requires that you include a unit. Here is a list of some of the units available in CSS: 

- `in` - inches
- `mm` - millimeters
- `cm` - centimeters
- `px` - pixels

These units should be pretty familiar. Inches, millimeters, and centimeters should be easy to picture. Pixels migth be harder. In the early days of computers there were 72 pixels to an inch. That is a pixel was 1/72 of an inch in size. 

Now days screen sizes are more varied and pixels come in different sizes. In CSS a pixel is still considered 1/72 of an inch. 

There are also a few more units that important to CSS. These are not as obvious. 

- `em`
- `rem`

An `em` is a measurement based on typography. If the font size for an element is set to `16px` then `1em` is `16px` and `2em` would be `32px`, or `1.5em` would be `24px`. 

A `rem` is the same as an `em` but refers to the root element, rem === root em. 

https://alligator.io/css/rem-vs-em-units/
https://css-tricks.com/confused-rem-em/
https://zellwk.com/blog/rem-vs-em/

## Colors

Colors are important. You'll use them everywhere. They key part of experssion. 


