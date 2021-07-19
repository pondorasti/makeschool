// ------------------------------------------------------------
// Get a reference to some DOM elements 
const container = document.getElementById('container');
const overlay = document.getElementById('overlay');
const overlayTitle = document.getElementById('overlay-title');
const alienPower = document.getElementById('alien-power');
const alienRof = document.getElementById('alien-rof');
const alienHealth = document.getElementById('alien-health');
const overlayClose = document.getElementById('overlay-close');


// ------------------------------------------------------------
// Define a class that represents some alien data 
class Alien {
  constructor(info) {
    // Get all of the properties from the object
    for(let key in info) {
      this[key] = info[key];
    }
    // Set up this element
    this.makeElement();
  }
  
  makeElement() {
    // Create an element and add it to the DOM
    this.el = document.createElement('div');
    this.el.classList.add('alien-card');
    this.el.innerHTML = `
    <h1>${this.name}</h1> 
    <img src="${this.image}">`;
  
    // setup clicks on this element
    // this.el.onclick = this.click.bind(this);
    this.el.onclick = (e) => {
      this.click(e);
    };
  }
    
  click(e) {
    // Handle clicks on this element
    console.log(this.name);
    // Your job is to display the data in the overlay...
  }
}

for (var i = 0; i < data.length; i += 1) {
  const alien = new Alien(data[i]);
  container.append(alien.el);
}

// Challenge 

// 1) Clicking an alien card should show the overlay
// 2) Clicking the close button hides the overlay
// 3) Display the info from the clicked element in the overlay
// 4) 



