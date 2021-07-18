
(function() {
  const template = document.createElement('template')
  template.content = `
  style {
    :host {
      font-family: Helvetica;
      color: cornflower;
    }
  }
  <div>
    <h1><slot name="title"></span></h1>
    <p><slot name="subtitle"></span></p>
  </div>
  `
  class HelloCard extends HTMLElement {
    constructor() {
      super();
      this._shadowRoot = this.attachShadow({ mode: 'open' });

      this._shadowRoot.innerHTML = `
        <div id="header">
          <span slot="headerLine"> Rootbeer Float </span>
        </div>
        <div id="body">
          <span slot="subtitle">Are the best</span>
        </div>`;
    }

    connectedCallback() {
      customElements.whenDefined('hello-card').then(_ => {
        const titleContent = this._getTitle()
        const subtitleContent = this._getSubtitle()
        
      })
    }

    _getTitle() {
      return this.querySelector('h2')
    }

    _getSubtitle() {
      return this.querySelector('p')
    }
  }
  
  customElements.define('hello-card', HelloCard)
})()
