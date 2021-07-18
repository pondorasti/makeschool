
// **************************************************************
// Draw monochrome bars
// Draws a row of vertical bars 

/**
 * 
 * @param {UINT8 Array} frequencyArray 
 * @param {canvas context} ctx 
 * @param {number} width 
 * @param {number} height 
 */

function render(frequencyArray, ctx, count, width, height) {
	// Get the number of values in the data array
	const bars = frequencyArray.length
	// Divide the canvas by the number of bars. 
	const step = width / bars
	const lineWidth = (width / count) - 2
	const int = Math.floor(frequencyArray.length / count)

	// Start a new path
	ctx.beginPath()
	// Erase the screen by filling with white. Use a partially 
	// transparent value so the last drawing leaves a trail
	// Define the fillstyle 
	ctx.fillStyle = 'rgba(255, 255, 255, 0.21)'
	ctx.lineWidth = lineWidth
	// Fill the canvas
	ctx.fillRect(0, 0, width, height)
	ctx.fill()

	let fsum = 0

	for (let i = 0; i < bars; i += int) {
		const f = frequencyArray[i]
		fsum = Math.max(fsum, f)

		// FIXME: This doesn't seem to be drawing quite right so far
		
		if (i % int === 0) {
			const fval = fsum
			// Normalize the audio data against the height of the canvas
			// Here we're converting the 0 to 255 values to 0 to 300
			
			// Next draw a line between two points
			const barLength = fval / 255 * height
			// Starting x value
			const x1 = step * i
			// Starting y (bottom of the canvas)
			const y1 = height
			// Ending x 
			const x2 = x1 
			// Ending y value
			const y2 = height - barLength

			// Draw the line
			// Move to the starting coordinate
			ctx.moveTo(x1, y1)
			// Draw a line to the end coordinate
			ctx.lineTo(x2, y2)
			fsum = 0
		}
	}
	
	ctx.strokeStyle = 'red'
	ctx.stroke()
}

export default render