/* eslint-disable no-restricted-syntax */
/* eslint-disable no-undef */


// ----------------------------------------------------------

// Example using linear scales 
d3.json('../data/monthlySales.json')
  .then((data) => {
    // Make a linear scale
    // d3.scaleLinear().domain().range()
    const xScale = d3.scaleLinear()
      .domain([1, 10]) // Input values
      .range([0, 500]) // Output values 
      // Challenge - adjust the range to move the first and last elements insude the border

    // Challenge - Make a yScale function
    // Domain sales value 
    // Range is 0 to 400
    const yScale = d3.scaleLinear()
      .domain(d3.extent(data, d => d.sales)) // Input values
      .range([0, 400]) // Output values 

    // 
    d3.select('#example-0')
      .style('border', 'solid 1px')
      .selectAll('circle')
      .data(data)
      .enter()
      .append('circle')
      .attr('r', '10px')
      .attr('fill', '#000')
      // Use the scale here
      .attr('cx', d => xScale(d.month))
      .attr('cy', 200)
    
    // An ordinal scale chooses values from a list
    const monthScale = d3.scaleOrdinal()
      .domain([1, 12]) // The doamin is 1 Jan to 12 Dec
      // The range is a list of Month names.
      .range(['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'])

    
    d3.select('#example-0')
      .style('border', 'solid 1px')
      .selectAll('text')
      .data(data)
      .enter()
      .append('text')
      // Use monthScale() here to turn the month into a name
      .text(d => monthScale(d.month))
      // Use the xScale to position the name on the x
      .attr('x', d => xScale(d.month))
      // Challenge - Use your yScale to position on the y
      .attr('y', 200)

  })

// -------------------------------------------------------

/* Example 1: Drawing a Line Graph using D3 Linera Scale */
const chartHeight = 400;
const chartWidth = 500;
const padding = 25;

d3.json('../data/monthlySales.json')
  .then((data) => {
    
    const xScale = d3.scaleLinear()
      // Use d3.extent() to find the min and max
      .domain( d3.extent(data, d => d.month) )
      .range([0, chartWidth]) // The range is the output value

    // define y Linear Scale
    const yScale = d3.scaleLinear()
      // Use d3.extent() to find the min and max for sales
      .domain([
        d3.min(data, (d) => d.sales),
        d3.max(data, (d) => d.sales)
      ])
      .range([chartHeight, 10])

    // Create function to draws the line
    // d3.line().x().y().curve()
    const lineFunction = d3.line()
      .x(val => xScale(val.month)) // Use the Scale to get the x 
      .y(val => yScale(val.sales)) // Use the scale to get the y
      .curve( d3.curveLinear ); 
      // Try different curve types: 
      // http://bl.ocks.org/d3indepth/b6d4845973089bc1012dec1674d3aff8

    // draw the line
    d3.select('#example1')
      .selectAll('path')
      .data(data)
      .enter()
      .append('path')
      // An svg line is made up data. Use the linefunction to get the data
      .attr('d', lineFunction(data))
      .attr('stroke', 'orange')
      .attr('stroke-width', 4)
      .attr('fill', 'none');

    // add labels
    d3.select('#example1')
      .selectAll('text')
      .data(data)
      .enter()
      .append('text')
      .text(val => val.sales)
      .attr('x', val => xScale(val.month))
      .attr('y', val => yScale(val.sales))
      .attr('font-size', '12px')
      .attr('fill', '#666666')
  });

/*
  TODO 1: Draw a Line Graph Using D3.ScaleLinear
  Load Data from '..data/viewership.json'
  x axis = Episode Number
  y axis = US Viewrship
*/



/*
  Example 2: Adding Axis to the Chart with D3.js
*/

d3.json('../data/monthlySales.json')
  .then((data) => {
    // define x linear Scale
    const xScale = d3.scaleLinear()
      .domain(d3.extent(data, d => d.month))
      .range([padding, (chartWidth - padding)])
      .nice();

    // define y Linear Scale
    const yScale = d3.scaleLinear()
      .domain(d3.extent(data, d => d.sales))
      .range([(chartHeight - padding), 10])
      .nice();

    // Define x and Y axis
    const xAxisGen = d3.axisBottom(xScale);
    const yAxisGen = d3.axisLeft(yScale).ticks(4);

    // Create function to draws the line
    const lineFunction = d3.line()
      .x((val) => xScale(val.month))
      .y((val) => yScale(val.sales))
      .curve(d3.curveBasis);

    // draw the line
    const svg = d3.select('svg#example2');

    // create y Axis
    svg.append('g')
      .call(yAxisGen)
      .attr('class', 'axis')
      .attr('transform', `translate(${padding},0)`);

    // create x Axis
    svg.append('g')
      .call(xAxisGen)
      .attr('class', 'axis')
      .attr('transform', `translate(0,${chartHeight - padding})`);

    svg.append('path')
      .attr('d', lineFunction(data))
      .attr('stroke', 'purple')
      .attr('stroke-width', 2)
      .attr('fill', 'none');
    // add labels
    d3.select('svg#example2')
      .selectAll('text')
      .data(data)
      .enter()
      .append('text')
      .text((val) => val.sales)
      .attr('x', val => xScale(val.month))
      .attr('y', val => yScale(val.sales))
      .attr('fill', '#666666')
      .attr('text-ancchor', 'start')
      .attr('dy', '.35em');
  });

/*
  TODO 2: Draw a Line Graph with Axis Using D3.
  Load Data from '..data/viewership.json'
  x axis = Episode Number
  y axis = US Viewrship
  Use example above to guide
*/

d3.json('../data/viewership.json');

/* Example 3: Drawing a bar Chart Using Ordinal Scale
  We create a color scale using scaleOrdinal
  the Scale maps the years in '..data/eventDates.json' to colors.
*/

d3.json('../data/eventDates.json')
  .then((data) => {
    const svg = d3.select('svg#example3');

    const parseTime = d3.timeParse('%B %d, %Y');

    const dates = [];
    for (const obj of data) {
      dates.push(parseTime(obj.date));
    }

    let domain = d3.extent(dates);
    domain = [d3.timeYear.floor(dates[0]), d3.timeYear.ceil(domain[1])];

    const xScale = d3.scaleTime()
      .domain(domain)
      .range([25, 555]);

    const xAxis = d3.axisBottom(xScale)
      .ticks(d3.timeYear);

    svg.append('g')
      .attr('transform', 'translate(0,70)')
      .call(xAxis);

    const years = d3.map(dates, (d) => d.getFullYear()).keys();

    const colorScale = d3.scaleOrdinal()
      .domain(years)
      .range(['#000000', '#A4A4A4', '#1DA1F2', '#810081']);

    svg.selectAll('rect')
      .data(data)
      .enter()
      .append('rect')
      .attr('x', (d) => xScale(parseTime(d.date)))
      .attr('y', 40)
      .attr('width', 10)
      .attr('height', 30)
      .attr('fill', (d) => colorScale(parseTime(d.date).getFullYear()));
  });

/*
  TODO 3:
  Create a bar graph with the data in '..distanceCovered.json'
  x axis = date
  y axis = distance covered

  HINT: Use ScaleLinear to scale values on y axis
    Use ScaleOrdinal to scale values on the x axis
*/
d3.json('../data/distanceCovered.json')
  .then(() => {

  });

/* TODO 4: Stretch Challenge
  Create a Bar Chart using data in '..data/viewrship.josn'
  x axis = Episode Number
  y axis = US Viewership
*/

d3.json('../data/viewership.json');

/* TODO 5: Stretch Challenge
  Draw a Scatter Plot from the city population data in '..data/cities.csv'
  x axis = city label
  y axis = population
  Make sure to use the d3.scaleLinear function to scale the population numbers
*/

d3.csv('../data/cities.csv');





// Notes on Axis
// http://jonathansoma.com/tutorials/d3/positioning-axes/
// Notes on scales
// https://www.d3indepth.com/scales/



// Titanic
d3.json('../data/titanic-passengers.json')
  .then((data) => {
    const passengers = data.map(p => p.fields)

    // define x linear Scale to position passengers on the x 
    const xScale = d3.scaleLinear()
      .domain([0, passengers.length])
      .range([3, 897])
      .nice();
    
    // Define a linear scale to position passengers on the y based on fare
    const yScale = d3.scaleLinear()
      // .domain([d3.min(passengers.map(p => p.fare)), d3.max(passengers.map(p => p.fare))])
      .domain(d3.extent(passengers, p => p.fare)) // use extent to get min and max
      .range([97, 3])

    // Make an ordinal scale for embarked
    const portScale = d3.scaleOrdinal()
      .domain(['S', 'C', 'Q', 'undefined'])
      .range(['tomato', 'lime', 'gold', 'gray'])

    // Make an oridinal scale for survived
    const survivedScale = d3.scaleOrdinal()
      .domain(['Yes', 'No'])
      .range(['0.5', '0.15'])

    const ageScale = d3.scaleSqrt()
      .domain([d3.min(passengers.map(p => p.age)), d3.max(passengers.map(p => p.age))])
      .range([1, 10])

    d3.select('#titanic-data')
      .style('background-color', '#111')
      .selectAll('rect')
      .data(passengers)
      .enter()
      .append('rect')
      .attr('width', p => 1)
      .attr('height', p => ageScale(p.age))
      .attr('x', (p, i) => xScale(i))
      .attr('y', (p, i) => yScale(p.fare))
      .attr('fill', p => portScale(p.embarked))
      .attr('opacity', p => survivedScale(p.survived))
  })
