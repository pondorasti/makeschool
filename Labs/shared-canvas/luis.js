import ctx, { size } from './main.js'

const canvas = document.querySelector('canvas')
			const ctx = canvas.getContext('2d')

			const size = 113
			const x = 1 * size
			const y = 2 * size

			// draw a square
			ctx.beginPath()
			ctx.rect(x, y, size, size)
			ctx.fillStyle = '#b3b3b3'
			ctx.fill()

			// draw a circle 
			ctx.beginPath()
			// draw a complete circle
			ctx.arc(x + size / 2, y + size / 2, 40, 0, Math.PI * 2)
			ctx.fillStyle = '#593F62'
			ctx.fill()

			// Stroke a path
			ctx.beginPath()
			// draw half a circle
			ctx.arc(x + size / 2, y + size / 2, 45, 0, Math.PI * 2)
			ctx.lineWidth = 3
			ctx.strokeStyle = '#7B6D8D'
			ctx.stroke()
      
      ctx.beginPath()
			// draw half a circle
			ctx.arc(x + size / 2, y + size / 2, 30, 0, Math.PI * 2)
			ctx.lineWidth = 3
			ctx.strokeStyle = '#8499B1'
			ctx.stroke()


      // diagonal line
      ctx.beginPath();
      ctx.moveTo(225, 227)
      ctx.lineTo(114, 338)
      ctx.lineWidth = 5
      ctx.strokeStyle = "white"
      ctx.stroke()


			
			// Use the docs to figure out how to draw other things
			// https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D
