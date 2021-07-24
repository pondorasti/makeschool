<!-- .slide: data-background="./Images/header.svg" data-background-repeat="none" data-background-size="40% 40%" data-background-position="center 10%" class="header" -->
# FEW 1.1 - CSS Box Model

<!-- Put a link to the slides so that students can find them -->

➡️ [**Slides**](/Syllabus-Template/Slides/lesson1.html ':ignore')

<!-- > -->

### Learning Objectives

1. Describe the Box Model
1. Use the box model to create a box of any size
1. Identify the properties that make up the box model
1. Use Flex Box to arrange elements along an axis

<!-- > -->

### Why you should know this

The box model is at the **foundation of understanding layout with CSS**. It also shows up on front end interviews.

**Flexbox is the most amazing tool ever invented**, it would be reckless not to know it.

<!-- > -->

### What is the Box Model? 

<div>It's the formula used to determine the size of a box in the browser.</div>

https://www.freecodecamp.org/news/css-box-model-explained-by-living-in-a-boring-suburban-neighborhood-9a9e692773c1/

Read and Discuss

<!-- > -->

### Flex Box

Flex Box is a group of CSS properties that arrange elements on an axis. 

https://www.freecodecamp.org/news/an-animated-guide-to-flexbox-d280cf6afc35/

Read and Discuss

<!-- > -->

## Lab

Look at the Android Web page and Layout the elements with FlexBox and the box model.

**Challenges 1**

Using the Android HTML mock up try these challenges:

- Arrange the page title in the header on the left and the nav on the right.
    - Strategy: You can use flex box on the parent. h1 and nav are both children of header but there are other header tags on the page you'll want to target only this header so give it a class name. Then give it `display: flex`. To move the h1 to the left and nav to the right use `justify-content: space-between`
- Arrange the links in the nav in a row with flex. 
    - Strategy: All of the links are in li tags and the li tags have a common parent: ul. This ul is inside of a nav you can select it with: `nav > ul`. Now use flex: `display: flex`. The list still shows bullet points style these away: `list-style: none`. 
- Arrange the images using Flex
    - Strategy: The images that appear in each section are arranged in li tags in a ul. You can arrange the li tags with flex setting `display: flex` **on their parent**. Then style away the bullets. Try these properties to see how they affect the images: 
        - `justify-content: center`
        - `justify-content: space-around`
        - `justify-content: space-between`
        - `justify-content: space-evenly`
- Use the box model (margin, and padding) to add space around the links. 
    - Strategy: The links are too close and would be easier to click if their clickable area was larger. Target the `a` inside the `li` in a `nav`, select these with: `nav > li > a`. That's pretty specific! Use these styles: 
        - `display: block`
        - `text-decoration: none`
        - `padding: 1em`
- Add a hover to the links. This really important for interactions. 
    - Strategy: 

**Challenges 2**

Take these ideas and apply them to your personal web page. 

<!-- > -->

### Break

Take a ten minute break. 

<!-- > -->

### How is the box model calculated?

margin + border + padding + width + padding + border + margin

```css
div {
    border: 4px solid black;
    margin: 20px;
    padding: 10px;
}
```

<!-- > -->

<div style="background-color:#ccc; padding: 10px">
  <div style="width:auto;padding:10px;border:4px solid;margin:10px;background-color: lightblue; text-align: left">Content</div>
</div>

<small style="color: red">268px = 20px + 4px + 10px + 200px + 10px + 4px + 20px</small>

<!-- > -->

Inline vs block

<div style="background-color:yellow; padding: 10px">
  <div style="text-align:left;padding:10px;border:4px solid;margin:10px;background-color: red">
    <span>A span tag</span> <strong>A strong tag</strong> <em>an em tag</em>. Inline elements wrap when they reach the width of the available space.
  </div>
</div>

Inline tags line up left to right like you would write text on a page. They wrap at the end of a line like these words. 

Blocks contain inline elements. 

<!-- > -->

Inline vs block

<div style="background-color:yellow; padding: 10px">
  <div style="width:auto;padding:10px;border:4px solid;margin:10px;background-color: red">Some content</div>
  <div style="width:auto;padding:10px;border:4px solid;margin:10px;background-color: red">More content</div>
</div>

Blocks are boxes that normally stack each below the previous. 

<!-- > -->

The background color fills a box to the border.

Margin push the box away from its neighbors.

```CSS
div {
  padding:10px;
  border:4px solid #000;
  margin:10px;
  background-color: red;
}
```

<div style="background-color:yellow; padding: 10px">
  <div style="width:auto;padding:10px;border:4px solid;margin:10px;background-color: red">Some content</div>
</div>

<!-- > -->

## Borders

<!-- > -->

A border only shows after you set both the width and the style: 

```CSS 
div {
  border-width: 4px;
  border-style: solid;
}
```

## After Class 

Complete your personal web site. 

[Assignment 3](../assignments/assignment-03.md)

### Resources 

- https://www.freecodecamp.org/news/css-box-model-explained-by-living-in-a-boring-suburban-neighborhood-9a9e692773c1/
- https://www.freecodecamp.org/news/an-animated-guide-to-flexbox-d280cf6afc35/