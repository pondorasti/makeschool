
// This needs some types! 
// Add the types and compile it!

function makeKaiju(name, type, power) {
	let description = `${name} is a `
	description += power > 50 ? `powerful ${type} monster` : `${type} monster `
	return description
}

console.log(makeKaiju('Gojira', 'lizard', 90))
console.log(makeKaiju('Mothra', 'flying', 45))
console.log(makeKaiju('Kong', 'ape', 88))


export {
	makeKaiju
}