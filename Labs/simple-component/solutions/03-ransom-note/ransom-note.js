
// Make a new Component
class RansomNote extends HTMLElement {
  constructor() {
    super(); 
    this._shadowRoot = this.attachShadow({ mode: 'open' });
    
    // Get the content of the element defined in the HTML document.
    this._text = this.innerHTML
    // Split the string into an array of characters
    this._charactersArray = this._text.split('')
    // Make an array to hold some el (there will be one for each character)
    this._elArray = [] 
    // Loop over each character in the array
    for (let i = 0; i < this._charactersArray.length; i += 1) {
      const el = document.createElement('div')
      el.style.display = 'inline-block'
      el.innerHTML = this._charactersArray[i]
      el.style.fontSize = (Math.random() * 30 + 20) + 'px'
      el.style.padding = (Math.random() * 5 + 3) + 'px'
      el.style.transform =`rotate(${Math.random() * 24 - 12}deg)`
      el.style.fontWeight = Math.random() * 6 * 100
      el.style.borderWidth = Math.random() * 5
      
      const borderStyles = ['none', 'solid', 'double', 'dotted', 'dashed', 'groove', 'ridge', 'inset', 'outset']
      el.style.borderStyle = borderStyles[Math.floor(Math.random() * borderStyles.length)]
      
      if (Math.random() > 0.5) {
        el.style.color = '#fff'
        el.style.backgroundColor = '#000'
      }

      const fontFamilies = ['Arial', 'Helvetica', 'sans-serif', 'Times New Roman', 'Times', 'serif', 'Courier']
      el.style.fontFamily = fontFamilies[Math.floor(Math.random() * fontFamilies.length)]
      this._shadowRoot.appendChild(el)
    }
  }
}

customElements.define('ransom-note', RansomNote);

/*

- Challenge - 1 - 

We need a tag that generates text text that looks like a ransom note. 
Each character needs a different style. The more random and different 
you can make each of the characters the better. 

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

*/

