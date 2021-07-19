<!-- .slide: data-background="./Images/header.svg" data-background-repeat="none" data-background-size="40% 40%" data-background-position="center 10%" class="header" -->
# FEW 1.1 - Designing with a Grid

CSS Grid is a two dimensional layout system with many option. 

Here are a couple strategies you can use to create a grid.

<!-- Put a link to the slides so that students can find them -->

➡️ [**Slides**](/Syllabus-Template/Slides/Lesson1.html ':ignore')

<!-- > -->

## Designing on a Grid

Grids are used to arrange content. Originally used with print publications like books, newspapers and magazines. Grids are even more important on the web. 

A grid is a design tool. Use grids create well designed good looking pages that present infromation well. 

**Grids used for design are not the same as CSS Grid or Flexbox. Grid used for design is how you choose to arrange elements on a page.**

CSS tools are used to arrange elements on a page. Your goal is to use these tools to arrange your content ont he grid you imagine. 

<!-- > -->

## Learning Objectives/Competencies

1. Identify columns and rows
1. Identify Grids in the wild
1. Define a visual grid
1. Define a Grid Parent
1. Identify chid grid items
1. Create grid columns

<!-- > -->

### Study Grids

- Read this article and discuss it with a partner
  - https://webdesign.tutsplus.com/articles/a-comprehensive-introduction-to-grids-in-web-design--cms-26521
  - Answer the questions below: 
    - What is a grid?
    - Why use a grid?
    - What is a unit?, what is a gutter?, what is a column?, what is a field?
    - Why use 12 columns? 
    - What is the rule of thirds? Do you think this works? 

<!-- > -->

### Mock up with Grid

Use Sketch, Adobbe XD, or other tool to Mock up your personal page. This time use a grid. 

Show the grid overlay in your design tool. 

- Sketch: View > Canvas > Show Layout
- Adobe XD: View > Show Layout Grid

<!-- > -->

## Identify Grids in the wild

- Work with a group and identify grids in the sites below
  - Your job is to identify
    - Units
    - columns 
    - proportions 1/2, 1/3, 1/4, 2/3 + 1/3...
    - Fields

1. https://www.nike.com/us/en_us/
2. https://www.facebook.com
3. https://www.apple.com/mac/
4. https://dribbble.com
5. https://slack.com
6. https://www.nintendo.com/switch/
7. https://www.reddit.com
8. https://www.ea.com
9. https://www.codecademy.com/catalog/subject/all
10. https://terraria.org
11. https://store.steampowered.com
12. https://www.youtube.com
13. http://www.ycombinator.com
14. https://atom.io
15. https://www.yelp.com
16. https://www.sushirrito.com
17. http://www.bobaguys.com
18. http://www.makenoisemusic.com
19. http://www.gibson.com
20. https://www.fender.com

- Stretch challenge: 
  - Study each of the sites above and understand their grid system. Take a screen shot and draw the grid over the image. 

<!-- > -->

### Lab 

Using your design tool (Sketch, XD etc.) redesign your personal site with grid. 

- Msake a new artboard. Size it to match your desktop ~1420
- Turn on the layout grid.
- Draw boxes on grid for each content item in your personal site.
  - Draw a box for each content item
  - Boxes should take up grid columns and not end inside a gutter

<!-- > -->

## Break

Take a 10 minute break.

<!-- > -->

## CSS Grid

CSS Grid is a tool set of CSS properties that arrange content on a grid. Similar to Flexbox. The two differ with Flex being a one dimensional layout where Grid is a two dimensional layout. 

<!-- > -->

CSS Grid is used for 2 dimensional layouts.

Use grid when you want to arrange elements in rows and columns. 

<!-- > -->

CSS Grid has many properties. You get started with just a few. 

```CSS
.container {  
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
}
```

Creates three equal columns. 

<!-- > -->

**`fr`** is a unit that represents a fraction. 

Something sized in `fr` will take up a fraction of the available space. 

- `1fr 1fr 2fr` - 25% 25% 50%
- `1fr 1fr 2fr` - 1/4 1/4 2/4

<!-- > -->

Grid columns can also be defined with other units:

```CSS
.container {  
  display: grid;
  grid-template-columns: 200px 1fr 200px;
}
```

Creates three columns where the outer columns are 200px and the inner column takes up the rest of the available space. 

<!-- > -->

If you're making many columns it can tedious to list them all e.g. `1fr 1fr 1fr 1fr 1fr...`

In this case use `repeat()`

```CSS
.container {  
  display: grid;
  grid-template-columns: repeat(1fr, 6);
}
```

Creates 6 equal columns.

<!-- > -->

You can mix repeat a patern. 

```CSS
.container {  
  display: grid;
  grid-template-columns: repeat(100px 1fr, 3);
}
```

Creates the pattern: `100px 1fr 100px 1fr 100px 1fr`

<!-- > -->

What about row height? Most often you'll want to set this automatically to match the size of the content. To do this don't declare it. 

If you want to set the height of a row use: 

```CSS
.container {  
  display: grid;
  grid-template-columns: repeat(1fr, 3);
  grid-template-rows: repeat(300px, 6);
}
```

Creates 6 300px tall rows. 

<!-- > -->

## Wrap Up (5 min)

- 

<!-- > -->

## Additional Resources

1. [CSS Grid video playlist](https://www.youtube.com/watch?v=Cxegg6ysdwc&list=PLoN_ejT35AEhwu7PJLHhKKzY7C4tMVHtp) 

<!-- > -->

## Minute-by-Minute [OPTIONAL]

| **Elapsed** | **Time**  | **Activity**              |
| ----------- | --------- | ------------------------- |
| 0:00        | 0:05      | Objectives                |
| 0:05        | 0:15      | Overview                  |
| 0:20        | 0:30      | In Class Activity I       |
| 0:50        | 0:10      | BREAK                     |
| 1:00        | 0:45      | In Class Activity II      |
| 1:45        | 0:05      | Wrap up review objectives |
| TOTAL       | 1:50      | -                         |

