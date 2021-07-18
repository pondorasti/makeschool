# Animation and Interaction

Showing data in the static form is a good start, but sometimes you can say more by adding motion and interaction.

## Why to do you need to know this? 

User interaction is a prime directive for front end developers. Handling complex user interaction is something every front end developer should know how to do. 

## Objectives 

1. Handle user interaction
1. Use systems to manage user options and handle UI state 
1. Use querySelector, and querySelectorAll to work with DOM elements and collections of elements

## Buttons 

A button handles one action and usually runs the same code every time you click or tap it. 

For example a doorbell, or a login button.

Essentially a button usually allows for one choice or action. 

## Toggle Buttons

A toggle button is a button that will be in one of two states. It might run one of two different blocks of code with each interaction. 

For example a light switch, or a checkbox. 

A toggle button needs to track its state. For example, a light switch needs to know whether it's in the on state or the off state, or a checkbox needs to know whether it's checked or not. 

Essentially a toggle button allows for two choices or actions that alternate. 

## Button Group

In this case, I'm referring to a group of buttons where only one can be selected at a time. Imagine this as a set of choices where a user can choose one option. 

This is similar to radio buttons. 

Think of a button group as a set of N choices where only one can be chosen at any time. 

### Buttons and the data viz

You'll be creating a visualization that has some interaction this week. Your goal is to think of ways you can modify your visualization, and choose the right button/interaction for it. 

## Color 

Color can be in a few ways in JS. 

- hex colors: `#0f0` or `#00ff00`
- keyword colors: `red` or `blue`
- rgb: `rgb(0, 255, 0)`
- rgba: `rgba(0, 255, 0, 0.5)`
- hsl: `hsl(120, 50%, 77%)`
- hsla: `hsla(120, 50%, 77%, 0.6)`

In all cases, it comes down to string manipulation. For any color, you want to generate you'll need to generate a string similar to one of the strings above and assign that to a style property. 

If you're generating colors in sequence HSL have the advantage that the hue is separate from the other color components. Hue has a range of 360 degrees. 

```JavaScript 
const numberOfColors = 12
const step = 360 / numberOfColors
for (let i = 0; i < numberOfColors; i += 1) {
    const hue = step * i
    const colorString = `hsl(${hue}, 70%, 50%)`
    ...
}
```

The code above would generate 12 colors equally spaced around the color wheel. 

Use RGBA or HSLA when you need to transparent colors. The last value is the alpha (transparency) of the color. 

## Motion 

Motion can be easily added to any element using a CSS transition. An element that has a transition time will have it's properties change over the time of the transition. 

For example 

```JavaScript 
const el = document.createElement('div')
el.style.width = '100px'
el.style.height = '100px'
el.style.backgroundColor = '#f00'

el.style.transition = '1000ms' // All changes happen over 1000 milliseconds

...

// Making a change some time in the future triggers an animation
el.style.width = '400px' // Change from 100px to 400px happens over 1000ms

... 

el.style.backgroundColor = '#f0f' // Colors can be animated! 
```

## After Class

- Start Data [Visualization 2](Assignments/Visualization-2.md)
- Follow the [buttons and interaction tutorial](https://github.com/MakeSchool-Tutorials/FEW-2-5-Data-Visualization-Buttons-and-Interaction)

## Additional Resources

1. [Buttons and Interaction Tutorial](https://github.com/MakeSchool-Tutorials/FEW-2-5-Data-Visualization-Buttons-and-Interaction)
