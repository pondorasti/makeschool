
// Create a template
const template = document.createElement('template')
// Set the content of the template
template.innerHTML = `
  <style>
    .container {
      border: 3px solid;
      overflow: hidden;
    }
    .inner {
      display: flex;
      transition: 400ms;
    }
  </style>
  <div class="container">
    <div class="inner"></div>
  </div>
`
  
// Creates a simple slideshow

class SimpleSlides extends HTMLElement {
  constructor() {
    super() 

    // Get the size of the element
    this._width = this.getAttribute('width')
    this._height = this.getAttribute('height')
    this._time = this.getAttribute('time')
    this._transition = this.getAttribute('transition')


    // Create a shadow root node
    const tempNode = template.content.cloneNode(true)
		this._shadowRoot = this.attachShadow({ mode: 'open' });
		this._shadowRoot.appendChild(tempNode)





    // Create a couple elements to manage slides
    this._container = this._shadowRoot.querySelector('.container')
    // Add some styles
    this._container.style.width = this._width + 'px'
    this._container.style.height = this._height + 'px'

    this._inner = this._shadowRoot.querySelector('.inner')

    // Get array of images
    this._imgs = Array.from(this.querySelectorAll('img'))
    // Append each img to the container
    for (let i = 0; i < this._imgs.length; i += 1) {
      this._inner.appendChild(this._imgs[i])
    }
    
    // Keep track of the index of the current image displayed
    this._index = -1
    this._paused = false

  }

  _addTimer() {
    this._removeTimer(this._timer)
    this._timer = setInterval(() => {
      this._nextImg()
    }, this._time)
  }

  _removeTimer() {
    clearInterval(this._timer)
  }

  connectedCallback() {
    this._addTimer()
    this._nextImg()
  }

  disconnectedCallback() {
    this._removeTimer()
  }

  static get observedAttributes() {
    return ['time', 'paused', 'transition']
  }

  attributeChangedCallback(name, oldValue, newValue) {
    console.log(name, oldValue, newValue)
    switch(name) {
      case 'time':
        this._time = newValue
        this._removeTimer()
        this._addTimer()
        break
    
      case 'transition':
        this._transition = newValue
        this._inner.style.transition = `${this._transition}ms`
        break 

      case 'paused': 
        this._paused = newValue
        break

    }
  }

  _nextImg() {
    this._index = (this._index + 1) % this._imgs.length
    const x = this._index * -this._width
    this._inner.style.transform = `translate(${x}px, 0)`
  }
}

customElements.define('simple-slides', SimpleSlides)



// Web Component - Shadow DOM has Shadows

// Custom Element - No Shadows Shadow Free
