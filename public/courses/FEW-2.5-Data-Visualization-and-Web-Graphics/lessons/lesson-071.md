
# FEW 2.5 - Graphing charting libraries

<!-- Put a link to the slides so that students can find them -->

➡️ [**Slides**](https://make-school-courses.github.io/FEW-2.5-Data-Visualization-and-Web-Graphics/Slides/Lesson-7.html ':ignore')

<!-- > -->

## Minute-by-Minute

| **Elapsed** | **Time**  | **Activity**              |
| ----------- | --------- | ------------------------- |
| 0:00        | 0:05      | Overview and Learning Outcomes                |
| 0:05        | 0:10      | CDNs                  |
| 0:15        | 1:00      | ChartJS       |
| 1:15        | 0:10      | BREAK                     |
| 1:25        | 1:15      | Lab      |
| 2:40        | 0:05      | Wrap up and review homework |
| TOTAL       | 2:45      | -                         |


<!-- > -->

## Overview

Libraries save time in development. Besides using libraries you may want to write your own. We wrote code to create charts and graphs earlier now it's time to see what types of preexisting solutions exist.

<!-- > -->

## Why you should know this?

These libraries do the things that you did earlier in this class. All of the methods and classes in these libraries started with same goals you had and built on the same concepts you worked through earlier in the term.

Looking at how others implement APIs that do the same kinds of things you are working on and have experience with is great for learning and furthering your ability.

You may also find that you need to solve a problem with a library in the future.

<!-- > -->

## Learning Objectives

- Use Libraries to create charts and graphs
- Compare APIs with professional level tools
- Identify similarities in APIs and solutions
- Use CDN for hosting libraries

<!-- > -->

## Content Delivery Networks CDNs

Content Delivery Networks host files that you can link to. While you could host files on your own using a CDN provides these advantages:

- Decreased server load - Files are stored across multiple servers.
- Speeds Content load times - Data loads faster when it's spread across multiple servers
- Caching - cached files don't need to be loaded again
- Easier File Management - Files on the CDN are files you don't have to manage.

<!-- v -->

CDNs also have a some disadvantages:

- Some restrictions
- Loss of control


<!-- > -->

## ChartJS

[Chart JS](https://www.chartjs.org) describes itself as:

> Simple yet flexible JavaScript charting for designers & developers

This is a library that does many of the things you did earlier in the term. ChartJS uses canvas.

<!-- v -->

## Documentation

Be sure to read the documentation! Seriously, everything you need know is probably there. Both libraries have

- [Chart JS Docs](https://www.chartjs.org/docs/latest/)

<!-- v -->

## Making Charts

Look at the types of charts available to us in ChartJS, and then **discuss what type of data works best for which type of chart**

<!-- v -->

- [Line](https://www.chartjs.org/docs/latest/charts/line.html)
- [Bar](https://www.chartjs.org/docs/latest/charts/bar.html)
- [Radar](https://www.chartjs.org/docs/latest/charts/radar.html)
- [Doughnut & Pie](https://www.chartjs.org/docs/latest/charts/doughnut.html)
- [Polar](https://www.chartjs.org/docs/latest/charts/polar.html)
- [Bubble](https://www.chartjs.org/docs/latest/charts/bubble.html)
- [Scatter](https://www.chartjs.org/docs/latest/charts/scatter.html)
- [Area](https://www.chartjs.org/docs/latest/charts/area.html)
- [Mixed](https://www.chartjs.org/docs/latest/charts/mixed.html)

<!-- v -->

## Examples

Read the notes in these [examples](../lesson-07.html).

<!-- v -->

## ChartJS Activity

You need to make graphs with ChartJS! You supply an array of values and some other options and the library draws the chart.

First you will need to find some data to use in JSON format. For the most part this is not usable directly with either library. You will need to write code that extracts the values you want to graph, and supply these to the library.

<!-- v -->

You will also need to generate some other values. These other values are things like:

- Width and height of the chart
- Array of labels
- Array of colors
- A DOM element where the chart will appear

Width, height and DOM elements are easy to come up with. Labels and colors may take a little bit of thought strategy.

<!-- > -->

<!-- .slide: data-background="#087CB8" -->
## [**10m**] BREAK

<!-- > -->

## Lab

Finish the ChartJS activity if you haven't already.

If you have finished it, work on the below activity:

Chartist is similar to ChartJS but uses SVG instead of canvas. You will need to make graphs using the same data as the ChartJS activity, or you can use a new JSON data source.

Make sure to read the documentation!

- [Chartist Docs](https://gionkunz.github.io/chartist-js/api-documentation.html)

Copied below is the same requirements from the ChartJS activity for reference:

<!-- v -->

First you will need to find some data to use in JSON format. For the most part this is not usable directly with either library. You will need to write code that extracts the values you want to graph, and supply these to the library.

You will also need to generate some other values. These other values are things like:

- Width and height of the chart
- Array of labels
- Array of colors
- A DOM element where the chart will appear

Width, height and DOM elements are easy to come up with. Labels and colors may take a little bit of thought strategy.

<!-- > -->

## After Class

- Finish [Visualization 2](Assignments/Data-Visualization-2.md), due TONIGHT, 11:59pm

<!-- > -->

## Additional Resources

- [Chart JS Docs](https://www.chartjs.org/docs/latest/)
- [Chartist Docs](https://gionkunz.github.io/chartist-js/api-documentation.html)
- [examples](../lesson-07.html)
- [Line](https://www.chartjs.org/docs/latest/charts/line.html)
- [Bar](https://www.chartjs.org/docs/latest/charts/bar.html)
- [Radar](https://www.chartjs.org/docs/latest/charts/radar.html)
- [Doughnut & Pie](https://www.chartjs.org/docs/latest/charts/doughnut.html)

... more below!

<!-- v -->

- [Polar](https://www.chartjs.org/docs/latest/charts/polar.html)
- [Bubble](https://www.chartjs.org/docs/latest/charts/bubble.html)
- [Scatter](https://www.chartjs.org/docs/latest/charts/scatter.html)
- [Area](https://www.chartjs.org/docs/latest/charts/area.html)
- [Mixed](https://www.chartjs.org/docs/latest/charts/mixed.html)
