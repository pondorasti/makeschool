/* **********************************************************

  Your scripts here

************************************************************* */

// Here are a few things you can do in the browser...

/* ----------------------------------------------------------
Define variables. Variables defined with const can not be changed! 
These variables are defined in the root of our script and are available
throughout the program.
------------------------------------------------------------- */

// Get a refernce to DOM elements by their id names.
const button_1 = document.getElementById('button-1');
const button_2 = document.getElementById('button-2');
const titleElement = document.getElementById('title');

const num_button = document.getElementById('numulator');
const num_input = document.getElementById('input-num');
const pow_input = document.getElementById('input-pow');
const num_display = document.getElementById('num-display');


/* ----------------------------------------------------------
Define variables used by the program. 
This variable is defined with let. The value can chnage. 
Defined at the root of our script this variable is available 
throughout the program. 
------------------------------------------------------------- */

let numulation = 0;

/* -----------------------------------------------------------
Set properties on an object. Changing the properties of a 
DOM element changes it's appearance or behavior. 
-------------------------------------------------------------- */

// Set the content and style of an element 
titleElement.innerHTML = '- Ready -'; // Replaces the content between the tags of this element.
titleElement.style.color = '#398fc4'; // Applies a CSS style, just like color: #398fc4 in CSS.

/* -----------------------------------------------------------
Handle events. Events are things that happen, like mouse clicks. 
-------------------------------------------------------------- */

// Add an event listener to button_1
button_1.addEventListener('click', function(e) {
  // Set these properties when then button_1 is clicked
  titleElement.style.color = '#22dd11'; 
  titleElement.innerHTML = 'Run!';
});

// Add an event listener to button_2
button_2.addEventListener('click', function(e) {
  titleElement.style.color = '#dd2211';
  titleElement.innerHTML = 'Pause!';
});

num_button.addEventListener('click', function(e) {
  // These variables define within a block are ONLY available inside that block!
  // Get the value from the input elements. 
  const num = num_input.value;
  const pow = pow_input.value;
  // Do Some Maths
  numulation += num * pow;
  // Display the value in an the DOM
  num_display.innerHTML = numulation;
});


/* ==========================================================



============================================================= */ 






