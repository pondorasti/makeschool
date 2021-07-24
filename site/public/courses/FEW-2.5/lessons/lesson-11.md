
# FEW 2.5 - D3 Maps

<!-- Put a link to the slides so that students can find them -->

<!-- ➡️ [**Slides**](https://make-school-courses.github.io/FEW-2.5-Data-Visualization-and-Web-Graphics/Slides/Lesson-11.html ':ignore') -->

<!-- > -->

## Overview

You should be working on your individual project and it will have problems to solve that will be unique to your ideas and dataset. Today we will have a workshop to solve problems. 

<!-- > -->

## D3 in Depth Guide 

Use this in depth guide to D3 to solve problems and find solutions. 

https://www.d3indepth.com

See the sections at the bottom of the page. 

If you're working with maps see the notes below. 

<!-- > -->

## Learning Objectives

1. Build data visualizations with geojson
1. Explain latitude and longitude
1. Describe geo projections

<!-- > -->

## How to measure the world?

The world is a globe and we've divided it into latitude and longitude.

**Read the following articles to better understand latitude and longitude**

- https://www.maptools.com/tutorials/lat_lon/definitions
- https://gisgeography.com/utm-universal-transverse-mercator-projection/

<!-- > -->

**In pairs, discuss why you would use latitude and longitude, and when you would use UTM**

Fun site: find geo-coordinates for your home town:

- https://www.latlong.net/

<!-- > -->

## Maps

Computer screens are flat. Maps displayed on computer screens are flat. If the world is described in coordinates, and the map is a globe, then it needs to be projected onto a flat surface. This is accomplished through some tricky math involving trigonometry.

_Luckily D3 provides a suite of functions that handle map projections for you!_

While it is great you don't have work out the math yourself you do have to understand that these projections are not perfect. Flattening a sphere onto a flat surface will always be imperfect.

<!-- > -->

## Discussion

In pairs, discuss the following:

- What is geojson?
	- https://geojson.org/
- Why do we need special projection models?
	- https://d3indepth.com/geographic/

We'll discuss as a class after 5 minutes of paired discussion.

<!-- > -->

## Mapping with D3 tutorial

This is a great tutorial on mapping with D3. It uses v5 so it's up to date. Besides that it was written by a cartographer!

- https://petrichor.studio/2018/05/21/get-started-creating-d3-maps/

**Read the blog post. Then create a map of your own. Use the sample code provided in the codepen example to recreate the example on your desktop.**

<!-- > -->

Be sure to follow up with the links at the bottom of the post, as these have valuable info on creating and using maps.

**Challenges**

- Make the map work using the same TopoJSON that the tutorial uses
- Try different projections
	- https://github.com/d3/d3-geo#geoAzimuthalEqualArea
- Edit the CSS to change the color of the fill and stroke

<!-- > -->

<!-- .slide: data-background="#087CB8" -->
## [**10m**] BREAK

<!-- > -->

## Lab

Work on your final project/presentations

<!-- > -->

## After Class

- Continue working on your [Final Visualization 3](Assignments/Data-Visualization-3.md), due 3/4 9:30am **Before Class!**

<!-- > -->

## Additional Resources

- https://petrichor.studio/2018/05/21/get-started-creating-d3-maps/
- https://github.com/d3/d3-geo
- https://observablehq.com/@d3/projection-comparison
- https://observablehq.com/collection/@d3/d3-geo
- https://d3indepth.com/geographic/

<!-- > -->

## Minute-by-Minute

| **Elapsed** | **Time**  | **Activity**              |
| ----------- | --------- | ------------------------- |
| 0:00        | 0:05      | Overview + Learning Outcomes                |
| 0:05        | 0:15      | How to measure the world                  |
| 0:20        | 0:15      | Maps + Discussion       |
| 0:35        | 0:45      | Mapping with D3 tutorial       |
| 1:20        | 0:10      | BREAK                     |
| 1:30        | 1:10      | Lab      |
| 2:40        | 0:05      | Wrap up  |
| TOTAL       | 2:45      | -                         |
