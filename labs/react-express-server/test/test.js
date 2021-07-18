/* eslint-disable no-undef */
/* eslint-disable semi */


// Import Chai
const { expect } = require('chai')

// Import the functions you are going to test
const { random, randomD, randomRolls } = require('../utils')

// Describe this set of tests.
// This block should test a single function random() in this case
describe('utils: random()', () => {
  // Test random() returns a number
  it('Expect a number', () => {
    // Throw an error and the test fails
    const n = random(6)
    expect(n).to.be.a('number')
  })

  // Test random() returns an integer
  it('Expects an integer', () => {
    const n = random(6)
    expect(n).to.satisfy(Number.isInteger)
  })

  // Generate some a value to be used in the test
  const max = Math.floor(Math.random() * 94) + 6

  // Expect a number greater than or equal to 0
  it('Expect n >= 0 and ', () => {
    for (let i = 0; i < max; i += 1) {
      const n = random(max)
      expect(n).to.be.at.least(0) // at least 0
      expect(n).to.be.below(max) // below max
    }
  })
})

// Test the randomD() function
describe('utils: randomD()', () => {
  // Is it a number?
  it('Expect a number', () => {
    const n = randomD(6)
    expect(n).to.be.a('number')
  })

  // Is it an integer?
  it('Expects an integer', () => {
    const n = random(6)
    expect(n).to.satisfy(Number.isInteger)
  })

  // Is it >= 1?
  const max = Math.floor(Math.random() * 94) + 6
  it('Expect n >= 1 and ', () => {
    for (let i = 0; i < max; i += 1) {
      const n = randomD(max)
      expect(n).to.be.at.least(1)
      expect(n).to.be.at.most(max)
    }
  })
})

// Test randomRolls()
describe('utils: randomRolls()', () => {
  // Should return an array
  it('Expect an Array', () => {
    const rolls = randomRolls(3, 6)
    expect(rolls).to.be.a('array')
  })

  // Should have at least one roll
  it('Expect an Array with at least one element', () => {
    const rolls = randomRolls(3, 6)
    expect(rolls.length).to.be.at.least(1)
  })

  // Expect all values to be numbers
  it('Expect all items to be numbers', () => {
    const rolls = randomRolls(3, 6)
    expect(rolls.length).to.be.at.least(1)
    rolls.forEach((n) => {
      expect(n).to.be.a('number')
    })
  })
})
