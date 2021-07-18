
// This class represents a car
// Every time we make a new car we need to register 
// that car and give it a serial number. 

class Tesla {
  constructor(color = 'red') {
    this.color = color
    this.serialNumber = Tesla.registerCar()
  }

  // static count = 0 // Only works in Chrome at the moment

  static registerCar() {
    Tesla.count += 1
    return Tesla.count
  }
}
// Define a static property like this for now until browsers 
// start using the static keyword 
Tesla.count = 0


// Make a tesla factory. This factory turns out a new Tesla
// every 1 sec. The Tesla class keeps track of the total 
// number of cars sold. 

setInterval(() => {
  const color = ['red', 'blue', 'gold'][Math.round(Math.random() * 3)]
  const car = new Tesla(color)
  console.log(car)
  console.log(car.serialNumber)
}, 1000)