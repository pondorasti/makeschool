
// Start with an anonymous function

(function() {
  // Make a new Component
  // Choose an element to extend, usually HTMLElement
  class webComponentBase extends HTMLElement {
    constructor() {
      super(); // MUST call super!
      // Attach a shadow root to the element.
      this._shadowRoot = this.attachShadow({ mode: 'open' });
    }

    // Defines the attributes accessible to JS
    static get observedAttributes() {
      return [] // List an array of attribute names
    }

    // Handle changes to an attribute
    attributeChangedCallback(attributeName, oldValue, newValue) {
      if (attributeName === '???') {
        // handle changes to an attribute

      }
    }

    // Lifecycle method called when this component is appeded to the DOM
    connectedCallback() {
      // Do things when component is added to the DOM
    }
  }

  customElements.define('hello-world', webComponentBase);
  // ---------


})()