class Blink extends HTMLElement {
  constructor() {
    super()

    this._shadow = this.attachShadow({ mode: 'open' })
    this.render()
  }

  static get observableAttibutes() {
    return ['title', 'time']
  }

  connectedCallback() {
    console.log('blink connected')
    const time = this.getAttribute('time')
    console.log(time)
    const ms = time ? time * 1000 : 1000
    this._title = this.getAttribute('title')
    this._show = true
    this._timer = setInterval(() => {
      this.blink()
    }, ms)
    this.render()
  }

  disconnectedCallback() {
    // Remove that interval
    clearInterval(this._timer)
  }

  blink() {
    // console.log('blink!')
    this._show = !this._show
    this.style.color = this._show ? '#000' : 'transparent'
  }

  attributeChangedCallback(name, oldValue, newValue) {
    console.log(name, oldValue, newValue)
    if (name === 'title') {
      this._title = newValue
    } 
    this.render()
  }

  render() {
    console.log('render blink', this._title, '8', )
    this._shadow.innerHTML = `${this._title}`
  }
}

customElements.define('frmwrk-blink', Blink)