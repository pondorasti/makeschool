# React Concepts

**Components**

React apps are built around components. Components represent presentational elements. In other
words Components are things you see on the screen and interact with. 

Components are composable, 
that is components can contain other components, which can contain still more components. 

**Virtual DOM**

React is built around performance. The DOM is slow and inefficient. ReactDOM (a part of React)
creates a virtual DOM where it stores all of the elements that are displayed. Using a 
virtual DOM allows ReactDOM to identify the elements that need to be updated and instructs the 
browser to only update those elements that have changed.

**JSX**

React introduces an extension to JavaScript: JSX. JSX provides an addition to the JS language 
that allows you to write HTML tags along side your JS code. 

**Transpile**

JSX need to be transpiled into vanilla JS before it can be run in any web browser. 
Transpiling requires files be processed before they are run in the browser. 

The example in this section uses uses an in browser process. Later in class we will precompile 
everything using Webpack. 

## JSX Syntax

A big piece of React is JSX. JSX is an extension of the JavaScript language that adds an XML/HTML
like syntax to regular JavaScript. JSX *must* be compiled before it can be used in a browser.

In short JSX allows you to write HTML like tags alongside vanilla JS. JSX you write creates HTML 
elements that are eventually added to the DOM and displayed in the browser. 

An example of JavaScript and JSX. 

```
function Display() {
    return <div>Hello World</div>;
}
```

You can see the function above returns a div tag. There is no need for quotes. The tag is not treated 
as a string! This is JSX. The function above could be a simple React Component! (We'll talk about
components later...)

JSX has a few syntactical rules that you will learn along the way.  

JSX elements are defined with the same syntax used by HTML elements. 

`<div className="foo"></div>`

JSX elements have Attributes. Attributes defined in `name=value` pairs just like HTML.

`className` is an attribute `foo` is the value. 

When the value is a string just quote it like normal. In JSX the value of an attribute can be 
JavaScript expression, in this case you must wrap the value in the `{expression}`. For example: 

```
var name = "bar";
<div className={bar} width={2 * 100}></div>
```

In the example we want to use a variable as the value of an attribute in a JSX expression, or in the
second case we want to perform a mathematical operation on numeric values. In both cases the 
JavaScript expression must be wrapped in `{}`.

## Components

React Components can be defined in one of two ways. Either as a function that returns JSX, or 
a class that *extends* `React.Component` and includes a `render()` method. 

**Function based component**

```
var ExampleComponent = () => {
  return <h1>Hello World</h1>; // returns JSX expression
}
```

**Class based component**

```
class MyComponent extends Component {
  render() {
    return <h1>Hello World</h1>; // Render method returns JSX expression
  }
}
```

To return a multiline JSX expression wrap it in parenthesis: 

```
class MyComponent extends Component {
  render() {
    // The expression returned here is wrapped in ()
    return (
        <div>
            <h1>Hello World</h1>
        </div>
      ); 
  }
}
```

An empty JSX element can omit the closing tag and end with />. 

`<ExampleComponent />`

or 

`<MyComponent />`

## Attributes and Props

Attribute values are passed into React Component as `props`. Props is always a JS object with keys 
values defined by attirbutes, Here is an example:

**A functional Component with props**

functional components receive props as a parameter. 

```
var MyWidget = (props) => {
  return <h1>{props.message}</h1>;
}

<MyWidget message="Hello" />
```

**Class based Component with props**

Class based components are inialized with props, so props is accessed via `this`.
You should define a `constructor` that takes props. You should call super(props).

```
class MyWidget extends Component {
  constructor(props) {
    super(props)
  }
  render() {
    return <h1>{this.props.message}</h1>;
  }
}

<MyWidget message="FTW" />
```

## Using components

A React component might be written with JSX and might look like this: 

```
<MyWidget message="Hello World" /> 
```

When JSX appears it must always have a top level element. The following is **NOT** legal!

```
<Foo>Hello</Foo>
<Bar>World</Bar>
```
This would be legal:

```
<div>
    <Foo>Hello</Foo>
    <Bar>World</Bar>
</div>
```

## Component Naming

Write regular HTML tags in JSX using lowercase names. Tags with other names are Components. 
When naming components always begin with an uppercase letter. 

### </>

Tags that don't have a closing tag can be self closing with the /. For example:

`<Clock />`

is the same as 

`<Clock></Clock>`

### {}

When the {} appear in a JSX expression everything in the {} is evaluated as a JavaScript expression. 
For example:


`<MyComponent name={props.name} />`

`<CartTotal total={props.array.reduce((a, b)=>{return a + b})} />`

### Attributes in JSX 

**class vs className**

When applying a class name to a tag use `className` in place of `class` (the attribute class collides 
with the JS `class` keyword).

`<FancyWidget className="fancy-class-name" />`

**Values in quotes**

Quoted values assigned to an attribute are always String literal values. 

`<Mathy notANumber="2+2"></Mathy> // props.notANumber == "2+2"`

`<Mathy numeric={2+2} /> // props.numeric == 4`

**Style**

HTML allows CSS code to be written in the style attribute. In JSX use a JS object with style 
property names in camel case. 

HTML use of style attribute

`<div style="background-color: red; width: 400px"></div>`

JSX uses the style attribute like this: 

`<div style={{backgroundColor:"red", width:"400px"}}></div>`

Same as above but may be more clearly expressed like this: 

```
const myStyles = {
    backgroundColor:"red", 
    width:"400px"
};
<div style={myStyles}></div>
```

What's going on in the style examples? Style is set as JS Object with style properties named with
JS style property names. 

**return (...)**

Often you will have a multiline JSX expression to return from a Component. In these cases wrap it 
all in the `(` and `)` and everything is okay!

```
function ComplicatedWidget(props) {
   return ( // <-- 
    <div style={props.color}>
        <Clocky>{this.state.time}</Clocky>
        <ToggleButton title={this.state.isOn} />
    </div>
   );       // <--
} 
```

## Components, props, and state

Components are at the core of React. Components represent reusable UI widgets. Imagine all of the 
UI elements in an App or Web page as being components or groups of comonents. Components can be 
composed, so a complex UI element might be made up of several components.

Components come in two flavors simple/functional and smart/stateful. 

**Simple/Functional Component**

A simple component is a function that takes props as a parameter and returns JSX.

The props object is used to configure the component. 
props is always a JS Object, for example: `{name:"joe", age:33}`.
Simple Components are written as a function that take props as a parameter and return JSX. 

```
function Widget(props) {
    return (
        <div>
            {props.message}
        </div>
    );
} 
```
 
 **Smart/Stateful component**

A smart component is written as a class. It must include a render() method that returns JSX. 

Smart Components use props in the same way as simple Components. These Components also keep 
an internal state. Think of state as variables owned by the Component. 

State is always an object.

*Changing a Component's state causes it to update.*

Smart Components are written as a JS Class. With the following features.

- Take props in the constructor.
- Implements a render() method that returns JSX. 
- Must extend React.Component. 

```
class SmartWidget extends React.Component {
    constructor(props) {
        super(props)
        this.state = {
            count = props.intialCount;
        }
    }
    
    render() {
        return (
            <div className={this.props.className}>
                The Count is : {this.state.count}
            </div>
        );
    }
}
```

## ReactDOM

ReactDOM supplies a virtual DOM to track your Components. All React Components must be children 
of a top level element that is added to ReactDOM via ReactDOM.render(). ReactDOM also takes an 
HTML element that determines where it will render it's virtual DOM. 

A typical use of ReactDOM might look like this: 

```
ReactDOM.render(
    <div>
        <Title title="Simple React Starter" />
        <Clock />
    </div>, 
    document.getElementById('app')
);
```

This renders the Title and Clock components in the element with with id name 'app'.
