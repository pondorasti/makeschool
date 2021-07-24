# FEW 2.2 - Advanced CSS - Web Components part 2

Getting started building your own components. 

## Why you should know this?

Web Components are new and possibly game changing web technology. They sit in the center of frontend development. If you want to be a frontend developer experience with Web Components will be useful. 

## Learning Objectives 

1. Build simple web components
1. Define custom tags that encapsulate functionality
1. Use attributes to configure components
1. Reflect properties and attributes 
1. Use Web Component Lifecycle methods

## Web Components

Web Components allow you to define new tags with encapsulated functionality. The goal of this class is to begin exploring web components by creating your own.

A good start to getting a handle on what Web Components are and how they work is to make a few simple components for yourself!

### Isolating your Code

Since all elements in JS are global it's possible that code from other files might interfere with the code you have written. This problem can be prevented by wrapping your code in an anonymous function. 

```JS
function myCode() {
	// Your code here
	const x = 99
	// Variables defined here are scoped to this function
	function otherFunction() {
		// Other functions can be defined in other other functions
	}
	// ...
}

myCode() // Must call this function!
```

For the code to run you'll have to call that function. You could also call the function more than once, which might cause problems. Solve these issues with a Immediately Invoked Function Expression. 

```JS 
// Start with two sets of parenthesis
()() 

// Put a function in the first 
(function() { 
	// ... Code here ... 
})()
```

### Templates

One of the problems with Web Components is creating elements and styling those elements. The process is rather verbose compared to creating elements in an .html file and writing CSS in a .css file.

Web Components provides a solution: templates. 

You may not need this if the markup in your component is simple. 

Think of a template as some markup you can use in your shadowroot. This can also contain styles in a style tag. 

A template is an HTML element that is not displayed. The template is used as block of code you can duplicate when needed. 

Best practice: define a template in a variable outside of your class inside the IFFE.

```JS 
(function() {
	// Create a template
	const template = document.createElement('template')
	// Set the content of the template
  template.innerHTML = `
    <style>
      /* some styles ... */
    </style>
    <div class="container">
      <!-- some markup ... -->
    </div>
	`
	
  class MyComponent extends HTMLElement {
		constructor() {
			super() 
			// Create a shadow root node
			const tempNode = template.content.cloneNode(true)
			this._shadowRoot = this.attachShadow({ mode: 'open' });
			this._shadowRoot.appendChild(tempNode)
			// Get a reference to an element from your template
			this._container = this._shadowroot.queryselector('.container')
		}
	}

})()
```

What happened here? 

- At the top you defined a template element. This inclduded a style tag and some markup.
- In the constructor of MyComponent you cloned the template, created the shadow root, and appended the cloned node to the shadow root. This created the HTML markup that will be used by this component. 
- The last line shows how to access elements in the shadow root create from a template. It's same methods you have used in the past. 

You can see a live example of templates working with a web component here: 

https://github.com/Make-School-Labs/simple-component/tree/master/simple-components-templates/01-counter-template

### Lifecycle methods 

Use these to setup and take down your components. Lifecycel methods are used to initialize resources, and free up resources when you're done using them. Like the name implies lifecycle methods are triggered over the life of a component.

- `constructor()` - this is called when your component is initialized. 
- `connectedCallback()` - this is called when the component is added to the DOM tree. 
- `disconnectedCallback()` - this is called when the component is removed from the DOM tree. 
- `attributeChangedCallback()` - this is invoked when an attribute on the element is changed. 

Use the constructor to initialize class properties and create the shadow root. 

Use `connectedCallback()` to handle things that should happen when the component is added to the DOM. For example adding a timer. 

Use `disconnectedCallback()` to clean up when a component is removed from the DOM. For example remving a timer. 
```JS 
...
class MyComponent extends HTMLElement {
	...
	connectedCallback() {
		// Create a timer and save a reference 
		this._timer = setInterval(() => {
			this._nextImg()
		}, 3000)
	}

	disconnectedCallback() {
		// Clear your timer
		clearInterval(this._timer)
	}
	...
}
```

### Attributes 

From outside you only have the tag itself to work with. It's not a good solution to edit source code if you need to make changes to a component. In other words you shouldn't expect developers to edit the .js file. 

Developers using your components will use the tag and they can configure the tag with attributes. For example: 

`<my-counter value="5" min="0" max="10" step="1"></my-counter>`

Internally your component can access attribute values with `this.getAttribute(name)`. It's probably best to store these in properties rather than get them with `getAttribute()` each time they are needed. For example: 

```JS 
...
class MyComponent extends HTMLElement {
	constructor() {
		this._value = this.getAttribute('value')
		this._min = this.getAttribute('min')
		this._max = this.getAttribute('max')
		this._step = this.getAttribute('step')
	}
}
```

Attributes can change. They can be set from outside the component. Your component observe these changes with: `attributeChangedCallback(name, oldValue, newValue)`

If you are using attributes to confgure your component. You'll need to list the attribute names that are being observed and listen for changes.

```js
static get observedAttributes() {
	return ['value', 'min', 'max', 'step'];
}  
```

Listening for changes and look at the name of the property that changed with `attributeChangedCallback(name, oldValue, newValue)`. 

```js
class MyCounter extends HTMLElement {
  ...
  static get observableAttibutes() {
    return ['value', 'min', 'max', 'step']
  }
  ...
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
  ...
```

You can see these methods at work in a live example here: 

https://github.com/Make-School-Labs/simple-component/tree/master/simple-components-templates/01-counter-template

## Activity 

After solving the challenges in the web components examples: https://github.com/Make-School-Labs/simple-component move on to completing your your web component. 

Challenges: 

- Define a template and use it your component. 
- Define styles in the template. 
- Use attributes to comfigure your component. 

## Additional Resources

See the examples. These include starter code, and solutions. 

https://github.com/Make-School-Labs/simple-component

## Minute-by-Minute [OPTIONAL]

| **Elapsed** | **Time**  | **Activity**              |
| ----------- | --------- | ------------------------- |
| 0:00        | 0:05      | Objectives                |
| 0:05        | 0:15      | Overview                  |
| 0:20        | 0:45      | In Class Activity I       |
| 1:05        | 0:10      | BREAK                     |
| 1:15        | 0:45      | In Class Activity II      |
| TOTAL       | 2:00      |                           |
