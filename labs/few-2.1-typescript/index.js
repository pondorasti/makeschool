
const a = [1,2,3]
const b = [...a] // copies a

const names = []
const prices = []

console.log(a)
console.log(b)

console.log(a === b) // true or false 

b.push(7)

console.log(a)
console.log(b)

const f = [6,1,2,5,8,9,3,2]

const e = f.filter((item, i, arr) => {
	return i < 3
})

console.log(e)