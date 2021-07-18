# FEW 2.5 D3 Maps

D3 is pretty amazing it seems to do everything even map the United States or the world! 

## Why? 

It's quite possible you may need to create a map and put things on it. While Google maps is amazing it's different tool for different uses. Google maps are also limited in the customization that is allowed. 

## Learning Objectives/Competencies

1. Identify and describe geojson
1. Describe and use map projection

## How to measure the world? 

The world is a globe and we've divided it into latitude and longtitude. 

https://www.maptools.com/tutorials/lat_lon/definitions
https://gisgeography.com/utm-universal-transverse-mercator-projection/

Find geo-coordinates for your home town: 

https://www.latlong.net/

## Maps 

Computer screens are flat. Maps displayed on computer screens are flat. If the world is described in coordinates that map a globe they need to be projected onto a flat serfuce. This accomplished through some tricky math involving trigonometry. 

Luckily D3 provides a suite of functions that handle map projections for you! 

While it is great you don't have work out the math yourself you do have to understand that these projections are not perfect. Flattening a sphere onto a flat surface will always be imperfect. 

## Discussion

- What is geojson?
	- https://geojson.org/
- Why do we need special proection models?
	- https://d3indepth.com/geographic/

## Mapping with D3 tutorial

This is a great tutorial on mapping with D3. It uses v5 so it's up to date. Besides that it was written by a cartographer! 

- https://petrichor.studio/2018/05/21/get-started-creating-d3-maps/

Read the blog post. Then create a map of your own. Use the sample code provided in the codepen example to recreate the example on your desktop. 

Be sure to follow up with the links at the bottom of the post these have valuable info on creating and using maps. 

- Challenges
	- Make the map work from files on your desktop
	- Try different projections
		- https://github.com/d3/d3-geo#geoAzimuthalEqualArea
	- Edit the CSS to change the color of the fill and stroke

## After Class

- Complete your final visualization

## Additional Resources

- https://petrichor.studio/2018/05/21/get-started-creating-d3-maps/
- https://github.com/d3/d3-geo
- https://observablehq.com/@d3/projection-comparison
- https://observablehq.com/collection/@d3/d3-geo
- https://d3indepth.com/geographic/
