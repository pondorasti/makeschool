<!-- .slide: data-background="./Images/header.svg" data-background-repeat="none" data-background-size="40% 40%" data-background-position="center 10%" class="header" -->
# FEW 1.1 - Lesson 8 - JS Tip Calculator Part 2

<!-- Put a link to the slides so that students can find them -->

➡️ [**Slides**](/Syllabus-Template/Slides/Lesson1.html ':ignore')

<!-- > -->

## Learning Objectives

- Creating design layout with flex box
- Using `parseInt()`, `parseFloat()`, and `isNaN()`
- Describe NaN

<!-- > -->

## Why learn this? 

JavaScript is important events are an important part of programming front ent applications. 

<!-- > -->

## Solving problesm and the tip calculator

The tip calculator presents some programming problems. Think of this as a interview question. 

<!-- > -->

Assumptions: name and list the assumptions? 

<!-- > -->

1. bill: float/number
1. tip: float/int/number
1. people: int/number

<!-- > -->

## Numbers, Strings, and NaN

Any value from an `<input>` will be a string even if the value is a number, even if the type  of the input is number.

Use `parseInt(value)` or `parseFloat(value)` to convert a value to a number. 

If the value can not be converted to a number these functions return `NaN`. This a special type that represents something that is "Not a Number". 

```JS 
const bill = parsFloat(inputBill.value)
const people = parseInt(inputPeople.value)
```

To test if a value is `NaN` use `isNaN(value)`.

```JS
const badNumber
isNaN('123') // true - Not a number!
isNaN(123)   // false - a Number!
```

<!-- > -->

Let's put that all together into something useful: 

```HTML
<input id="input-bill">
```

```JS 
const inputBill = document.getElementById('input-bill')

let bill = 0

inputBill.addEventListener('input', handleBill)

function handleBill(e) {
  const newBill = parseFloat(e.target.value)

  if (!isNaN(newBill)) {
    bill = newBill
  } else {
    e.target.value = bill
  }
}
```

<!-- > -->

### Scope 

It's important to understand that these variables have different scope. To be the best developer you can be you should always ask the question yourself what the scope is for any variable you happen to be looking at. 

Read this article and 

- https://javascript.info/closure

The sample code above uses the following variables: 

- inputBill
- bill 
- newBill

- Question: What is the scope of each variable in the list above? Discuss this with your group.

### Calculating the total and tip

```JS
function calculateTip() {
  const tip = bill * tipPercent / 100
  const total = bill + tip
  const perPerson = total / people

  displayTip.innerHTML = tip.toFixed(2)
  displayTotal.innerHTML = total.toFixed(2)
  displayEach.innerHTML = perPerson.toFixed(2)
}
```

- Question: what is happening here? discuss this with your group? 
  - What variables are used and what is their scope? 

<!-- > -->

### Event Object

What is `e`? This is an object that describes the event. Handler functions always receive an event objects. 

Event Objects have many properties that are useful. 

<!-- > -->

### event.target

`event.target` is the object where the event originated. In this example it's `<input>`.

Why is the target useful? Allows for DRY code. 

<!-- > -->

## Styling the Tip Calculator

Flex box is probably the best choice for making the tip calculator. 

Using nested flex parent's allows different levels to be aligned in columns and rows creating a complex layout. 

**Remember: when an element has `display: flex` it's children are arranged using the flex rules.**

Take a look at this image: 

Here is the starting tip calculator.

![Tip Calc 1](images/tip-calc-1.png)

Here is a wireframe of the tip calculator. Think of each box in the wire frame as one element in the DOM. 

![Tip Calc 2](images/tip-calc-2.png)

There is an outer container. `main.main`

![Tip Calc 3](images/tip-calc-3.png)

Use two innner elements to group the left and right side of the tip calculator. The blue line shows the main axis of of the flex container. Here flex direction is row. `div.left-side` and `div.output-container`

![Tip Calc 4](images/tip-calc-4.png)

The right side section has two children. This right side container can be display flex and have a direction of column. `div.display` `div.display > span`

![Tip Calc 5](images/tip-calc-5.png)

Inside these two child sections their parent can be display flex with a direction of row and space between. (The code below has three elements here). 

![Tip Calc 6](images/tip-calc-6.png)

In the left side the container here can be display flex with a direction of column. This arranges the labels and the inputs. `div.right-side`

![Tip Calc 7](images/tip-calc-7.png)

Each input can be grouped in a parent with it's two button elements. The parent can be flex with direction row. `div.input-container` 

![Tip Calc 8](images/tip-calc-8.png)

In markup it might look like this: 

```HTML
<main class="main">
  <div class="output left-side">
    <div class="display">Tip:<span id="display-tip"></span></div>
    <div class="display">Total:<span id="display-total"></span></div>
    <div class="display"">Each:<span id="display-each"></span></div>
  </div>

  <div class="input right-side">
    <div class="input-container">
      <span class="label">Bill Amount</span>
      <div class="input-with-buttons">
        <button>-</button>
        <input 
          id="input-bill" 
          value="10"
          type="number">
        <button>+</button>
    </div>

    <div class="input-container">
      <span class="label">Tip %</span>
      <div class="input-with-buttons">
        <button>-</button>
        <input 
          id="input-tip" 
          type="number" 
          name="tip-percent" 
          value="15">
        <button>+</button>
      </div>
    </div>

    <div class="input-container">
      <span class="label">Number of People</span>
      <div class="input-with-buttons">
        <button>-</button>
        <input 
          id="input-people" 
          type="number" 
          value="1">
        <button>+</button>
      </div>
    </div>
  </div>
</main>
```

<!-- > --> 

## Minute-by-Minute [OPTIONAL]

| **Elapsed** | **Time**  | **Activity**              |
| ----------- | --------- | ------------------------- |
| 0:00        | 0:05      | Objectives                |
| 0:05        | 0:15      | Overview                  |
| 0:20        | 0:30      | In Class Activity I       |
| 0:50        | 0:10      | BREAK                     |
| 1:00        | 0:45      | In Class Activity II      |
| 1:45        | 0:05      | Wrap up review objectives |
| TOTAL       | 1:50      | -                         |


<!-- > -->

## Why you should know this or industry application (optional) (5 min)

Explain why students should care to learn the material presented in this class.

<!-- > -->

## Learning Objectives (5 min)

1. Identify and describe
1. Define
1. Design
1. Implement

<!-- > -->

## Initial Exercise (15 min)

- Funny comic
- Prime the Pump (e.g. think and jot, think pair share, etc)
- Productivity Tip/Tool
- Review of current event (e.g. tech news relevant to your track/topic)
- Quiz on homework or topic(s) of past class
- Concept Test

<!-- > -->

# Topic 1

<!-- v -->

## Overview/TT I (20 min)

- Why learn this?
- Industry examples of usage
- Best practices
- Personal anecdote

<aside class="notes">
Place more detailed information or speaker notes in "aside" elements - it will appear in GitHub Pages but not in the slides.
</aside>

<!-- v -->

## In Class Activity I (30 min)

- I do, We do, You do
- Reading & Discussion Questions in small groups
- Draw a picture/diagram
- Complete Challenges solo or in pair
- Q&A about tutorials
- Pair up and code review
- Pair program
- Formative assessment
- Form into groups
- etc (get creative :D)

<!-- > -->

<!-- .slide: data-background="#087CB8" -->
## [**10m**] BREAK

<!-- > -->

# Topic 2

<!-- v -->

## Overview/TT II (optional) (20 min)

<!-- v -->

## In Class Activity II (optional) (30 min)

<!-- > -->

## Wrap Up (5 min)

- Continue working on your current tutorial
- Complete reading
- Complete challenges

<!-- > -->

## Additional Resources

1. Links to additional readings and videos
