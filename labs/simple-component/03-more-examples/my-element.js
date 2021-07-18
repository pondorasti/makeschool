class MyElement extends HTMLElement {
    constructor() {
        super(); // Must call super!
        // instance is initialized
        console.log('constructed!');
    }

    connectedCallback() {
      // Element was added to the DOM
      console.log('connected! element ewas added to the DOM');
    }

    disconnectedCallback() {
      // Removed from the DOM
      console.log('disconnected! removed from the DOM');
    }

    attributeChangedCallback(name, oldVal, newVal) {
      // Attribute of element was changed
      console.log(`Attribute: ${name} changed!`);
    }

    // Observe attributes 
    static get observedAttributes() {
      return ['my-attr, title']; // Name the attributes observed
    }

    adoptedCallback() {
      // Run when the element is moved to a new document
      console.log('adopted!');
    }
}

// Register this element
// custom elements must use a hyphen in the name!
window.customElements.define('my-element', MyElement);