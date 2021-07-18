// The code here defines a "hello world" example
// of web components. 
// The component defines a new tag that displays 
// the words "Hello World"

// Define a class that extends HTMLElement
// You can also extend specific tags 
// Like: HTMLParagraphElement
// Some elements can't have a shadow root attached to them 
// for security reasons.

// The code below defines a simple web component. 
// This hello world illustrates the basic features of web components 

// Make a new Component
class HelloWorld extends HTMLElement {
  constructor() {
    super(); // MUST call super!
    // Attach a shadow root to the element.
    this._shadowRoot = this.attachShadow({ mode: 'open' });
    // open: Elements of the shadow root are accessible from JavaScript outside the root
    // closed: Denies access to the node(s) of a closed shadow root from JavaScript outside it
    
    // Make a new element to hold hello world
    this._el = document.createElement('span')
    // Set the content of the new element
    this._el.innerHTML = 'Hello World'
    // Set styles on the new element
    this._el.style.color = 'red'

    // Add this element to the shadow root
    this._shadowRoot.appendChild(this._el)
  }
}

// Register this new tag
customElements.define('hello-world', HelloWorld);
// ---------


/*  

- Challenges - 1 - 

The code above creates child element that is a span at line 21. 
You might want to create any element. Change this to a h1.

- Challenge - 2 - 
 
Above the code applies styles to the element via JS. You can use 
all CSS styles by converting them to camelCase. For example: 

background-color -> backgroundColor
font-size -> fontSize

Use three different styles to style the element. Try these or 
use your own ideas: 

- fontSize
- color
- letterSpacing

*/

