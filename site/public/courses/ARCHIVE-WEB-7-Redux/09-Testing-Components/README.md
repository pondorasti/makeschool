# Testing Components 

Components are hard to test. 

You'll need to identify what is worth testing. 

## Why learn to test components? 

Testing components is a difficult problem that will require 
unique tests for each component. It requires out of the box 
thinking and problem solving. 

Writing tests for components will make you a better programmer. 
having experience writing these kinds of tests will set you 
apart from other prospectives at job interviews. 

## How to Test Components? 

Components generate JavaScript constructs that contain a 
complex system of methods, properties, and state. 

These systems are responsible for rendering HTML content, 
which can often be very complex and nested. 

Testing this type of system is not easy. To make tests you 
will need to examine each component carefully and look for 
the things that need to be tested, and decide how to test 
each of these things. 

## Extract pure functions

Pure functions are functions where the return value is 
determined by only by the input without side effects. 
A pure function will always return the same output for 
the same input without making changes to another 
system or modifying variables elsewhere. 

Pure functions can be tested with unit tests. Unit tests 
are easier to write.

Pure functions can be extracted from a class and 
usually are good as utility functions. So extracting them 
will make your code more DRY. 

Some examples of Pure Functions are: 

- Array.map()
- Array.filter()
- Array.reduce()
- Math.cos()
- Math.sin()

Note: Technically Math.random() is not pure because you 
can predict the output. For practical purposes you can 
consider it pure for testing. That said testing functions
that return random values is harder than testing 
deterministic functions. 

### Challenge: Find the Pure functions

Take a look at your components and find the pure functions. 
Any class methods that are pure can be moved out of a
component class into another module and imported. 
From here you can create unit tests for these utility 
functions. 

Look for functions that return a value and don't cause 
any side effects. You might be able to refactor a function
or other code block to make a function to pure function. 

## Testing Components 

Testing components is more difficult.

**Testing Component/Containers** connected to Redux is 
even harder! 

What kinds of things can you test? 

- Does an HTML element exist? 
- Is the text content of an element what you expect?
- Are values in state or props what they should be? 
- Was a method called? 

### Testing simple components

Simple components take in props, don't maintain state, 
and are not connected to the Redux store. This makes
these easier to test than stateful component/containers. 

Tests for these types of components will generally look
at what you expect the component to display. 

### Challenge: Test a simple component

Find a simple component. This is a component that 
doesn't maintain state, and is not connected to 
Redux. 

If you don't have a component that fits this description
make one! Seriously, this type of component can be created
by refactoring just about every component you have 
already created, and it will almost always be an improvement. 

**Setup**

Write a test for your component. Create a file with the 
same name, in the same folder as your component and 
'.test.js' at the end of the name. 

This component will need to import some methods from 'enzyme'
setup and configure these. 

```JavaScript
import { shallow, configure } from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';
configure({ adapter: new Adapter() });
```

From here you can test your component. Try testing 
if elements are being rendered, and what the text content 
of the element is. 

Here is an example. This tests component that should 
display the name and time from a timer that is passed
in as props. 

```JSX
import React from 'react';
import { shallow, configure } from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';
configure({ adapter: new Adapter() });

import TimerTitle from './timer-title';
import Timer from '../reducers/timer';

describe('TimerTitle', () => {
  it('Should render', () => {
    // A value to display 
    const name = "Hello";
    // This timer is an object passed in as props 
    const timer = new Timer(name);
    // Generate an instance of TimerTitle with enzyme.shallow()
    const timerTitle = shallow(<TimerTitle timer={timer} />);
    
    // Test the shallow render of the component
  
    // Find an element with the class name: timer-view-name__h2, expect 1
    expect(timerTitle.find('.timer-view-name__h2').length).toBe(1);
    // Check the text content of this element, expect it to match the name above
    expect(timerTitle.find('.timer-view-name__h2').text()).toEqual(name);
    // Find an element with the class name: timer-view-time__h1, expect 1
    expect(timerTitle.find('.timer-view-time__h1').length).toBe(1);
    // Check the text content of this element expect it to be "0:0:0.0"
    expect(timerTitle.find('.timer-view-time__h1').text()).toEqual('0:0:0.0');
  });
});
```

**Enzyme.shallow()** renders only the top level elements in a component. 

http://airbnb.io/enzyme/docs/api/shallow.html

shallow returns a 'ShallowWrapper' in Enzyme terms. They describe it as:
'The wrapper instance around the rendered output'. Think of it as an 
object representing the rendered component with added methods that you 
can use to test against. 

ShallowWrapper has methods that give you a look at the interior of the
component it wraps. 

The sample code above uses `.find()` to search the rendered node for 
elements with class names. It also uese the `.text()` method to get 
the text content of an element to check it agains an expected value. 

There are many more methods that can be used to look at components in
different ways. Probably the two most important concepts are finding
an element and look at it's content. 

Here is a full list of methods supported by ShallowWrapper. 

- find()
- findWhere()
- filter()
- filterWhere()
- hostNodes()
- contains()
- containsMathingElements()
- containsAllMatchingElements()
- containsAnyMatchingElements()
- equals()
- matchesElement()
- hasClass()
- is()
- exists()
- isEmpty()
- isEmptyRender()
- not()
- children()
- childAt()
- parents()
- parent()
- closest()
- shallow()
- render()
- unmount()
- text()
- html()
- get()
- getNodes()
- at()
- first()
- last()
- state()
- context()
- props()
- props()
- key()
- simulate()
- setState()
- setProps()
- setContext()
- instance()
- update()
- debug()
- type()
- name()
- forEach()
- map()
- reducer()
- reduceRight()
- slice()
- tap()
- some()
- someWhere()
- every()
- everyWhere()
- dive()

That's a lot of methods. Read the descriptions for these at the link above. 

You can divide these methods into methods that search the DOM of the 
rendered component, setup, and utilities. 

## Resources 

- End to End Testing with Puppeteer
- https://blog.bitsrc.io/testing-your-react-app-with-puppeteer-and-jest-c72b3dfcde59

