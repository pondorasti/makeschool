# Assignment 3 - CSS

Your goal is to use CSS styles to improve the look of the documents. 

## Challenge 1 - Inline styles 

**Step 1** Open [challenge-1.html](challenge-1.html) your web browser. The content is a heading and two paragraphs followed by a footer with a link. Much of the text has a unique styles applied. 

All of the styles you see here are the default styles used by the browser. You can change any or all of these by writing your own styles. 

**Step 2** Open [challenge-1.html](challenge-1.html) in your editor. You should see much of the markup you used in class 1. The markup is adding context and meaning to the content. Here are a list of the tags used: 

- article - Describes an a self contained article.
- header - Describes the leading or introduction of an article or section
- h1 - The top level heading
- mark - Highlights text
- b - defines bold text
- em - defines emphasized text
- sup - defines supscript
- abbr - identifies an abbreviation or acronym
- footer - defines the footer for an article or section
- a - defines hyperlink (text that links to another document)

The default styles are there because of the "user agent stylesheet". You can overwrite all of these to change the appearnce of any element. 

**Step 3** Styles can be written in a style tag. Everything within the style tag must be written in the CSS langauge. 

Your goal is to add CSS styles to style the tags above. Do your best to improve the look of the content. 

Below is a list of the tags and a list of styles you should apply to that tag. 

- body 
  - font-family
  - font-size
  - line-height
  - color
  - background-color
- h1 
  - font-size
- mark
  - color
  - background-color
- a 
  - color

## Challenge 2 - Android Phones

**Step 1** Open [challenge-2.html](challenge-2.html) in your web browser. This is the text you markup in lesson 1.

The content here is made up of several sections each with a headings and sub headings along with some lists and other content. 

Take a look at the source page. 

https://www.android.com/phones-tablets/

The marup in the sample document is similar to what was used in the orginal page. Obviously the two look very different. The differences all come down to CSS styles. The challenge code has no styles, yet, and displays itself with the default styles. 

**Step 2** Open [challenge-2.html](challenge-2.html) in your editor. 

It's your goal to add a style style sheet and write some styles to make this look closer to what the original looked like. 

The page is structured like this: 

- Section 
  - h1
  - section 
    - h2
    - h3
    - ...

In the original page the font is a San Serif, and it's the same across the entire page. By setting a font family and font size on the body tag you are decalring a base font. All of the other tags will inherit from this.

```css
body {
  font-family: Helvetica;
  font-size: 18px;
}
```

From here set the font size of all of the other elements in em. This unit is a multiple of the base font size for example: 

```css
body {
  font-size: 18px; /* base size */
}

h1 {
  font-size: 2em; /* 36px */
}

h2 {
  font-size: 27px; /* 27px */
}
```

The em unit is great to use because by setting fonts in em throughout your page you can change their relative sizes by changing the base font in the body tag.

Take a look at the original page and try and match the font sizes using ems. 

## Challenge 3 - Your website 

Take the ideas from this class and apply them to your web site. 




