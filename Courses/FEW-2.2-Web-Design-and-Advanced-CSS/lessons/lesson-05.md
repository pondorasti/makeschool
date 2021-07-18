# FEW 2.2 Lesson 5 - CSS Grid

## Review 

Quick answer these questions: 

Give me a transparent orange color. Write the CSS value that make a transparent orange. 

```HTML
<button class="next-button">Next</button>
```

With the HTML above write the CSS that will add `arrow.png` to the right of the button text. The image should be same size as the text. 

```HTML
<h1>Company name</h1>
```

USing the markup above add an the image `pattern.png` along the bottom edge. The image should be 10px and repeat on the x axis. 

## Learning Objectives 

- Use CSS Grid
- Define grid with columns and rows
- Map elements to grid cells

## Video Lessons

https://www.youtube.com/playlist?list=PLoN_ejT35AEhF_M9vBuZgW0E4PiDb19oX

Watch videos: lesson 05 1-5

## What is a Grid? 

In design, a grid is used to create a system that arranges things on a page.

The first thing that comes to mind when you talk about a grid is graph paper. A grid in design looks a little different. A vertical grid is the space between each line and is based on the font size. Horizontally the grid is based on the column width. 

Here is a good article describing grid systems: 

https://www.oozlemedia.com/advantages-of-grid-systems-in-web-design/

## CSS Grid 

In the past, the developer community provided CSS frameworks that had grids built-in. You have probably used one of these. 

- https://getbootstrap.com/docs/4.0/layout/grid/
- https://material-ui.com/components/grid/

These systems were built before CSS supported a built-in grid system. The CSS grid now makes these grid systems obsolete (in my opinion, I'm sure there is an argument to keep them.)

- Q: What does the CSS grid do? 
- A: CSS Grid arranges elements in rows and columns.

- Q: How is this different from Flex? 
- A: Flex is a one-dimensional arrangement. When using flex you choose an axis either horizontal or vertical. CSS grid on the other hand arranges elements on both the horizontal and vertical axis. 

- Q: Why use CSS grid over one of the CSS grid systems like Bootstrap?
- A: CSS Grid is simple enough it doesn't need an abstraction. It's more flexible and doesn't require all of the extra markup needed by a grid system like the one used in Bootstrap. 

- Q: Can you use CSS Grid and Flex together? 
- A: Yes! They both work together. You can use flex to arrange elements on a grid cell or use a grid inside an element arranged with flex. 

### Using CSS Grid

CSS Grid works similar to Flex, when you set an element's display property to `grid` all of the element's children will be arranged in a grid. 

Grid is also different from Flex. It's got two axes and allows you to define cells that make up the grid. It's more complex than Flex. 

Vocabulary

**Columns**

Columns are the horizontal divisions of the grid. Picture these as vertical bars that define the horizontal space. These are the most important measurement! 

![Columns](./images/01-columns.png)

**Gap/Gutter**

The grid gap or gutter is the space between the columns. 

**Rows**

These are the vertical divisions. Picture these as the horizontal bars that are stacked vertically. 

![Rows](./images/02-rows.png)

When you put them together you get a **grid**,

![Grid](./images/03-grids.png)

**Grid Cell**

A grid cell is a rectangular area that maps across any number of rows and columns. It has to be a rectangle! The edges must stop at the borders defined by the rows and columns. Notice that a cell doesn't fall into the gap between rows and columns! 

![Cells](./images/04-cells.png)

Generally speaking, you can ignore the height of rows since the row height will be set by the height of the content, though sometimes you will set this. 

### Making a Grid with CSS

Imagine you have the following markup: 

```HTML
<div class="container">
	<div class="box a">One</div>
	<div class="box b">Two</div>
	<div class="box c">Three</div>
	<div class="box d">Four</div>
	<div class="box a">Five</div>
	<div class="box b">Six</div>
	<div class="box c">Seven</div>
	<div class="box d">Eight</div>
</div>
```

With this arrangement, you can use `div.container` to arrange all of the `div.box` in a grid. The following would arrange these elements into three columns with a `1em` gap. 

```CSS
.container {
	display: grid;
	grid-template-columns: 1fr 1fr 1fr;
	grid-gap: 1em;
}
```

Let's take that apart. 

```CSS
.container {
	display: grid; /* .container arranges its children on a grid */
	...
}
```


```CSS
.container {
	...
	/* Creates three columns, which are each one fraction */
	grid-template-columns: 1fr 1fr 1fr;
	...
}
```

The `fr` is a unit that is one fraction. A fractional unit takes up a fraction of the available space. In this each we have three fractions they should each be 1/3 or 33.333% of the space. 

If you had `1fr 1fr 1fr 1fr` each fraction would be 1/4 or 25%. 

You can mix and match fractions for example: `1fr 1fr 2fr` is a total of 4 fractions and would give us: 1/4, 1/4, and 1/2 or 25%, 25%, and 50%.

The code above is all you need for a simple grid where each cell is the same size. 

### Creating complex grids

CSS Grid provides more tools for creating more-complex grids. One of the best tools is `grid-areas`. This property allows you to define cells that span rows and columns and map elements to those cells. 

This time start with four divs. 

```HTML
<div class="container">
	<div class="box header">Header</div>
	<div class="box side">Sidebar</div>
	<div class="box main">main</div>
	<div class="box footer">Footer</div>
</div>
```

These elements represent the areas of the page and will be mapped to the grid. 

```CSS
.container {
	display: grid;
	grid-template-columns: 1fr 1fr 1fr 1fr;
	grid-gap: 1em;
	grid-template-areas: 
	"h h h h" 
	"s m m m" 
	"s m m m"
	"f f f f";
```

This time we have 4 columns each one fraction. 

The `grid-areas` property is where you will define your grid areas. The letters assign a name and the space used for a cell. 

![Grid Areas](./images/Grid-Areas.png)

The cells will map like this. Imagine `h` represents the header, `s` is the sidebar, `m` is the main content, and `f` is the footer. 

![Grid Areas](./images/Grid-Areas-2.png)

```
"h h h h" 
"s m m m" 
"s m m m"
"f f f f";
```

This arrangement creates four rows and four columns. Notice the syntax. You must use quotes on each line and end the last line with a semicolon. 

**Mapping Elements to Grid Areas**

Notice above that we have given each element a class name: `header`, `side`, `main`, and `footer`. Map each of these elements to one of the defined grid areas like this: 

```CSS
.header {
	grid-area: h;
}

.side {
	grid-area: s;
}

.main {
	grid-area: m;
}

.footer {
	grid-area: f;
}
```

Notice each element is assigned to a grid area by the letter assigned in the template. 

In other words `div.header` maps to the area defined by the `h`.

## Practice with CSS Grid

Above I showed two ways to use CSS Grid. These examples work with only three properties: `grid-template-columns`, `grid-template-areas`, `grid-gap`, and `grid-area`. CSS Grid has a few more properties. 

Explore some more features of CSS Grid here: 

- https://cssgridgarden.com

## After Class

Solve these puzzles and post your answers to Gradescope.

- https://cssgridgarden.com

Apply CSS grid to your Zen Garden page. You can use Grid anywhere you like as long as you have it incorporated somewhere. Here are a few ideas: 

- Use Grid to arrange the page
- Use Grid to arrange just a section
	- `footer` - There are four links here. 
	- `div.design-selection` - The list of links for designs and designers might look good in a grid?
	- `div.main` - has four subsection these might be interesting in a grid.
	- `div.zen-resources` - This section has a list with 5 items, it could be a candidate for a grid.
	- At the bottom of the page there are some extra divs. These were put there for creative purposes you could you arrange these in a grid and give each a background image?

## Resources 

- [Complete Guide to CSS Grid](https://css-tricks.com/snippets/css/complete-guide-grid/)
- [CSS Grid Docs](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Grid_Layout)
- [Grid Systems](https://www.designsystems.com/space-grids-and-layouts/)
- [CSS Grid in 5 mins](https://www.freecodecamp.org/news/learn-css-grid-in-5-minutes-f582e87b1228/)