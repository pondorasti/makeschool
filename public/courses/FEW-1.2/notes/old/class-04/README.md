# FEW 1.2 - Class 4

## Oregon Trail Tutorial

Let's start a new game. This game is a classic text adventure game: [Oregon Trail](https://en.wikipedia.org/wiki/The_Oregon_Trail_(series)). Did you catch the bit about "historical probabilities"? This game has a lot in common with the Heard Immunity project and data science. 

You will use this project to further explore JavaScript. 

You will also use this project to practice your skills as a software developer.

## Objectives 

- Build an understanding of an unfamiliar code base
  - Modifying HTML and CSS 
  - Identify DOM structure 
  - Identify naming conventions
  - Identify and follow convention

## Oregon Trail

I got a tip from the VC guys that text adventure games are making a comeback! Quick drop everything and go get this [starter project](https://github.com/soggybag/oregon-trail-starter)

Download the starter code and open index.html in a browser and play the game. This is a simple text based adventure game. 

The project above was created from the tutorial link below:

https://gamedevacademy.org/js13kgames-tutorial/

## Why work on this project?  

Imagine that you have inherited this code base as part of a new position. In almost every software job you will be tasked with familiarizing yourself with an existing set of code. At a small scale this is very much the type of work you might do at your first job or internship. 

This tutorial was written 2015 it doesn't make use of newer JS features and syntax. Updating an existing codebase is also very much the type of work you might do starting a new job. 

### Discussion

- What is Oregon Trail?
- Download and run the demo project
- Getting familiar with a new code base
	- What code is there? 
	- Where to start when getting to know a new codebase? 

## Challenges 

You have just inherited some code from another developer imagine it's been handed to you as part of a new position. It will be your job to find bugs and fix them, refactor existing code, update code, and implement new features. 

You first job is to understand the codebase. Obviously, you won't understand at a glance. It will take time and work to get to a place where you feel confident. The best way to get into this is to start small and work in areas you understand and then expand. 

- **Challenge 1**: Get familiar with the code base
  1. Download or fork the [starter project](https://github.com/soggybag/oregon-trail-starter)
  2. Play the game a few times. Watch what happens and take a few guesses as to how you think the game function work and what mechanisms are at work. 
  3. Keep your eye out for en errors or console messages just in case. 

- **Challenge 2**: Examine the HTML
  1. Look at index.html and see what you can find. 
    - Look at the links to other files. What files does Oregon Trail depend on? 
    - Look at `class` and `id` names. The Stylesheet and JavaScript are referencing these names to do their work. 
  2. While you're looking at the HTML make a few changes: 
    - Change the title. Think of a new name, you'll be changing the game later to make it more interesting. Think of a new theme and pick a title that fits. 
    - Add a heading within the body tag that displays the new name of the game on the page above the existing game elements.   
    - Add a container div that wraps the content of the page. This will be useful later. 

- **Challenge 3**: 
  1. Examine the stylesheet and look for the class and id names that you saw in inde.html. 
  2. The stylesheet is not so exciting add some new styles:
    - Change the `font-family`, `font-size`, `color`.
    - Modify any of the existing styles to your preference. 
    - The layout is not very good. The boxes that showe game information are spread all over. The layout would work better if there was a central column with a fixed width. Give the container div a `width: 800px` or similar and `margin: auto`. 
    
- **Challenge 4**:
  1. The game has many messages that appear, these tell the story. All of the events are in 'Events.js' in `OregonH.Event.eventTypes`. This _array_ holds objects describing events that can occur. Look at the events closely.
        - Edit events to better fit the story you want to tell. 
        - Add new events. Copy an existing event and paste it into the existing events array then modify it. 
  1. The game displays two special events where the player has to answer a question in a dialog box. These are _Attacks_ and _Shops_. The dialog box could use some work on the style. These boxes are in 'index.html' as `div#shop` and `div#attack`.   
    - `div#attack` has a couple of buttons. You can style these and the text in `div#attack-description`
    - `div#shop` is more complicated. There is a button you can style. The products you can buy are generated dynamically so you can't see them in the source code. To get an idea of what you can work with play the game until the shop appears, then inspect the shop div. Inside `div#prods` you'll see a list of `div.product`. Style this class. It's probably easiest to play with styles in the inspector so you can see how it appears in the browser. 
  4. The layout is very rudimentary. There are 5 boxes these are all inside `div#journey`. They are: 
    - `div#stats-area`
    - `div#update-area`
    - `div#shop`
    - `div#attack`
    - `div#progress-area`
    - `div#shop` and `div#attack` only appear when needed by the game otherwise they are hidden. Use Grid or Flex Box to arrange these elements. Currently, all of these use Float. You'll want to remove float from their style rules. 
  5. `div#stats-area` displays the Caravan stats. Styles would help make this more interesting and easier to read. This element is made of a collection of `div.stat`. Each of these divs contains some text that acts as a label and a `span.stat-value`. Currently, the label and value look the same. Give the label and value different styles. 
  6. If you changed the layout and made it look good on the desktop, add some styles to make it work on mobile. Mobile games are popular! Test it in Chrome and set the inspector to emulate a mobile screen. The layout should probably be a single column on mobile. Use the `@media`. Use this to target CSS styles to a platform. 
  ```CSS
  @media only screen and (max-width: 600px) {
    body {
      background-color: red;
    }
  }
  ```
  Here the `background-color` is only applied when displayed on a screen and the width is 600px or less. Add any rules that you want applied when to mobile in the @media block. As long as this comes after the other rules you can also add rules that override the rules outside this block. 

| -            | Does not meet expectations | Meets expectations       | Exceeds expectations |
|:-------------|:------------------|:-------------------------|:---------------------|
| **Completed**| Did **not complete** | **Completed** challenges 1 to 3 | Completed challenge 4. |
| **Functional**| Is **not functional** | Base tutorial **functional** | **Modified** the existing code to make chnages to the game and game is still functioning with the new features |
| **Understanding** | **Can't explain** the DOM structure | Can explain the DOM structure. **Could modify** the existing structure if needed. | **Can explain** the structure and it's use of class id names. |
| **Work Ethic** | **Did not commit** when working on project | One commit for **each challenge step**. | Commits **clearly document** process |
