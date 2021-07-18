# Beginning CSS-Challenges
 
Use these challenges here to get started with CSS. 

The file here came from the HTML markup challenges. If you've done those you'll recognize some of the examples.

## What to do?

Work your way through each of the challenge files. Open each file in your browser, read the comments in the style tag at the top and follow the instructions. Then refresh your browser. 

As you make changes you'll be applying CSS styles to the documents you previously marked up. 

**Be sure to refresh your browser after each change to CSS.** This way you'll be able to see the affect of each style you apply and understand what is doing. Better! install the Live Server extension for VSCode. 

Look at the code samples and read comments. 

You'll be adding your code in the `<style>` tag.

CSS styles are written in "rules". A rule is written in a block that starts with a "selector".

```CSS
p {
	...
}
```

Properties are written in name and value pairs. 

```CSS
color: red; /* make the foreground color red */
```

All style rules start with a selector. The selector describes which elements will be affected and all the rules in the block apply to those elements.  

```CSS
p {
	/* All properties here apply to all p tags */
	color: red; /* All p tags display as red */
}
```

In some examples you'll see something like this:

```CSS
body {
	/* Set the font-family to 'Helvetica Neue' */

	...
}
```

Your job is to:

```CSS
body {
	/* Set the font-family to 'Helvetica Neue' */
	font-family: 'Helvetica Neue';
	...
}
```

In a few places you'll need to define the selector. For example: 

```CSS
/* Apply the following styles to the body */
	/* font family 'Helvetica Neue' */
	/* font size 20px */
	/* line height 1.5 */
	/* Color #333 dark gray */
	/* background color #eee light gray */
```

Your goal in this example is to: 

```CSS
/* Apply the following styles to the body */
body {
	/* font family 'Helvetica Neue' */
	font-family: 'Helvetica Neue';
	/* font size 20px */
	...
	/* line height 1.5 */
	/* Color #333 dark gray */
	/* background color #eee light gray */
}
```

