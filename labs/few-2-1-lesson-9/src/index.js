const FIZZ = 'fizz'
const BUZZ = 'buzz'
const FIZZBUZZ = 'fizzbuzz'

/** 
 * Returns true when n is divisible by 3 
 * @param {Number} n
 * @returns {Boolean} fizziness 
 * */
function isFizzy(n) {
  return n % 3 === 0
}

/**
 * Returns true when n is divisible by 5
 * @param {Number} n 
 * @returns {Boolean buzziness
 */
function isBuzzy(n) {
  return n % 5 === 0
}

/**
 * Returns FIZZ, BUZZ, or FIZZBUZZ when a number is divisible by 3, 5, or both
 * @param {Number} n
 * @returns {String} '', 'FIZZ', 'BUZZ', or 'FIZZBUZZ'
 */
function fizzyBuzzy(n) {
  let result = ''
  if (isFizzy(n)) { result += FIZZ }
  if (isBuzzy(n)) { result += BUZZ }
  return result
}

/**
 * Generates a results object describing a sequence of fizz buzz for count.
 * @param {Number} count 
 * @returns {Object} with properties count, fizz, buzz, and fizzbuzz
 */
function fizzBuzz(count) {
  let result = { count, fizz: 0, buzz: 0, fizzBuzz: 0 }
  for (let i = 1; i <= count; i += 1) {
    const str = fizzyBuzzy(i)
    switch(str) {
      case FIZZ: 
        result.fizz += 1
        break
      case BUZZ: 
        result.buzz += 1
        break
      case FIZZBUZZ:
        result.fizzBuzz += 1
        break
    }
  }
  return result
}

function test() {
  // console.log(1, fizzBuzz(1))
  // console.log(3, fizzBuzz(3))
  // console.log(5, fizzBuzz(5))
  // console.log(6, fizzBuzz(6))
  // console.log(9, fizzBuzz(9))
  // console.log(10, fizzBuzz(10))
  // console.log(15, fizzBuzz(15))

  // console.log(30, fizzBuzz(30))

  return 'It works!'
}

module.exports.test = test
module.exports.isFizzy = isFizzy
module.exports.isBuzzy = isBuzzy
module.exports.fizzyBuzzy = fizzyBuzzy
module.exports.fizzBuzz = fizzBuzz
module.exports.FIZZ = FIZZ
module.exports.BUZZ = BUZZ
module.exports.FIZZBUZZ = FIZZBUZZ

// export { test, isFizzy, isBuzzy, fizzyBuzzy, fizzBuzz, FIZZ, BUZZ, FIZZBUZZ }