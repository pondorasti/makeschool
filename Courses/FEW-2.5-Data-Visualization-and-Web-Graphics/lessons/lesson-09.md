
# FEW 2.5 - D3 Scales

<!-- Put a link to the slides so that students can find them -->

<!-- ➡️ [**Slides**](https://make-school-courses.github.io/FEW-2.5-Data-Visualization-and-Web-Graphics/Slides/Lesson-10.html ':ignore') -->


## Lab

Choose an example or tutorial from the D3 site and recreate that example with your own dataset.

**Stretch Challenge:** Recreate a second example. The goal here is to get familiar with D3 to use later in your projects.

<!-- > -->

## Overview

D3 Scales provide a system for normalizing and scaling values for display on the screen.

<!-- > -->

## Why you should know this

Scaling and normalizing data is an important task you'll do it all the time. D3's scale tools provide great functionality.

<!-- > -->

## Learning Objectives

1. Identify scales and uses for normalizing
1. Define a scale for each axis
1. Use the d3.scaleLinear() and
1. Differentiate between scaleLinear and scaleOrdinal

<!-- > -->

## Scale and normalization

Scaling and normalizing allows us to convert values of any range into values that can be displayed on the screen.

Scaling and normalizing works best when working with numbers. Sometimes you'll have values that don't normalize easily. For example names of countries and key words don't translate easily to numbers. Also there are situations where you want to categorize values into buckets. [D3 scaleOrdinal](https://observablehq.com/@d3/d3-scaleordinal) does this for you.

<!-- > -->

Use scaleOrdinal for:

- Converting values to colors
- Converting values into key words
- Converting keywords into a values, colors, or other things

<!-- > -->

## Get Started with scaleOrdinal

Go through and review the following links on your own:

- [Documentation](https://d3-wiki.readthedocs.io/zh_CN/master/Ordinal-Scales/)
- [Scales functions in D3](https://d3indepth.com/scales/)

<!-- > -->

### Ordinal Scale Example

Looking at the Titanic Dataset emabrked is expressed as a letter. D3 has a ordinal scale that allows mapping aribitrary values. 

```JS
// Creates an array of unique values 
const embarked = Array.from(new Set(data.map((p) => p.embarked === undefined ? '?' : p.embarked)))
// Create an  ordinal scale
const embarkedScale = d3.scaleOrdinal()
  .domain(embarked)
  .range(['#ff00ff66', '#ffff0066', '#00ffff66', 'black'])
```

Use the ordinal scale 

```JS
d3.select('#svg')
  .selectAll('circle')
  .data(data)
  .enter()
  .append('circle')
  .attr('cx', (d, i) => i * 600 / data.length)
  .attr('cy', (d, i) => {
    const n = 500 - d.age
    return isNaN(n) ? 500 : n
  })
  .attr('r', (d) => 5)
  // Apply the ordinal scale to embarked for each 
  .attr('fill', (d) => embarkedScale(d.embarked))
```

<!-- > -->

<!-- .slide: data-background="#087CB8" -->
## [**10m**] BREAK

<!-- > -->

## Lab - Part 1

Go to [make.sc/d3-challenges](https://make.sc/d3-challenges). Clone the repo, and work through the challenges in the `D3Scales` folder. You will find the challenges as comments in the corresponding HTML and JS files

<!-- > -->

## Lab Part 2

Choose one of the D3 example/tutorials to recreate. Look for the scale in use. 

<!-- > -->

## After class

- Finish the `D3Scales` challenges
- Continue working on your [Final Visualization 3](Assignments/Data-Visualization-3.md), due 3/4 9:30am

<!-- > -->

## Additional Resources

- https://d3-wiki.readthedocs.io/zh_CN/master/Ordinal-Scales/
- https://bl.ocks.org/d3indepth/fabe4d1adbf658c0b73c74d3ea36d465
- https://d3indepth.com/scales/
- https://github.com/soggybag/FEW-2-5-Data-Visualization-D3

<!-- > -->

## Minute-by-Minute

| **Elapsed** | **Time**  | **Activity**              |
| ----------- | --------- | ------------------------- |
| 0:00        | 0:05      | Overview + Learning Outcomes |
| 0:05        | 0:10      | Scale and normalization |
| 0:15        | 0:20      | Get started with scaleOrdinal |
| 0:35        | 0:55      | Example code |
| 1:30        | 0:10      | Break |
| 1:40        | 1:00      | Lab |
| 2:40        | 0:05      | Wrap up |
| TOTAL       | 2:45      | - |

