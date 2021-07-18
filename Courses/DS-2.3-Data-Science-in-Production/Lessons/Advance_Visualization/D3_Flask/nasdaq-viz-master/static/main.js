// Ensure that jquery is working
$(function() {
  console.log("jquery is working");
  createGraph();
});

// Create the graph
function createGraph() {
  const width = 1200;
  const height = 900;
  const format = d3.format(",d"); // specify a decimal format that also allows values to be grouped by commas

  // Color scale generated from i want hue (20 colors)
  const colors = d3
    .scaleOrdinal()
    .range([
      "#56c19e",
      "#d34092",
      "#49b94f",
      "#a54fb7",
      "#adb639",
      "#7264d4",
      "#86b75b",
      "#da7cc9",
      "#557e30",
      "#5675c0",
      "#d69d36",
      "#4facd8",
      "#c9522b",
      "#37845f",
      "#cd3e54",
      "#8d7c38",
      "#ac8dcd",
      "#c78151",
      "#9e4b6f",
      "#db7a80"
    ]);

  // Create a scaling function for scaling all values that are passed in into a range of our choice.
  const getCircleRadius = d3
    .scaleLinear()
    .domain([0, 400])
    .range([20, 60]);

  // Construct the svg to render the drawing to
  const svg = d3
    .select("#chart")
    .append("svg")
    .attr("width", width)
    .attr("height", height)
    .attr("class", "bubble");

  // Fetch the stock data to plot to the svg
  d3.json("/get_stocks").then(function(stocks) {
    // D3 version 5.0 uses d3.pack() instead of d3.layout.pack()
    // pack is what creates the alyout for the bubble
    const nodes = d3.hierarchy(stocks).sum(function(stock) {
      return Number(stock["lastsale"]);
    });

    // D3 version 5.0 uses d3.pack() instead of d3.layout.pack()
    // pack is what creates the layout
    const bubble = d3
      .pack(nodes)
      .size([width, height])
      .padding(1)
      .radius(function(node) {
        console.log(node);
        return 5 + getCircleRadius(node.value / 2) * 1;
      });

    // Select all individual nodes and apply styling to them.
    // We select all nodes on the svg, set their data to be the descendants
    // of the bubble, use enter() to update the drawing, and then apply styling
    const node = svg
      .selectAll(".node")
      .data(bubble(nodes).descendants())
      .enter()
      .filter(function(node) {
        return !node.children;
      })
      .append("g")
      .attr("class", "node")
      .attr("transform", function(data) {
        return "translate(" + data.x + "," + data.y + ")";
      });

    // Style the tooltip (all css)
    const tooltip = d3
      .select("body")
      .append("div")
      .style("position", "absolute")
      .style("z-index", "10")
      .style("visibility", "hidden")
      .style("color", "white")
      .style("padding", "8px")
      .style("background-color", "rgba(0,0,0, 0.75)")
      .style("border-radius", "6px")
      .style("font", "16px sans-serif")
      .text("tooltip");

    // append the circle to the node
    node
      .append("circle")
      .attr("r", function(node) {
        return node.r;
      })
      .attr("fill", function(node, index) {
        // fill each node based on it's index
        return colors(index);
      })
      .on("mouseover", function(node) {
        // Add text to the tooltip and make it visible
        tooltip.text(node.data.name + ": $" + node.data.lastsale);
        tooltip.style("visibility", "visible");
      })
      .on("mousemove", function(node) {
        // Move the tooltip with the mouse
        tooltip
          .style("top", d3.event.pageY - 10 + "px")
          .style("left", d3.event.pageX + 10 + "px");
      })
      .on("mouseout", function() {
        // Set the tooltip to be hidden
        tooltip.style("visibility", "hidden");
      });

    // Label the node (bubble) with the symbol
    // append text to the node and styling for the text
    node
      .append("text")
      .attr("dy", ".3em")
      .style("text-anchor", "middle")
      .text(function(data) {
        return data.data.symbol;
      });
  });
}
