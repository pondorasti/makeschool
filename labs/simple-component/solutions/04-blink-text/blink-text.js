
class BlinkText extends HTMLElement {

  constructor() {
    super(); // Must call super!
    
    this._shadowRoot = this.attachShadow({ mode: 'open' });

    // Make a new p element
    this._blinkEl = document.createElement('span')
    this._shadowRoot.appendChild(this._blinkEl)

    // Get the text in the original tag and put it in the P element
    this._blinkEl.innerHTML = this.innerHTML

    this._opacity = 1
  }



  // Lifecycle method called when this component is appended to the DOM
  connectedCallback() {
    this._blinkEl.style.transition = '400ms'
    this._timer = setInterval(() => {
      this._opacity = this._opacity === 1 ? 0 : 1
      this._blinkEl.style.opacity = this._opacity
    }, 1000)
  }

  // Lifecycle method called when the component is removed from the DOM
  disconnectedCallback() {
    clearInterval(this._timer)
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