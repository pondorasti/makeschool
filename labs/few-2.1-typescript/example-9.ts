

// Currently the function below uses a string for
// for the type of monster. Better to use an enum
// since monsters are only: lizard, flying, ape

// Define an enum for monster type

enum MonsterType {
	
}

// Add the types here and use the enum for type. 

function rampage(name, type, power, city) {
	let action: string
	switch(type) {
		case 'ape': 
			action = 'smash'
			break

		case 'lizard':
			action = 'burn'
			break

		case 'flying': 
			action = 'flap'	
			break
	} 
	let result = `${name} ${action} over ${city} causing ${power * 10000} damage!`
	return result
}

// Use the enum here when calling the rampage function

console.log(rampage('Gojira', 'lizard', 90, 'tokyo'))
console.log(rampage('Mothra', 'flying', 40, 'Fresno'))
console.log(rampage('Kong', 'ape', 88, 'New York'))
