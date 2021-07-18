
// Wrap this in an IIFE to avoid namespace collisions
(function() {
  // ------------------------------------------------
  // Define a template to use in the new Component 
  // This template includes both the HTML and CSS

  const template = document.createElement('template')
  template.innerHTML = `
    <style>
      :host {
        display: block;
        color: red;
      }
    </style>
    
    <div>
      <slot name="name">name</slot>
      <slot name="year">year</slot>
      <slot name="content">content</slot>
    </div>
  `
  
  // ------------------------------------------------
  // Define a Class that extends HTMLElement

  class Copyright extends HTMLElement {
    constructor() {
      super() 
      this._title = ''
      this._shadow = this.attachShadow({ mode: 'open' })

      // Get some references to slots
      
    }
  
    static get observedAttributes() {
      return ['title', 'year']
    }
  
    attributeChangedCallback(name, oldValue, newValue) {
      if (name === 'title') {
        this._title = newValue
        this.render()
      }
    }
  
    connectedCallback() {
      this.render()
    }
  
    render() {
      const { title, textContent } = this
      const year = this.getAttribute('year') 
        ? this.getAttribute('year') 
        : new Date().getFullYear() 
      // this._shadow.innerHTML = `<p>${textContent} ${title} &copy; ${year}</p>`
      // Use the template content here
      this._shadow.appendChild(template.content.cloneNode(true))
    }
  }
  
  customElements.define('frmwrk-copy-2', Copyright);
})()



