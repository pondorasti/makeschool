/** 
 * 
 * This component arranges a set of images in a row and 
 * slides them left to right 
 * 
 * */

(function() {
  // Define a template - This holds basic markup for the slides
  // and styles for the shadow root elements 
  const template = document.createElement('template')
  template.innerHTML = `
    <style>
      :host #container {
        position: relative; 
        border: 4px solid #000; 
        display: inline-block;
        overflow: hidden;
      }

      #inner-container {
        position: absolute;
        left: 0; 
        top: 0;
        transition: 400ms;
        display: flex;
        justify-content: flex-start;
        align-items: center;
      }

    </style>
    <div id="container">
      <div id="inner-container"></div>
    </div>
  `
  // --- 

  // This class will contain the code that backs the new element
  // The should extend HTMLElement
  class SimpleSlides extends HTMLElement {

    // --------

    constructor() {
      super() // You must call super!

      // Create a shadow root node
      this._shadowRoot = this.attachShadow({ mode: 'open' })
      // Append a clone of the template to the shadow root
      this._shadowRoot.appendChild(template.content.cloneNode(true))
      
      // Gte a reference to the two elements in the template
      this._innerContainer = this._shadowRoot.querySelector('#inner-container')
      this._container = this._shadowRoot.querySelector('#container')
      
      // Set the width and height by getting styles applied to the parent
      this._container.style.width = this.style.width;
      this._container.style.height = this.style.height;

      // Keep track of the index of the current image displayed
      this._index = 0
      this._time = Number(this.getAttribute('time')) || 3000
      this._vertical = this.getAttribute('vertical')
      this._paused = false // TODO: use this to pause the slides

      // Need to setup the images 
      this._setupImgs()
      this._arrangeImgs()
    }

    // Helper method - sets up the images in the slides
    _setupImgs() {
      // Loop through all of the images, clone, and append to the 
      // inner container in the shadow root
      this._imgs.forEach((img) => {
        this._innerContainer.appendChild(img.cloneNode())
      })
    }

    _arrangeImgs() {
      if (this._vertical === null) {
        this._innerContainer.style.flexDirection = 'column'
      } else {
        this._innerContainer.style.flexDirection = 'row'
      }
    }

    // ---------
    // Lifecycle method - Called when the element is added to the DOM

    connectedCallback() {
      // Start the timer
      this._timer = setInterval(() => {
        this._nextImg()
      }, this._time)
    }

    // Lifecycle method - Called when the element is removed from the DOM
    disconnectedCallback() {
      // Clear the timer
      clearInterval(this._timer)
    }

    // ------------
    // Handle Attribues

    static get observableAttibutes() {
      return ['time', 'paused', 'vertical']
    }

    attributeChangedCallback(name, oldValue, newValue) {
      switch(name) {
        case 'time': 
          this.time = newValue
          // TODO: update timer
          break
        case 'paused': 
          this.paused = newValue
          break
        case 'vertical':
          this._vertical = newValue
          this._arrangeImgs()
          break
      }
    }

    // -----------------
    // Getters and Setters 

    get time() {
      return this._time
    }

    set time(val) {
      this.setAttribute(time, val)
      this._time = val
    }

    get paused() {
      return this._paused
    }

    set paused(val) {
      this.setAttribute(val)
      this._paused = val
    }

    get vertical() {
      return this._vertical
    }

    set vertical(val) {
      this._vertical = val
      this.setAttribute('vertical', val)
      this._arrangeImgs()
    }

    // ---------

    // getter - returns the array of methods. 
    // TODO: Better to get the src strings from all of the images 
    // and put these in an array
    // TODO: Need to handle the situation where a new img could be 
    // added to the DOM. There is probably a Component updated 
    // callback or other observer...

    get _imgs() {
      // querySelectorAll() returns an Array Like convert it to a 
      // standard Array with Array.from(arrayLikeObject)
      return Array.from(this.querySelectorAll('img'))
    }

    // Helper method - advances the index then shows the new image.
    // We advancd to the next image by setting the left of the inner container. 
    // This slides the inner container to the left. I used calc to figure this value. 
    // With transition set in the template styles changing the value for left 
    // will animate that property. 

    _nextImg() {
      // Advance to the nexct index
      this._index = (this._index + 1) % this._imgs.length
      // get the width of the container
      const w = this.style.width
      const h = this.style.height
      // Slide _index * -w (note the -)
      if (this._vertical === null) {
        this._innerContainer.style.top = `calc(${h} * -${this._index})`
        this._innerContainer.style.left = 0
      } else {
        this._innerContainer.style.left = `calc(${w} * -${this._index})`
        this._innerContainer.style.top = 0
      }
    }
  }

  // ---
  // Define the element 
  customElements.define('simple-slides-2', SimpleSlides)
})()