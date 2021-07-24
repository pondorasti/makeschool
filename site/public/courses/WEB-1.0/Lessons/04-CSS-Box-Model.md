<!-- .slide: data-background="./Images/header.svg" data-background-repeat="none" data-background-size="40% 40%" data-background-position="center 10%" class="header" -->
# FEW 1.1 - CSS Box Model

<!-- Put a link to the slides so that students can find them -->

➡️ [**Slides**](/Syllabus-Template/Slides/lesson1.html ':ignore')

<!-- > -->

## Warmup <!--5 min-->

Breakout in groups of 2-3 (5 min): 

- Find a website and together count how many boxes there are on the site.
-  Take a guess: what does the code look like to structure those boxes?

<!--Instructor Tip: post the last question in the class slack channel and have students share their answers on a threaded message. OR post directly into zoom chat and have students answer live.
-->

<!-- > -->

## Learning Objectives <!--2 min-->

1. Describe the Box Model
1. Use the box model to create a box of any size
1. Identify the properties that make up the box model
1. Use Flexbox to arrange elements along an axis

<!-- > -->

<!-- 

Success Skills Exercise - Code Review 

- Students pair and code review 
- Choose a small managable block of code not more than 40 lines 
- What to look for 
- How to give feedback.

 -->

### Why you should know this

The box model is at the **foundation of understanding layout with CSS**. It also shows up on front end interviews.

**Flexbox is the most amazing tool ever invented**, it would be reckless not to know it.

<!-- > -->

## What is the Box Model? <!--20 min-->

It's the formula used to determine the size of a box in the browser. But what goes into determining the size of the box?

[The CSS Box Model Explained by Living in a Boring Suburban Neighborhood](https://www.freecodecamp.org/news/css-box-model-explained-by-living-in-a-boring-suburban-neighborhood-9a9e692773c1/)

**Read the above article and then answer the following questions:**

1. What are the 5 important properties that allow you to size and distribute your HTML elements?
1. What is the difference between padding and margin?
1. Label the different parts of the box model as it applies to the following image:
![tea cups](./images/tea.jpeg)

Answer the questions on your own, and then we will discuss as a group! 

**Stretch Questions - answer if you want extra practice**

1. How would you write the CSS for the red house with a blue lawn example towards the end of the article? Try writing it assuming it's for the `#red-house` ID
1. How would you write the CSS for the yellow house with a green lawn example towards the end of the article? Try writing it assuming it's for the `#yellow-house` ID

<!-- > -->

## How is the box model calculated? <!--20 min-->

- **Total element width** = width + left padding + right padding + left border + right border + left margin + right margin
- **Total element height** = height + top padding + bottom padding + top border + bottom border + top margin + bottom margin

<!-- > -->

```css
div {
    border: 4px solid black;
    margin: 20px;
    padding: 10px;
}
```

<!-- > -->

<div style="background-color:#ccc; padding: 10px">
  <div style="width:auto;padding:10px;border:4px solid black;margin:20px;background-color: lightblue; text-align: left">Content</div>
</div>

<small style="color: red">268px = left margin + left border + left padding + width + right padding + right border + right margin = 20px + 4px + 10px + 200px + 10px + 4px + 20px</small>

<!-- > -->

### Box Model Activity

The best way to learn more about the box model is to practice with it!

**Download [this HTML file](https://github.com/Make-School-Courses/WEB-1.0/blob/master/box-model.html), and open it in your browser**

Or view it [here](https://make-school-courses.github.io/WEB-1.0-Web-Foundations/#/box-model.html)

Take a few minutes to play around with it, and see how the box/content changes depending on how you change the inputs. You can always edit the text/content of the box by editing the `#content` element in the HTML file.

**Next, take 10 min and try to fill in the blanks to match the following pictures using the box model tool. At the end we'll share as a class to see who got the closest!**

**Challenge 1**

![margin challenge](./images/margin.png)

**Challenge 2**

![padding challenge](./images/padding.png)

**Challenge 3**

![margin challenge](./images/margin_padding_1.png)

**Challenge 4**

![padding challenge](./images/margin_padding_2.png)


<!-- > -->

## Inline vs block - Inline <!--5 min-->

<div style="background-color:yellow; padding: 10px">
  <div style="text-align:left;padding:10px;border:4px solid;margin:10px;background-color: red">
    <span>A span tag</span> <strong>A strong tag</strong> <em>an em tag</em>. Inline elements wrap when they reach the width of the available space.
  </div>
</div>

**Inline tags line up left to right** like you would write text on a page. They wrap at the end of a line like these words. Inline elements do not start on a new line, and only takes up as much width as its content. If you try to set any width and height, it will have _no_ effect on the content.

<!-- > -->

## Inline vs block - Block <!--5 min-->

<div style="background-color:yellow; padding: 10px">
  <div style="width:auto;padding:10px;border:4px solid;margin:10px;background-color: red">Some content</div>
  <div style="width:auto;padding:10px;border:4px solid;margin:10px;background-color: red">More content</div>
</div>

**Blocks** are boxes that normally **stack each below the previous**. 

Blocks start on a _new_ line and takes up the full width available. Block elements will occupy the _entire width_ of its parent element.

<!-- > -->

**The background color fills a box to the border.**

**Margins push the box away from its neighbors.**

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

## Borders <!--2 min-->

<!-- > -->

**A border only shows after you set both the width and the style:**

```CSS 
div {
  border-width: 4px;
  border-style: solid;
}
```
<!-- > -->

## Check for understanding <!--7 min-->

Answer the following questions on your own (2 min), then pair with another student and discuss in a breakout room (2 min). We'll discuss as a group at the end (3 min):

1. How is the box model calculated?
1. Describe the difference between margin and padding.
1. What is the difference betwween inline and block?

<!-- > -->

## Break <!--10 min-->

Take a ten minute break. 

<!-- > -->

## Flexbox <!--20 min-->

Flexbox is a group of CSS properties that arrange elements on an axis. 

https://www.freecodecamp.org/news/an-animated-guide-to-Flexbox-d280cf6afc35/

**Read the above article and then answer the following questions:**

1. What is the underlying principle of Flexbox?
1. What are the differences between the main axis and the cross axis?
1. What types of apps would benefit most from flexbox?
1. What apps likely don’t need a flexbox

Answer the questions on your own, and then we will discuss as a group! 

<!-- > -->

## Flexbox Game <!--40 min-->

Let's get some practice with Flexbox by getting these frogs to land on their appropriate lilly pads!

**Try to get through all 24 levels in the tutorial:** [Flexbox Froggy](https://flexboxfroggy.com/)

<!-- > -->

## Lab <!--remainder of class-->

Look at the [Android Web page (Challenge 1)](https://github.com/soggybag/learn-markup-level-2) and Layout the elements with Flexbox and the box model.

**Challenge 1**

Using the Android HTML mock up try these challenges:

- Arrange the page title in the header on the left and the nav on the right.
    - Strategy: You can use Flexbox on the parent. h1 and nav are both children of header but there are other header tags on the page you'll want to target only this header so give it a class name. Then give it `display: flex`. To move the h1 to the left and nav to the right use `justify-content: space-between`
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

**Challenge 2**

Take these ideas and apply them to your personal web page. 

<!-- > -->

## After Class 

Finish up the challenges from lab, and the flexbox tutorial.

### Resources 

- https://www.freecodecamp.org/news/css-box-model-explained-by-living-in-a-boring-suburban-neighborhood-9a9e692773c1/
- https://www.freecodecamp.org/news/an-animated-guide-to-Flexbox-d280cf6afc35/