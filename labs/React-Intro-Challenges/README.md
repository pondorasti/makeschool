# React-Intro-Challenges

React Intro challenges starter project. 

- Fork this repo, edit the `index.html` to solve the challenge problems. 
- Push changes to your repo. 
- Check off the challenges you have completed [here](https://docs.google.com/a/makegameswith.us/spreadsheets/d/1Ndb_QlywnaIZQ7ML7JrpCQYUlGq-8GNfwJWh9DiU2zk/edit?usp=sharing)
- Pair with another student if you get stuck. 
- Code review with instructor when you have completed all challenges. 

## Challenges

Open the [example](./index.html) in a browser and a text editor. 
Read the source code and compare it to the notes here. Then work your way 
through the challenges. 

- [Example React Components Intro](./index.html)

## The Sample Code

The sample code contains two Components: Title and Clock. These are used in the example to create 
a simple clock. 

- Title - A simple component that displays a text string in an H1.
- List - A simple component that generates a list from an array of items. 
- Clock - A smart component that owns and updates a timer, and displays the time in a Title. 

Near the end of the page there is a call to ReactDOM.render(). ReactDOM keeps track of your 
components in a virtual DOM and renders this to the page.

## Challenges 

To start the challenges copy the file `index.html` in this folder. Solve the challenges by 
adding your code solutions to this file. This file has all of the boilerplate React 
code set up. You can open this file in any browser to test your solutions. 

**Try these challenges.**

1. Make a component that displays a title and a subtitle.
  - Pass the title string and subtitle string into the component as props.
  - Use this new component to display:
    - title: "React Timer"
    - subtitle: "Counts in seconds"
    - Bonus: How many components did you make? Title and Subtitle can each be a component. 
    With Heading being a component that contains both Title and Subtitle.
    - Bonus: add some CSS to style the title and subtitle in the new component.
      - Hint: Assign class names to JSX with `className="my-class"` instead of `class="my-class"`
      
2. Make a list of users. Define an array of objects with a name, team, and id. Pass this into your component 
  via props. Transform the array into an array of JSX with `Array.map()`. Look at the existing `List` 
  example. 
  - Bonus: Define a simple component for each list item. Give it at least two properties to display. 
  Reuse your title and subtitle component here. 
  - Bonus: Make a list of timers each with a start/stop button. 
  - Bonus: Make a button that adds a new item to the list. To make this work the list should be 
  a stateful component, and the array of data displayed by the list should be part of state for that 
  component. You will need to call `setState()` with a **new** array!
  
3. Make a counter component. It should have an up and down button, and a display to show the count. Clicking 
  the up button adds 1 to the count, clicking the down button subtracts 1 from the count. 
  - Bonus: You reused one or more of your other components.
      
4. Make a timer that counts down from 10 to 0.
  - Start by making a new **stateful** component. You can use the existing Clock component 
  as a starting point. This component displays the time by updating the time 
  every second. Notice `setInterval()` in the constructor calls the `tick()` method.
  The Clock component defines a state object with a property: `date` which holds the date/time. 
  When `state` change the component will call render and redraw. Your Timer component will need to
  define a `count` on state, decrement the count on each tick. 

5. The solution to the last challenge should leave you with a timer that eventually counts in 
  negative numbers! This is a problem. Add a property to state `isRunning` this should `true`
  when the timer is running and `false` when it has stopped. The timer should stop (`isRunning === false`)
  when the count reaches 0. 
  
6. Make a timer that counts down from any value to 0.
  - You'll want to pass in the starting count as a prop where the component is created. This will be 
  an attribute on the JSX tag.
  Inside the component get this value from props in the constructor.
    - Bonus: Set a default count of 10 in cases where the starting count is undefined.
    
7. Your goal for this challenge is to set the `isRunning` property from outside the component. 
  - Test your work by making to Timers one will run and the other is paused. 
  
8. Make a new component that is a Stopwatch. The Stopwatch is a Timer with a stop/start button. 
  - The Stopwatch should count like the Timer but you should be able to start and stop it by 
  clicking the button.
    - The button should use onClick, something like this: 
  ```
  <button onClick={ () => {
    this.startStop(); // Call a method on your component here
  } }>start</button>
  ```
   - Bonus: The label changes to say start when the Stopwatch is stopped and Stop when the 
    Stopwatch is running. 
    - Bonus: Build this component by composing other components. The Button can be it's own component. 
      - Question: Does the Button component need to be a stateful or simple compoennt? Why?
    
9. Make the timer display red when there are 5secs or less remaining. 
  - Hint: Use `className`. You can probably handle all of this in `render()`.
  
  



