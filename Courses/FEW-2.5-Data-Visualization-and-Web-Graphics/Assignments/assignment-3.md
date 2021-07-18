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

**Challenge 1** follow the tutorial and notes from lesson. Get the base visualizer working. Use the sample code here: 

https://github.com/Make-School-Labs/FEW-2-5-Data-Visualization-Real-Ttime-Data

**Challenge 2** modify the HTML and CSS that presents the visualizer. Design the page. 

**Challenge 3** modify the drawing code of the visualizer. With this challenge your goal is to make a drawing of frequencies something unique and different from what is in the original tutorial. 

This challenge is open ended you can appy yourself to any area that interests you and meets your ability level. By the end of the assignment you should have a audio visualizer that looks different from the examples. Be sure to change at least the following things: 

- color of the lines or fills
- geometry of the lines and fills
- line width

### Submission and Due Date 

- Due Feb. 17 
- Submit your GitHub Project on GradeScope. 

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