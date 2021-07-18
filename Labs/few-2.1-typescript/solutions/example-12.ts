
// You are making a mapping application. 

// Write an enum that defines the directions: 
// North, South, East, West

enum Direction {
	N = 'North',
	S = 'South',
	E = 'East',
	W = 'West'
}

// Should having a heading property type Direction

class MapPosition {
	direction: Direction
	constructor() {
		this.direction = Direction.N
	}

	// takes a new Direction as an argument
	move(newDirection: Direction) {
		// set the direction on your property 
		this.direction = newDirection
		// Print the new direction
		console.log(`New heading ${this.direction}`)
	}

	// Should return a string and print:
	// "you are heading <direction>"
	describe(): string {
		return `you are heading ${this.direction}`
	}
}

console.log(new MapPosition().describe())
// Might output:
// "You are heading north"


export default MapPosition