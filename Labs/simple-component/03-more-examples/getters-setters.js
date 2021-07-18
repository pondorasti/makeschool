/*
Getters and setters are methods that look like 
properties. The class below creates a simple 
counter. 

Internally it stores a property: _count. 
Externally you can get or set the property: count

The class also creates an html element, el, which it 
attaches to the DOM. This class displays the value
of count in this element. 

Then the count property is set we want el to 
update and display the new value. Normally you'd 
have to by calling a method since setting a 
property doesn't run a code block. 

Use a setter you can run a code block when setting
a property. 

*/

class GetterSetterExample {
  constructor(value = 0) {
    this._count = value

    this.el = document.createElement('div')
    this.el.style.fontSize = '50px'
    this.el.fontWeight = 'bold'

    document.querySelector('body').appendChild(this.el)
    
    this.render()
  }

  get count() {
    return this._count
  }

  set count(value) {
    this._count = value
    this.render()
  }

  render() {
    this.el.innerHTML = this._count
  }
}
const gs = new GetterSetterExample(99) 

setInterval(() => {
  gs.count = gs.count + 1
}, 1000)