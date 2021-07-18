// ---------------------------------------------------------
// Draw circles in a grid

/**
 * 
 * @param {UINT8 Array} frequencyArray 
 * @param {canvas context} ctx 
 * @param {number} canvas width 
 * @param {number} canvas height 
 */


function render(frequencyArray, ctx, width, height) {
	// Fill the canvas with a color before drawing 
	ctx.fillStyle = 'rgba(255, 255, 255, 0.2)' 
	ctx.fillRect(0, 0, width, height)
	ctx.fill()

	// Calculate some values needed to draw the frequency data
	// There will be 32 circles in each row
	const bars = frequencyArray.length // Number of values 
	const step = width / 32            // space between each circle
	const colorStep = 360 / bars       // step between each hue/color
	const pi2 = Math.PI * 2

	// Draw circles in a grid
	frequencyArray.forEach((f, i) => {
		// The diameter of each small circle is 30px the value of each 
		// frequency data (f) is 0 to 255. 
		// Normalize f from 0 - 255 to 0 - 30 
		const radius = f / 255 * 30
		// Calculate x and y as grid 
		const x = i % 32 * step             // Get the x position 
		const y = Math.floor(i / 32) * step // get the y position
		// Start new path
		ctx.beginPath()
		// Draw circle at x and y of radius
		ctx.arc(x, y, radius, 0, pi2)
		// Set fill color by multiplying the index by color Step
		ctx.fillStyle = `hsla(${colorStep * i}, 100%, 50%, 0.15)`
		ctx.fill()
	})
}


export default render