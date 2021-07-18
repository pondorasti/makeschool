
class BlinkText extends HTMLElement {
  constructor() {
    super();
    
    this._shadowRoot = this.attachShadow({ mode: 'open' });

    // Make a new p element
    this._blinkEl = document.createElement('span')
    this._shadowRoot.appendChild(this._blinkEl)

    // Get the text in the original tag and put it in the P element
    this._blinkEl.innerHTML = this.innerHTML

    // Make a variable to track the state of the blink element

    // Add any styles needed to the blink element

  }

  // Lifecycle method called when this component is appended to the DOM
  connectedCallback() {
    // Start the timer here 

  }

  // Lifecycle method called when the component is removed from the DOM
  disconnectedCallback() {
    // remove your timer here

  }
}

customElements.define('blink-text', BlinkText);


/*

- Challenge - 1 - 

The text on the blink-text tag should appear and disappear. 
Do this by changing the opacity from 0 to 1 over time. 
Use setInterval() to alternate the opacity from 0 to 1. 

this._timer = setInterval(() => {
  ...
}, 1000)

Inside the call back you'll need to toggle the opacity of 
this._blinkEl. 

Components have lifecycle are used to initialize and deinitialize 
your components. You challenge here is add an interval when 
the component is connected use: connectedCallback(). 
Then remove the interval when the component is removed from the 
DOM use: disconnectedCallback(). 

Remove your interval with: 

clearInterval(this._timer)

- Challenge - 2 -

Make the text fade in and out by adding a transition. 

*/