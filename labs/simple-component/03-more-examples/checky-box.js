(function() {
  class CheckyBox extends HTMLElement {
    constructor() {
      super(); // MUST call super!
      
      this._shadowRoot = this.attachShadow({ mode: 'open' });
      
      this._container = document.createElement('div')
      this._container.style.display = 'flex'
      this._container.style.alignItems = 'center'
      this._container.style.cursor = 'pointer'
      this._shadowRoot.appendChild(this._container)

      this._box = document.createElement('div')
      this._box.style.width = '20px'
      this._box.style.height = '20px'
      this._box.style.display = 'inline-block'
      this._box.style.backgroundColor = 'red'
      this._container.appendChild(this._box)

      this._check = document.createElement('div')
      this._check.style.width = '10px'
      this._check.style.height = '6px'
      this._check.style.display = 'inline-block'
      this._check.style.borderColor = 'white'
      this._check.style.borderLeftStyle = 'solid'
      this._check.style.borderBottomStyle = 'solid'
      this._check.style.transform = 'translate(4px, 2px) rotate(-45deg)'
      this._box.appendChild(this._check)
      
      this._text = this.innerHTML
      this._label = document.createElement('span')
      this._label.innerHTML = this._text
      this._label.style.marginLeft = '0.5em'
      this._label.style.cursor = 'pointer'
      this._container.appendChild(this._label)

      this._isChecked = true

      this._container.addEventListener('click', (e) => {
        this._isChecked = !this._isChecked
        this._check.style.display = this._isChecked ? 'block' : 'none'
      })
    }

    static get observedAttributes() {
      return [] // List an array of names
    }

    attributeChangedCallback(attributeName, oldValue, newValue) {
      
    }

    connectedCallback() {
      
    }
  }
  
  customElements.define('checky-box', CheckyBox);
  // ---------
})()