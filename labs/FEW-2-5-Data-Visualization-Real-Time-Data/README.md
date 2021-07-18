# FEW 2.5 Assignment 3 - Real time visualization

Real Time data: Audio Visualizer. 

## Learning Objectives 

1. Use canvas to display data
1. Draw data in real time
1. Use normalization

## Goals 

Your Goal create an audio visualizer with JavaScript. You'll be drawing audio data onto canvas with JavaScript. The audio analyzer provides an array of 1024 8 bit integers. Your job is to turn these into something that can be drawn on canvas. The values represent the magnitude of a audio at one of 1024 frequency bands. 

Frequncy band is represented as the index in the array for each value. At each frquency band you will also have a value of 0 to 255. 

On canvas you will be displaying pixels. You can draw them at an x and y coordinate, and you can set the color. You can draw shapes like lines, circles and rectangles. These might have a location positioned at an x and y, and might have a length, width, and height.

## Getting started 

The repo contains HTML and JS files along with a couple sample sound files. Since the sounds are loaded from the `file:///` route you'll get a CORS error if you open the HTML from your desktop. To solve this be sure to run the files from a local server. If you're using VSCode install LiveServer. 

## Editing the code 

This project is setup to run from `index.html`. The main program is in `main.js`. The rendering process that vidsualizes the audio is broken up into separate modules. I've included a few sample renderers. You goal is to make your own renderer. 

Each rendering module is a function that takes the frequency array and canvas context as arguments. Sometimes there are other arguments if needed. Take a look at the comments in each of these files for notes. 

**Challenge 1** Follow the tutorial and notes from lesson. Get the base visualizer working. Test out the sample code by running it in your browser. 

Try this: 

- Open the visualization in your browser. You'll need to use a local server. Live Server plug in for VSCode is a good choice. 
- Press the play, button listen to the audio and watch the visualization. Notice the red lines draw out from the circle in the center. The lines start at 3:00. This is the lowest frequency. As frquencies get higher the lines are drawn outward from angles clockwise around the circle. 

The length of the lines is determined by the audio frquency data. The position around the circle or angle of the line is determined by the index of the value. 

**Challenge 2** Modify the HTML and CSS that presents the visualizer. Design the page.

Try this: Change the size of the canvas. Find the cavas tag and change the `width` and `height` values. 

The circle isn't centered because the code draws based on the 300 value. This will need to be adjusted in the code. 

Change the CSS at the top of the page. You can adjust the style of the buttons, the background of the body, or the border on the canvas. Everything that is drawn on the canvas needs to be adjusted in the JS code. 

**Challenge 3** Try some of the demo visualizers. Open `main.js` find the `render()` function at the bottom of the page. This draws the audio data to the canvas. 

At the top it defines the `centerX` and `centerY`. 

Try this: Adjust the centerX and centerY values to match what you used when you changed the canvas size. 

The canvas may not be clearing the drawing since the renderer is not aware that you changed the size ofg the canvas. 

Find: `analyser.getByteFrequencyData(frequencyArray)`. This line gets the array of audio data. The code here passes this array to one of the renderer functions below. 

Try this: There is a list of renderers that have been commented here. Comment and uncomment each to test it out. 

Notice each of these rendering functions takes `frequencyArray` as the first parameter and `ctx` (canvas context) as the second parameter. 

Uncomment `circleGridRenderer(frequencyArray, ctx, 300, 300)`. The last two parameters here `300` set the width, and height for the drawing. Change these to size of the canvas you used. 

The `circleGridRenderer` render draws the frequency data as a grid of circles. Using the index and frequency value for: 

- index - determines the color low frequencies are red. As the colors get higher in frequency tthey move around the color wheel
- index - determines position of each circle. Low frequency starts in the upper left. High frqeuncies move to the lower right. 
- value - the value of each frequency determines the size of the circles drawn at each position on the grid.

**Challenge 4** Open `renderCircleGrid.js` take a look at the code. 

The first three lines here erase the previous drawing by filling the canvas with transparent color. Change the first line to: `ctx.fillStyle = 'rgba(0, 0, 0, 0.2)'`. This should fill with black. 

play with the values here. Especially the last number which is the transparency of the color. 

Read through the other comments here. 

Try this: Change the radius of the small circles. Currently each frequency value is rendered as a small circle on a grid. Each of these circles is 0 to 30 pixels in radius.

**Challenge 5** Make your own renderer! This is a big challenge is the core of this assignment. This assignment is open ended. Try any or all of the challenges below: 

- Refactor one of the existing renderers. These could use some improvement especially in how they handle parameters. 
	- improve parameters by using an object to pass the parameters. 
	- add new parameters, such as the height and width or colors that a renderer might use. 
- Make your own renderer! 

### Submission and Due Date 

- Due Feb. 15
- Submit your GitHub Project on [GradeScope](https://www.gradescope.com/courses/218919). 

## Evaluate your progress

| Expectation | Doe not meet | Meets | Exceeds |
|:-------------|:------------------|:----------------|:-----------------|
| **Completion** | Visualizer doesn't work or looks like the original tutorial | Visualizer works and has a unique appearance | Paterns displayed are fun and interesting, people comment when they see it. |
| **Code quality** | The code is sloppy and unorganized or throws errors and warnings | Code is well organized and works without errors | Shows no linter errors or warnings |

Learning Objectives 

| Expectation | Doe not meet | Meets | Exceeds |
|:-------------|:------------------|:----------------|:-----------------|
| **Canvas** | Can't explain canvas | Can explain canvas | Can explain canvas and several of it's commonly used methods. |
| **requestAnimationFrame** | Can't explain requestAnimationFrame() | Can explain requestAnimationFrame() | Could apply requestAnimationFrame to another project where appropriate. |








# FEW 2.5 Real time data project 

This repo contains some starter code you can use to get started on your real time data exploration. 

The code in this repo creates an audio visualizer built with JavaScript. 





 
