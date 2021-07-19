# FEW 2.2 - Advanced CSS - Typography

This lesson will take a look at Typography and CSS. 

## Why you should know this or industry application

A majority of the content on the internet is text. Making good looking text that is easy to read will make your websites stand apart from the rest. 

## Learning Objectives

1. Identify features of typography
1. Use CSS styles to style text
1. Implement custom fonts

## What is Typography? 

Discuss...

## What typography do you like? 

Find some typography that you like on the web.

Pair up and find three examples of type on the web that looks good. 

Compare it to the type in the [example document](lesson-04.html). You can view this live on the web [here](https://make-school-courses.github.io/FEW-2.2-Web-Design-And-Advanced-CSS/lessons/lesson-04.html).

## What is type on the web?

https://webstyleguide.com/9-typography.html

## Features of typography

- Kearning
- Leading
- Baseline

## Font types

- Serif
- San Serif
- fixed width (code)

## Styling type

In CSS we use the following properties to style type.

- font-family
- font-size
- font-weight
- color
- line-height

### Activity

Apply some styles to the sample html document. Set the `font-size` and `line-height` on the body element.

Q: What happened? 
A: Could these be used to make the page look better than the default? 

## Native Fonts 

In the old days there was: 

- Arial
- Helvetica
- Verdana
- Times
- Times New Roman
- Courier New
- Courier
- Georgia
- Palatino
- Garamond
- BookmanComic Sans
- Trebuchet MS
- Arial Black
- Impact

These don't work on all systems. The Mac includes some of these and Windows includes others. Linux has it's own subset. 

The list of fonts that are very likely to exist across all operating systems is shorter: 

- Arial
- Courier New
- Georgia
- Times New Roman
- Trebuchet MS
- Verdana

Looking at the list these fonts fall into two categories:

- Serif - Courier New, Georgia, Times New Roman
- San Serif - Arial, Verdana, Trebuchet MS

In simple terms you are probably going to choose serif or a san serif font for your web projects based on how you want to present a product or a message. 

- Serif 
  - Look better and read better in print
  - Tend look "old school", repectable, and formal
  - Tend to be easier to read at small point sizes
- San Serif
  - Clean, stable, and reliable
  - Looks modern and youthful

## UI System Fonts 

These UI specific fonts are newer and more up to date than the standard system fonts. These work especially good for mobile since mobile devices tend to not use the same fonts available on the desktop. 

You should include these in your font stack. 

| OS       | Version      | Font name     |
|:---------|:-------------|:--------------|
| Mac OS X | El Capitan	  | San Francisco |
| Mac OS X | Yosemite     | Helvetica Neue |
| Mac OS X | Mavericks    | Lucida Grande  |
| Windows  | Vista        | Segoe UI       |
| Windows  | XP |         | Tahoma         | 
| Windows  | 3.1 to ME    | Microsoft Sans Serif |
| Android  | Ice Cream Sandwich (4.0)+ | Roboto |
| Android  | Cupcake (1.5) to Honeycomb (3.2.6) | Droid Sans |
| Ubuntu   | All versions | Ubuntu |

It's hard to support everyone, and you never know which system is viewing your site. You'll need a large font stack. 

So that's pretty complicated. What is your font stack across all the desktop and mobile devices out there? 

Here are the font stacks used by large companies with products that you use every day. 

**GitHub**

```CSS
/* System Fonts as used by GitHub */
body {
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
}
```

**Medium** and **Wordpress**

```CSS
/* System Fonts as used by Medium and WordPress */
body {
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen-Sans, Ubuntu, Cantarell, "Helvetica Neue", sans-serif;
}
```

There are a couple strange key words in there. I'm looking at you: `BlinkMacSystemFont`. What is this? Rather than naming a font these keywords target devices which know what font to use when they see the word. 

| Font | Device Targeted |
|:-----|:----------------|
| -apple-system (San Francisco) | iOS Safari, macOS Safari, macOS Firefox |
| BlinkMacSystemFont (San Francisco) | macOS Chrome |
| Segoe UI | Windows |
| Roboto | Android, Chrome OS |
| Oxygen / Oxygen-Sans | KDE |
| Fira Sans | Firefox OS |
| Droid Sans | Older versions of Android |
| Ubuntu | Ubuntu |
| Cantarell | GNOME |
| Helvetica Neue | macOS versions < 10.11 |
| Arial | Any |
| sans-serif | Any |

Here you can see `BlinkMacSystemFont` translates to "San Francisco" (the font) on macOS and Chrome. This allows the font to change in the future if the Apple came up with a new font to replace "San Francisco". 

https://bitsofco.de/the-new-system-font-stack/

For performance consider this: 

Using the the methods above is quick and easy but forces the system to check the font stack each time fonts are applied. Alternatively you can use `@font-face` to declare a font in advance and reference that choice by name. 

```CSS
/* Define the "system" font family */
@font-face {
  font-family: system; /* Name of your font family */
  font-style: normal;
  font-weight: 300;
  /* Font stack: Uses the first available font in this list */
  src: local(".SFNSText-Light"), local(".HelveticaNeueDeskInterface-Light"), local(".LucidaGrandeUI"), local("Ubuntu Light"), local("Segoe UI Light"), local("Roboto-Light"), local("DroidSans"), local("Tahoma");
}

/* Now, let's apply it on an element */
body {
  font-family: "system"; /* Use your named family here */
}
```

Read more about this here: https://css-tricks.com/snippets/css/system-font-stack/

Which should you use? For now your choice. The first is easier to manage. The second might have better performance.  

### Activity

Apply one of the font stacks above to the sample html document. 

Q: What happened? 
Q: Does it look better? 

## Custom Fonts 

Speaking of `@font-face` what does this do?

Load a custom font using `@font-face`. You'll need to host your font files and have license to the serve them. 

[Yes you must have a license to use a font on your website](https://designshack.net/articles/typography/what-is-a-font-license-and-do-i-need-one/)

Google provides a wide range of free fonts, and they serve them from the google servers. We will use these for this class. 

Google Fonts has hundereds of fonts. You can borwse them all at the link below. 

[Google Fonts](https://fonts.google.com)

Custom fonts have the downside that they take longer load. System fonts are already installed. 

### Activity

Choose a custom font from Google Fonts and apply it to the sample HTML document. Be sure to adjust the `font-size` and `line-height`. 

Q: Does it look better? 
Q: What font did you choose? 

## Choosing Fonts 

Choose a font for your project. It should probably be a san-serif unless you have a good reason to use a serif. 

If you are making software or a web site that is less concerned about brand identity the default system font should come first: 

```CSS
body {
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
}
```

Why? Using system fonts will give your work a native feel. This is probably the right choice most often. Making your site look native on the device that is viewing it makes it comfortable for everyone to view, and look best in that environment, it also increases performance. 

If you're making something that has strong brand identity and it's important to have a custom font but that font first on the list and default to serif or san-serif native fonts. 

https://blog.logrocket.com/how-to-use-web-fonts-in-css-a0326f4d6a4d/

- Pick a family 
- Set the base font style for all tags by setting styles on the html tag
  - Set the font size on the html tag
  - Set the line height

### Activity 

Try one of the font stacks above on the sample html. 

## Defining your Font Stack

There is room for optimism. When defining `font-family` you can provide a list of fonts. The browser picks the first available font in the list.

```CSS
html {
  font-family: Helvetica, "Trebuchet MS", Verdana, sans-serif;
}
```

## Take a look at how fonts are used

Explore some good font styles.

Medium: https://fontsinuse.com/uses/18899/medium-com-2017

Bootstrap: https://getbootstrap.com/docs/4.0/content/typography/

Why Do font choices matter: https://themeisle.com/blog/wordpress-fonts/

## Font Units: em vs rem

The **`em`** is a unit that represents a multiple of the inherited font size. Think of this as a number that multiplies the font size an element would inherit. 

The **`rem`** is root em. It represents a multiple of the root font size. This is the font size set on the html element, or body if you haven't set the font size on html. 

### Activity 

- Open the sample file [lesson-04.html](lesson-04.html)
- Find the `<div id="ems-and-rems">`
- Look at each `<p>` in the `<div id="ems-and-rems">`
- Inspect the elements and examine the font size of each
  - Use the inpsector 
  - Using the "Computed" pane to see the actual value

## Homework: Improve your Typography

The goal of this assignment is to improve the typography of a past project. See the homework description for details and requirements of this assignment. 

- [Improve your Typography](../Assignments/assignment-04-typography.md)

## Wrap Up 

- Review objectives 

## Additional Resources

1. https://webstyleguide.com/9-typography.html
1. https://blog.prototypr.io/top-10-ui-fonts-for-web-mobile-a8488e561ce3
1. https://uxplanet.org/5-universal-fonts-for-web-mobile-design-7b491df0ea16
1. https://css-tricks.com/snippets/css/system-font-stack/

## Minute-by-Minute [OPTIONAL]

| **Elapsed** | **Time**  | **Activity**              |
| ----------- | --------- | ------------------------- |
| 0:00        | 0:05      | Objectives                |
| 0:05        | 0:15      | Overview                  |
| 0:20        | 0:45      | In Class Activity I       |
| 1:05        | 0:10      | BREAK                     |
| 1:15        | 0:45      | In Class Activity II      |
| TOTAL       | 2:00      |                           |
