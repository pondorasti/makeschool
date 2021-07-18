
// You are making a mapping application. 

// Write an enum that defines the directions: 
// North, South, East, West

enum Direction {
	
}

// Should having a heading property type Direction

class MapPosition {

	constructor() {
		
	}

	// takes a new Direction as an argument
	move(newDirection: Direction) {
		// set the direction on your property 
		// Print the new direction
	}

	// Should return a string and print:
	// "you are heading <direction>"
	describe(): string {
		return ''
	}
}

const location = new MapPosition()
console.log(location.describe())
// Might output:
// "You are heading north"
location.move(/* add a direction here */)



export default MapPosition