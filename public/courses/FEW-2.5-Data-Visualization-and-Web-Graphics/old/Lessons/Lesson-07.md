# FEW 2.5 Graphing charting libraries

Libraries save time in development. Besides using libraries you may want to write your own. We wrote code to create charts and graphs earlier now it's time to see what types of preexisting solutions exist. 

## Why? 

These libraries do the things that you did earlier in this class. All of the methods and classes in these libraries started with same goals you had and built on the same concepts you worked through ealier in the term.

Looking at how other implement APIs that do the same kinds of things yoiu are working on and have experience with is great for learning and furthering your ability.

You may also find that you need to solve a problem with a library in the future. 

## Learning Objectives/Competencies

- Use Libraries to create charts and graphs
- Compaere APIs with profesional level tools
- Indentify similarities in APIs and solutions 
- Use CDN for hosting libraries

## Content Delivery Networks CDNs

Content Delivery Networks host files that you can link to. While you could host files on your own using a CDN provides these advantages:

- Decreased server load - Files are stored across mulitple servers. 
- Speeds Content load times - Data loads faster when it's spread across mulitple servers
- Chaching - Cahed files don't need to be loaded again
- Easier File Management - Files on the CDN are files you don't have to manage. 

CDNs also have a some disadvanatages: 

- Some restrictions 
- Loss of control

## Chart.js 

[Chart JS](https://www.chartjs.org) describes itself as: 

> Simple yet flexible JavaScript charting for designers & developers

This is a library that does many of the things you did earlier in the term. Chart.js uses canvas. 

## Chartist

Chartist is similar to ChartJS but uses SVG inplace of canvas. 

## What do you need todo? 

You need to make graphs with one or both of these libraries. Both libraries work in similar ways. You supply an array of values and some other options and the library draws the chart. 

You are starting with data in JSON format. For the most part this is not usable directly with either library. You will need to write code that extracts the values you want to graph and supplies these to the library. 

You will also need to generate some other values. These other values are things like: 

- Width and height of the chart
- Array of labels
- Array of colors
- A DOM element where the chart will appear

Width, height and DOM elements are easy to come up with. 

## Labels and colors 

Labels and colors may take a little be of thought and some strategy. 

## Reading Documentation 

Be sure to read the documentation! Seriously, everything you need know is probably there. Both libraries have 

- [Chart JS Docs](https://www.chartjs.org/docs/latest/)
- [Chartist Docs](https://gionkunz.github.io/chartist-js/api-documentation.html)

## Making Charts

Your goal is to make some charts with these libraries. Look at the types of charts available to us: 

- [Line](https://www.chartjs.org/docs/latest/charts/line.html)
- [Bar](https://www.chartjs.org/docs/latest/charts/bar.html)
- [Radar](https://www.chartjs.org/docs/latest/charts/radar.html)
- [Doughnut & Pie](https://www.chartjs.org/docs/latest/charts/doughnut.html) 
- [Polar](https://www.chartjs.org/docs/latest/charts/polar.html)
- [Bubble](https://www.chartjs.org/docs/latest/charts/bubble.html) 
- [Scatter](https://www.chartjs.org/docs/latest/charts/scatter.html)
- [Area](https://www.chartjs.org/docs/latest/charts/area.html)
- [Mixed](https://www.chartjs.org/docs/latest/charts/mixed.html)

Discussion: what type of data works best for which type of chart? 

## Examples 

Read the notes in these [examples](../lesson-07.html). 

## After Class

- Start working on visualization 4

## Additional Resources

- [Chart JS Docs](https://www.chartjs.org/docs/latest/)
- [Chartist Docs](https://gionkunz.github.io/chartist-js/api-documentation.html)
- [examples](../lesson-07.html)
- [Line](https://www.chartjs.org/docs/latest/charts/line.html)
- [Bar](https://www.chartjs.org/docs/latest/charts/bar.html)
- [Radar](https://www.chartjs.org/docs/latest/charts/radar.html)
- [Doughnut & Pie](https://www.chartjs.org/docs/latest/charts/doughnut.html)
- [Polar](https://www.chartjs.org/docs/latest/charts/polar.html)
- [Bubble](https://www.chartjs.org/docs/latest/charts/bubble.html)
- [Scatter](https://www.chartjs.org/docs/latest/charts/scatter.html)
- [Area](https://www.chartjs.org/docs/latest/charts/area.html)
- [Mixed](https://www.chartjs.org/docs/latest/charts/mixed.html)
