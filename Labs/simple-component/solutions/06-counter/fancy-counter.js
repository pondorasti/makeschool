
class FancyCounter extends HTMLElement {
  constructor() {
    super();
    
    this._shadowRoot = this.attachShadow({ mode: 'open' });

    // Make a new p element
    this._container = document.createElement('div')
		this._shadowRoot.appendChild(this._container)
		
		this._display = document.createElement('div')
		this._leftButton = document.createElement('div')
		this._rightButton = document.createElement('div')

		this._container.appendChild(this._leftButton)
		this._container.appendChild(this._display)
		this._container.appendChild(this._rightButton)

		this._leftArrow = document.createElement('div')
		this._rightArrow = document.createElement('div')

		this._leftButton.appendChild(this._leftArrow)
		this._rightButton.appendChild(this._rightArrow)


		this._container.style.margin = '3px'

		this._leftButton.style.padding = '1em'
		this._leftButton.style.backgroundColor = '#eee'
		this._leftButton.style.display = 'flex'
		this._leftButton.style.justifyContent = 'center'
		this._leftButton.style.alignItems = 'center'
		this._leftButton.style.borderTopLeftRadius = '0.5em'
		this._leftButton.style.borderBottomLeftRadius = '0.5em'
		this._leftButton.style.borderTop = '3px solid'
		this._leftButton.style.borderLeft = '3px solid'
		this._leftButton.style.borderBottom = '3px solid'

		this._rightButton.style.padding = '1em'
		this._rightButton.style.backgroundColor = '#eee'
		this._rightButton.style.display = 'flex'
		this._rightButton.style.justifyContent = 'center'
		this._rightButton.style.alignItems = 'center'
		this._rightButton.style.borderTopRightRadius = '0.5em'
		this._rightButton.style.borderBottomRightRadius = '0.5em'
		this._rightButton.style.borderTop = '3px solid'
		this._rightButton.style.borderRight = '3px solid'
		this._rightButton.style.borderBottom = '3px solid'

		this._leftArrow.style.width = '8px'
		this._leftArrow.style.height = '8px'
		this._leftArrow.style.borderTop = '3px solid'
		this._leftArrow.style.borderRight = '3px solid'
		this._leftArrow.style.transform = 'rotate(-135deg)'

		this._rightArrow.style.width = '8px'
		this._rightArrow.style.height = '8px'
		this._rightArrow.style.borderTop = '3px solid'
		this._rightArrow.style.borderRight = '3px solid'
		this._rightArrow.style.transform = 'rotate(45deg)'

		this._display.style.padding = '1em'
		this._display.style.borderTop = '3px solid'
		this._display.style.borderBottom = '3px solid'

		this._value = 0
		this._step = 1
		this._max = 10
		this._min = 0

		this._update()

		this._container.style.display = 'flex'

		this._increment = this._increment.bind(this)
		this._decrement = this._decrement.bind(this)


	}
	
	_increment(e) {
		const newValue = this._value + this._step
		if (newValue <= this._max) {
			this._value = newValue
		}
		this._update()
	}

	_decrement(e) {
		const newValue = this._value - this._step
		if (newValue >= this._min) {
			this._value = newValue
		}
		this._update()
	}

	_update() {
		this._display.innerHTML = this._value
		this.dispatchEvent(new Event('change'))
	}


  // Tell this component it should look for changes to time
  static get observedAttributes() {
    return ['value', 'min', 'max', 'step'];
  }  


  // Handle changes to time
  attributeChangedCallback(name, oldValue, newValue) {
    if (name === 'value') {
			this._value = parseInt(newValue)
			this._update()
    } else if (name === 'min') {
			this._min = parseInt(newValue)
		} else if (name === 'max') {
			this._max = parseInt(newValue)
		} else if (name === 'step') {
			this._step = newValue
		}
  }

  connectedCallback() {
    this._rightButton.addEventListener('click', this._increment)
		this._leftButton.addEventListener('click', this._decrement)
  }

  disconnectedCallback() {
    this._rightButton.removeEventListener('click', this._increment)
		this._leftButton.addEventListener('click', this._decrement)
  }
}

customElements.define('fancy-counter', FancyCounter);


/*

- Challenge - 1 - 

You need to include this component in your framework. 
It needs to have a style that matches the styles of your 
framework. 

Modify the styles in code here to styles that would fit your framework. 

*/
