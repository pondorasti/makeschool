class Copyright extends HTMLElement {
  constructor() {
    super() 
    this._title = ''
    this._shadow = this.attachShadow({ mode: 'open' })
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
    this._shadow.innerHTML = `<p>${textContent} ${title} &copy; ${year}</p>`
  }
}

customElements.define('frmwrk-copy', Copyright);