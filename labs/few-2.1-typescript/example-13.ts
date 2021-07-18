
// Functions have types add the types for the 
// functions returned below: 

// This function returns a function that returns a number

function count() {
	let n = 0
	return () => {
		return n += 1
	}
}

// This function takes an array and returns an item from
// the array

function next(arr) {
	let i = -1
	return () => {
		i += 1
		i = i === arr.length ? 0 : i
		return arr[i]
	}
}

// This function returns a function that generates a 
// die roll. 

function dice(sides) {
	return (n) => {
		return Math.floor(Math.random() * sides) * n
	}
}

export {
	count,
	next,
	dice
}