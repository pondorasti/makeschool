
class FancyCounter extends HTMLElement {
  constructor() {
    super();
		
		// Create a shadow node
    this._shadowRoot = this.attachShadow({ mode: 'open' });

    // Create a container element
		
		// Append the container to the shadow root
		
		// Create three elements left button display and right button

		// Append all three elements to the container

		// Style the container use display: flex

		// Style the left and right element. These should look like a buttons

		// Style the dipslay element. We need a big number

		// Define some properties to track the value displayed in the component

		// Display the value in the display element
	
		// Add an event to the left button. The left button should add 1 to 
		// the value and update the value displayed 

		// Add an event to the right button that subtracts 1 from the value
		// then update the value displayed. 

	}
	
	// Use this increase the value 
	_increment(e) {
		
	}

	// Use this to decrement your value
	_decrement(e) {
		
	}

	// Use this to update the value displayed
	_update() {
		
	}


  // Tell this component it should look for changes to time
  static get observedAttributes() {
    return [];
  }  


  // Handle changes to time
  attributeChangedCallback(name, oldValue, newValue) {
    
  }

	
  connectedCallback() {
    
  }

  disconnectedCallback() {
    
  }
}

customElements.define('fancy-counter', FancyCounter);


/*

Your goal is to create a counter component. The counter should display a value
and two buttons that increment and decrement the value. It might look like this: 

< 0 >

- Challenge - 1 - 

Read through the code snippet above. Follow the comments and build the counter component. 

- Challenge - 2 - 

Use some nested elements to create arrows inside the left and right buttons. 

- Challenge - 3 - 

The counter would be even better if you could configure the min and max range and the 
step value. To do this you'll need to define some attributes. 

Add min, max, value, and step to the list of observedAttibutes. 

Look for changes in these attributes with the attributeChangedCallback() Inside this method 
add an if else of switch statement. You'll need to look at the name to determine the value 
of to be set. 

if (name === 'vlaue') {
	// set the value to newValue
	// update the displayed value
} else if (name === 'min') {
	// set the min value
	// ...
} else if () {
	// etc. 
}

*/
