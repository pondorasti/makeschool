
// Make a new Component
class RansomNote extends HTMLElement {
  constructor() {
    super(); 
    this._shadowRoot = this.attachShadow({ mode: 'open' });
    
    // Get the text of the host element this.innerHTML

    // Split the string into an array of words text.split(' ')

    // Loop over each word in the array

      // Make a span 

      // Set the innerHTML of the span to the current word 

      // Set a random style for example: 
      // span.style.fontSize = `${Math.random() * 20 + 12}px`
      // Should set a fontSize between 12px and 32px

      // Repeat the process above for as many styles as you can. For example: 
      // span.style.transform = `rotate(${Math.random() * 40 - 20}deg)`
      // WOuld generate a a rotation of -20deg to +20deg

      // Append the word to the shadowroot
  }
}

customElements.define('ransom-note', RansomNote);

/* 

- Challenge - 1 - 

We need a tag that generates text text that looks like a ransom note. 
Each character needs a different style. The more random and different 
you can make each of the characters the better!

Take a look at the Sample HTML code: 

<p>
  <span style="font-size: 22px;">A</span>
  <span style="font-size: 16px;">B</span>
  <span style="font-size: 24px;">C</span>
  <span style="font-size: 33px;">D</span>
  <span style="font-size: 18px;">E</span>
</p>

Your goal is to generate something similar inside the shadowroot. 
Follow these steps. 

To solve this you'll need to loop over each character of a string. 
There are several ways to accomplish this. An easy method would be 
to create an array of characters using string.split('') 

- Get the text content of the original element. 
- For each character in the string make a span.
- Put one character from the source string into each span.
- Set the fontSize of each span to a random font size. 

Generate random numbers with: 

Math.random() * range

for example: 

// generates a random number from 0.0 to 6.0 e.g. 3.458294
Math.random() * 6 

If you need an integer use Math.floor() or Math.round()

// generates a random number from 0 to 5 e.g. 4
Math.floor(Math.random() * 6) 

If you have values that are not numbers make an array get a random it from the array

const array = ['Helvetica', 'Times', 'Courier']
array[Math.floor(Math.random() * array.length)]

- Challenge - 2 - 

Try setting a wider range of properties. 

- color
- font-size
- transform: rotate(randomValue)
- font-family
- font-weight

*/

