/* eslint-disable no-undef */

/*
Example One: This example will place an svg circle in the center of the svg elelment,
Will give it a a radius of 100 pixels and fill it with a red colour
*/

d3.select('svg#example1')
  .append('circle')
  .attr('cx', 320)
  .attr('cy', 240)
  .attr('r', 100)
  .attr('fill', 'red');

/*
Use D3 to create shapes in svg#example1 using the following attributes/dimensions:
TODO 1: Circle
  set the opacity of the circle below to 0.5
*/
d3.select('svg#example1')
  .append('circle')
  .attr('cx', 150)
  .attr('cy', 150)
  .attr('r', 100)
  .attr('fill', 'red');

/* 
TODO 2: Draw an SVG Lollipop chart with the following attributes:
  line: x1 = 100, y1=100, x2=300, y2=100 stroke=black
  circle: cx=300, cy=100, r=3
  text: x=100, y=90, content="Lolliport Chart"
*/


/*
TODO 3: Draw an SVG Line with the following attributes:
  line:
    x1=100,
    y1=100,
    x2=200,
    y2= 200,
    stroke=rgb(255, 0, 0),
    stroke-width=4
*/

/*
TODO 4: Draw an SVG Rectangle with the following attributes:
  rect:
  x=20,
  y=20
  width=200,
  height=100,
  fill=green
*/

/* 
Example Two: Simple Bar Chart showing ticket slaes for each conference in sales.json
  The bars are rect svg elements and have attributes x,y, height, width and fill color.
 */

// Define the bar height and its spacing and text offset
const BAR_HEIGHT = 50;
const BAR_SPACING = 85;
const TEXT_OFFSET = 18;

d3.json('../data/sales.json')
  .then((data) => {
    d3.select('svg#example2')
      .selectAll('rect')
      .data(data)
      .enter()
      .append('rect')
      .attr('x', 0)
      .attr('height', BAR_HEIGHT)
      .attr('y', (val, idx) => idx * BAR_SPACING)
      .attr('width', (val, idx) => val.tickets_sold)
      .attr('fill', 'green');

    // Code to add the text part of the data visual - conference name and tickets sold:
    d3.select('svg#example2')
      .selectAll('text')
      .data(data)
      .enter()
      .append('text')
      .attr('x', 0)
      .attr('y', (val, idx) => idx * BAR_SPACING + BAR_HEIGHT + TEXT_OFFSET)
      .attr('color', 'black')
      .attr('font-size', '18px')
      .text((val, idx) => `${val.conference_name} - ${val.tickets_sold}`);

    // Code to show difference between tickets sold and tickets available
    d3.select('svg#example2')
      .selectAll('rect#diffs')
      .data(data)
      .enter()
      .append('rect')
      .attr('x', (val, idx) => val.tickets_sold)
      .attr('y', (val, idx) => idx * BAR_SPACING)
      .attr('height', BAR_HEIGHT)
      .attr('width', (val, idx) => Math.abs(val.tickets_sold - val.tickets_available))
      .attr('fill', 'red');
  });

/*
TOD0 5:
  Display a simple Bar Graph like the example above
  It should show the US viewership numbers for each title in 'data/viewership.json'
   */
d3.json('../data/viewership.json')
  .then();

/*
Example 3: Drawing a Line Chart with D3
*/
const lineHeight = 350;

// Create function to draws the line
const lineFunction = d3.line()
  .x((val) => val.month * 25)
  .y((val) => lineHeight - val.sales)
  .curve(d3.curveLinear);

d3.json('../data/monthlySales.json')
  .then((data) => {
    // draw the line
    d3.select('svg#example3')
      .selectAll('path')
      .data(data)
      .enter()
      .append('path')
      .attr('d', lineFunction(data))
      .attr('stroke', 'purple')
      .attr('stroke-width', 2)
      .attr('fill', 'none');

    // add labels
    d3.select('svg#example3')
      .selectAll('text')
      .data(data)
      .enter()
      .append('text')
      .text((val) => val.sales)
      .attr('x', (val) => val.month * 25)
      .attr('y', (val) => lineHeight - val.sales)
      .attr('font-sizwe', '12px')
      .attr('fill', '#666666')
      .attr('text-ancchor', 'start')
      .attr('dy', '.35em');
  });

/* 
TODO 6:
  Draw a Line Chart like the example above.
  It should display the US Viewership numbers for episode in 'data/viewership.json'
*/
d3.json('../data/viewership.json')
  .then();

/*
  Example 4: Drawing a Scatter Plot with D3
*/

// define svg plot height and width
const plotHeight = 350;

// Add min and max values to native Javascript Array Object
Array.max = (array) => Math.max(...array);
Array.min = (array) => Math.min(...array);

// eslint-disable-next-line consistent-return
const showMinMax = (dataset, column, value, type) => {
  const max = d3.max(dataset, (d) => d[column]);
  const min = d3.min(dataset, (d) => d[column]);

  if (type === 'minmax' && (value === max || value === min)) {
    return value;
  } if (type === 'all') {
    return value;
  }
};
d3.json('../data/monthlySales.json')
  .then((data) => {
    // draw/add the dots
    d3.select('svg#example4')
      .selectAll('circle')
      .data(data)
      .enter()
      .append('circle')
      .attr('cx', (val) => val.month * 25)
      .attr('cy', (val) => plotHeight - (val.sales))
      .attr('r', 5)
      .attr('fill', '#666666');

    // add labels
    d3.select('svg#example4')
      .selectAll('text')
      .data(data)
      .enter()
      .append('text')
      .text((val) => showMinMax(data, 'sales', val.sales, 'all'))
      .attr('x', (val) => val.month * 25)
      .attr('y', (val) => plotHeight - (val.sales))
      .attr('font-size', '12px')
      .attr('font-family', 'sans-serif')
      .attr('fill', '#666666')
      .attr('text-anchor', 'start');
  });

/*  TODO 7: Draw a simple scatter plot with D3
  It should display the US Viewership numbers for episode in 'data/viewership.json' 
*/

d3.json('../data/viewership.json')
  .then();

/*
TODO 8 (Stretch Challenge) : Add a function that colours(fills) the dats of the scatter plot
  Colour them green when the value of US Viewership is greater than or equal to 150
  colour them red when the value of US Viewership is less than than 150
*/
