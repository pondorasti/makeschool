// -----------------------------------------------------
// 

console.log('0.1 + 0.2 !== 0.3', 0.1 + 0.2)
console.log((0.3).toString(2))

console.log('new Number(2) === 2', new Number(2) === 2)

const a = (255).toString(); // "255" (default is radix 10)
const b = (255).toString(2); // "11111111" (radix 2, i.e. binary)
const c = (255).toString(16); // "ff" (radix 16, i.e. hexadecimal)
const d = (1.1).toString(2)

console.log(a)
console.log(b)
console.log(c)
console.log(d)

const red = (123).toString(16); 
const green = (87).toString(16); 
const blue = (255).toString(16);

console.log('#'+red+green+blue) // #7b57ff

console.log((0x7b).toString(10)) // 123

const dollars = 87.67
const tax = 8.5
const total = (dollars * tax / 100).toFixed(2) // 7.45
console.log(total)

console.log(parseFloat('0.85%'))
console.log(parseFloat('Tax 0.85%'))
console.log(parseInt('100px')) // 100
console.log(parseInt('0.85%')) // 0
console.log(parseInt('f00')) // NaN
console.log(parseInt('f00', 16)) // 3840
console.log(parseInt('ff', 16)) // 255



// ------------------------------------------------
class Money {
  constructor(value = 0) {
    this.value = value
  }

  addCents(amount) {
    return new Money(this.value + amount)
  }

  addDollars(amount) {
    return this.addCents(Math.round(amount * 100))
  }

  getTax(percent) {
    return new Money(Math.round(this.value * percent / 100))
  }

  format() {
    return `$${(this.value / 100).toFixed(2)}`
  }

  valueOf() {
    console.log('-- valueOf')
    return this.value
  }

  toString() {
    console.log('-- toString')
    return this.format()
  }
}

const m1 = new Money(7500) // $75
console.log('$75', m1.format())
const m2 = m1.addCents(99)
console.log('$75.99', m2.format())
const m3 = m2.addDollars(25.01)
console.log('$101.00', m3.format())
const t1 = m3.getTax(8.5)
console.log('8.5%', t1.format())
console.log('valueOf() ', m1 + 1)
console.log('toString(): ' + m1.toString())

// https://www.npmjs.com/package/dinero.js
// https://www.npmjs.com/package/money-math
// https://www.npmjs.com/package/currency.js
// 


// Chaining Methods
class Thing {
  constructor(value = 0) {
    this.value = value
  }

  multiply(n) {
    this.value *= n
    return this
  }

  add(n) {
    this.value += n
    return this
  }

  divide(n) {
    this.value /= n
    return this
  }

  subtract(n) {
    this.value -= n
    return this
  }
}

const thing = new Thing(10)
thing.add(1).multiply(2).subtract(3).divide(4)
console.log((((10 + 1) * 2) - 3) / 4, thing.value)


class Widget {
  constructor(value = 0) {
    this.value = value
  }

  multiply(n) {
    return new Widget(this.value *= n)
  }

  add(n) {
    
    return new Widget(this.value += n)
  }

  divide(n) {
    return new Widget(this.value /= n)
  }

  subtract(n) {
    return new Widget(this.value -= n)
  }
}


const widget = new Widget(10)
console.log((((10 + 1) * 2) - 3) / 4, widget.add(1).multiply(2).subtract(3).divide(4).value)


const aa = {
  n: 99,
  increment() {
    this.n += 1
    return this.n
  }
}

const bb = {}
bb.increment = aa.increment

console.log(aa.increment()) // 100
console.log(bb.increment()) // NaN

bb.n = 0
console.log(bb.increment()) // 1


console.log(Math.E, Math.LN10, Math.LN2, Math.LOG10E, Math.LOG2E, Math.PI, Math.SQRT1_2, Math.SQRT2)

console.log(Number.MAX_SAFE_INTEGER)
console.log(Number.MIN_SAFE_INTEGER)
console.log(Number.MAX_SAFE_INTEGER.toString(2))
console.log(Number.MAX_SAFE_INTEGER.toString(2).length)

const pennies = [6.66, 6.66, 6.66]

const valueLeftOver = 2

while(valueLeftOver > 0) {
  pennies[i] += 0.01
  valueLeftOver -= 1
}

for (var i = 0; i < valueLeftOver; i += 1) {
  pennies[i] += 0.01
}

pennies[0] += 0.01 // 
pennies[1] += 0.01

// [6.67, 6.67, 6.66]





class Num {
  
}

Num.round = function(n) {
  return Math.round(n)
}

Num.round(9.44) // 9

// ----------------------------

Number.prototype.round = function() {
  return Math.round(this)
}

(9.44).round() // 9

// -------

Math.round(9.44)

// ---------------------

function round(n) {
  return Math.round(n)
}

import { round } from './AliMath'

round(9.44)

