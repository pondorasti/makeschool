const fb = require('../src/index')
// import { test, isFizzy, isBuzzy, fizzyBuzzy, fizzBuzz, FIZZ, BUZZ, FIZZBUZZ } from '../index'

test('Testing', () => {
  expect(fb.test()).toBe('It works!')
})

test('Test isFizzy', () => {
  expect(fb.isFizzy(1)).toBe(false)
  expect(fb.isFizzy(3)).toBe(true)
  expect(fb.isFizzy(4)).toBe(false)
  expect(fb.isFizzy(6)).toBe(true)
})

test('Test isBuzzy', () => {
  expect(fb.isBuzzy(1)).toBe(false)
  expect(fb.isBuzzy(5)).toBe(true)
  expect(fb.isBuzzy(6)).toBe(false)
  expect(fb.isBuzzy(15)).toBe(true)
})

test('Test fizzyBuzzy', () => {
  expect(fb.fizzyBuzzy(1)).toBe('')
  expect(fb.fizzyBuzzy(3)).toBe(fb.FIZZ)
  expect(fb.fizzyBuzzy(5)).toBe(fb.BUZZ)
  expect(fb.fizzyBuzzy(15)).toBe(fb.FIZZBUZZ)
}) 

test('Test fizzBuzz', () => {
  expect(fb.fizzBuzz(1).count).toBe(1)
  expect(fb.fizzBuzz(15).count).toBe(15)

  expect(fb.fizzBuzz(1).fizz).toBe(0)
  expect(fb.fizzBuzz(1).buzz).toBe(0)
  expect(fb.fizzBuzz(1).fizzBuzz).toBe(0)

  expect(fb.fizzBuzz(3).fizz).toBe(1)
  expect(fb.fizzBuzz(3).buzz).toBe(0)
  expect(fb.fizzBuzz(3).fizzBuzz).toBe(0)

  expect(fb.fizzBuzz(5).fizz).toBe(1)
  expect(fb.fizzBuzz(5).buzz).toBe(1)
  expect(fb.fizzBuzz(5).fizzBuzz).toBe(0)

  expect(fb.fizzBuzz(6).fizz).toBe(2)
  expect(fb.fizzBuzz(6).buzz).toBe(1)
  expect(fb.fizzBuzz(6).fizzBuzz).toBe(0)

  expect(fb.fizzBuzz(15).fizz).toBe(4)
  expect(fb.fizzBuzz(15).buzz).toBe(2)
  expect(fb.fizzBuzz(15).fizzBuzz).toBe(1)

  expect(fb.fizzBuzz(30).fizz).toBe(8)
  expect(fb.fizzBuzz(30).buzz).toBe(4)
  expect(fb.fizzBuzz(30).fizzBuzz).toBe(2)
}) 

