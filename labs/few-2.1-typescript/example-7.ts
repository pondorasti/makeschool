
// Use the enum type to define the suit for 
// a playing card. 
// Below define the ace. It should have a suit
// and a value. 

enum Suit {

}

type Card = { suit: Suit, value: number }

const ace: Card = {

}

// Compile the code and check what type script says: 
// tsc example-7.ts

export {
	Suit,
	Card
}